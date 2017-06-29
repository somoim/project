<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.show_img{
	text-align: center; 
}
</style>
</head>
<body>
	<!-- 모바일 Layout -->
	<div id="mobile">
		<div id="container">
			<!-- 여기서부터 시작 -->
			
			<form role="form" method="post">
				<input value="${vo.cno}" name="cno"  type="hidden" >
				<input value="${vo.sg_no}" name="sg_no"  type="hidden" >
				<input value="${vo.sg_picture}" name="sg_picture"  type="hidden">
			</form>
			
			<div class="container">

				<div class="row">
					<div class="page-header">
						<h1>
							사진보기 <small>사진을 확인합니다.</small>
						</h1>
					</div>
				</div>



				<div class="row">
					<div class="panel panel-warning">
						<div class="panel-heading">
							<h3 class="panel-title">이름 작성일</h3>
						</div>
						<div class="panel-body">
							<div class="show_img">
								<img src="/displayFile?fileName=${vo.sg_picture}" alt="사진사진">
							</div>
						</div>
					</div>


						<!-- 버튼 -->
						<div class="form-group">
							<button type="submit" class="btn btn-primary" id="reply_form">
								<span class="glyphicon glyphicon-pencil"></span> 댓글
							</button>


							<button type="submit" class="btn btn-danger" id="delete_form">
								<span class="glyphicon glyphicon-trash"></span> 삭제
							</button>

							<button type="submit" class="btn btn-info" id="tab_gallery_form">
								<span class="glyphicon glyphicon-align-justify"></span> 사진첩
							</button>
						</div>
				</div>
				
				
			<!-- 댓글 작성 -->		
			<div class="row collapse" id="myCollapsible" >
				<div class="form-group">
					<label for="name">작성자 이름</label>
					<input id="name" class="form-control" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="re_content">내용</label>
					<input id="re_content" class="form-control">
				</div>
				<div class="form-group">
					<button id="replyInsertBtn" class="btn btn-default">등록</button>
					<button id="replyResetBtn"  class="btn btn-danger">초기화</button>
				</div>
			</div>
			
			
					
			<div style="border: 1px solid red; height: 10px;" id="replies" class="row jump">
				
			</div>
				
			
			
			<script id="source" type="text/x-handlebars-template">
				{{#each.}}
					<div class="panel panel-info">
						<div class="panel-heading">
							<span>re_no: {{re_no}}, 작성자: <span class="glyphicon glyphicon-user"></span>{{mid}}</span><span class="pull-right"><span class="glyphicon glyphicon-time"></span> {{re_writeday}}</span>
						</div>
			
						<div class="panel-body input-group">
							<p data-re_no="{{re_no}}" id="showReplyText" class="input-group-addon">{{re_content}}</p>
							<button class="btn btn-default btn-sm btn-group-addon pull-right callModal">
								<span class="glyphicon glyphicon-check"></span> 수정/삭제
								<span class="glyphicon glyphicon-trash"></span> </button>
						</div>
					</div>
				{{/each}}
			</script>

				<script type="text/javascript">
					$(document).ready(function() {
						
						var $form = $("form[role='form']");
						AllReplyLlst(1, 1);
						
						$("#tab_gallery_form").on("click", function() {
							$form.attr("method", "get");
							$form.attr("action", "/crew/tab_gallery");
							$form.submit();
						});
						
						$("#delete_form").on("click", function() {
							var result = confirm("정말 삭제하시겠습니까?");
							if (!result) {	return false;	}
								$form.attr("method", "post");
								$form.attr("action", "/crew/sgallery_delete"); //위에 들어가 있으므로 안해도 됨
								$form.submit();
						});
						
						

						$("#reply_form").click(function() {
							$("#myCollapsible").collapse("toggle");
						});
						
					
						$("#replyInsertBtn").on("click", function() {
							var re_content = $("#re_content").val();
							
							$.ajax({
								type : "post",
								url : "/replies/",
								data : {
									re_content : re_content
								},
								dataType : "text",
								success : function(result) {
									alert("댓글 입력 성공");
									$("#re_content").val("");
									$("#myCollapsible").collapse("toggle");
									AllReplyLlst(1, 1);
								}
							});
						});
						
						
						function AllReplyLlst(cno, sg_no) {
							$.getJSON("/replies/"+cno+"/"+ sg_no, function(data) {
								var source = $("#source").html();
								var template = Handlebars.compile(source);
								var gab = data.list;
								
								$("#replies").html(template(gab));
								
							});
						}
						
					});
				</script>
			</div> <!-- class: container -->
		</div> <!-- id: container -->
	</div> <!-- mobile -->
</body>