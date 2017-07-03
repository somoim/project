<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js" type="text/javascript"></script>
<style type="text/css">
.show_img{
	text-align: center; 
}
#show_re_content{
    background-color: transparent;
    border: 0px;
    border-radius: 0px; 
 }
</style>
</head>
<body>
	<!-- 모바일 Layout -->
	<div id="mobile">
		<div id="container">
			<!-- 여기서부터 시작 -->
			
			<form role="form" method="post">
				<input value="${sGalleryVO.cno}" name="cno"  type="hidden" >
				<input value="${sGalleryVO.sg_no}" name="sg_no"  type="hidden" >
				<input value="${sGalleryVO.sg_picture}" name="sg_picture"  type="hidden">
				
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
							<h3 class="panel-title">${name}<br> ${sGalleryVO.sg_writeday}</h3>
						</div>
						<div class="panel-body">
							<div class="show_img">
								<img src="/displayFile?fileName=${sGalleryVO.sg_picture}" alt="사진사진">
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
			
			
					
			<div id="replies" class="row jump">
				
			</div>
				
				
				<div class="row">
			<div data-backdrop="static" class="modal fade" id="myModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
						 	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						 		<span aria-hidden="true">&times;</span>
						 	</button>
						 	<div>
							 	re_no: <span id="modal_re_no"> </span>	
						 	</div>
						</div>
						<div class="modal-body">
							<p>내용을 수정하세요</p>
							<input class="form-control" id="modal_re_content">
						</div>
						<div class="modal-fotter" align="right">
							<button id="modal_update" type="button" class="btn btn-default" data-dismiss="modal">수정</button>
							<button id="modal_delete" type="button" class="btn btn-warning" data-dismiss="modal">삭제</button>
							<button id="modal_close" type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
				
			
			
			<script id="source" type="text/x-handlebars-template">
				{{#each.}}
					<div class="panel panel-info">
						<div class="panel-heading">
							<span>re_no: {{re_no}}, 작성자: <span class="glyphicon glyphicon-user"></span>{{mid}}</span>
							 <span class="pull-right"><span class="glyphicon glyphicon-time"></span> {{re_writeday}}</span>
						</div>
			
						<div class="panel-body input-group">
							<p data-re_no="{{re_no}}" id="show_re_content" class="input-group-addon">{{re_content}}</p>
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
								url : "/replies/sgallery",
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
						
						
						$("#reply_form").click(function() {
							$("#myCollapsible").collapse("toggle");
						});
						
					
						$("#replyInsertBtn").on("click", function() {
							var re_content = $("#re_content").val();
							
							$.ajax({
								type : "post",
								url : "/replies",
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
						
						
						$("#replies").on("click", ".callModal", function() {
							var re_no = $(this).prev("p").attr("data-re_no");
							var re_content = $(this).prev("p").text();
							
							$("#modal_re_no").text(re_no);
							$("#modal_re_content").val(re_content);
							
							$("#myModal").modal("show");
						});
						
						$("#modal_update").on("click", function() {
							var re_no = $("#modal_re_no").text();
							var re_content = $("#modal_re_content").val();
							
							$.ajax({
								type:"put",
								url: "/replies/"+re_no,
								headers: {
									"Content-Type":"application/json",
									"X-HTTP-Method-Override":"PUT"
								},
								dataType: "text",
								data: JSON.stringify({
									re_content:re_content
								}),
								success: function(result) {
									if(result=="UPDATE_SUCCESS"){
										alert("댓글 수정 성공");
										$("#myModal").modal("hide");
										AllReplyLlst(1, 1);
									}
								}
							});
						});

						$("#modal_delete").on("click", function() {
							var re_no = $("#modal_re_no").html();
						
							$.ajax({
								type:"delete",
								url: "/replies/"+re_no,
								headers:{
									"Content-Type":"application/json",
									"X-HTTP-Method-Override":"DELETE"
								},
								dataType: "text",
								success: function(result) {
									if(result=="DELETE_SUCCESS"){
										alert("댓글 삭제 성공");
										$("#myModal").modal("hide");
										AllReplyLlst(1, 1);
									}
								}
							});
						});
						
						
						
						function AllReplyLlst(cno, sg_no) {
							$.getJSON("/replies/sgallery/"+cno+"/"+ sg_no, function(data) {
								var source = $("#source").html();
								var template = Handlebars.compile(source);
								console.log(template);
								var gab = data;
								$("#replies").html(template(gab));
								
							});
						}
						
					});
				</script>
			</div> <!-- class: container -->
		</div> <!-- id: container -->
	</div> <!-- mobile -->
</body>