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
				<input value="${vo.sb_no}" name="sb_no"  type="hidden" >
				<input value="${vo.sb_picture}" name="sb_picture"  type="hidden">
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
								<img src="/displayFile?fileName=${vo.sb_picture}" alt="사진사진">
							</div>
						</div>
					</div>



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

				<script type="text/javascript">
					$(document).ready(function() {
						
						var $form = $("form[role='form']");
					
						$("#tab_gallery_form").on("click", function() {
							$form.attr("method", "get");
							$form.attr("action", "/crew/tab_board");
							$form.submit();
						});
						
						$("#delete_form").on("click", function() {
							var result = confirm("정말 삭제하시겠습니까?");
							if (!result) {	return false;	}
								$form.attr("method", "post");
								$form.attr("action", "/crew/sboard_delete"); //위에 들어가 있으므로 안해도 됨
								$form.submit();
						});
					});
					
					
					
			
				</script>

			</div> <!-- class: container -->
		</div> <!-- id: container -->
	</div> <!-- mobile -->
</body>