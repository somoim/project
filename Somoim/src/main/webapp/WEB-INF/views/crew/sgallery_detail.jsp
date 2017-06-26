<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
</style>
</head>
<body>
	<!-- 모바일 Layout -->
	<div id="mobile">
		<div id="container">
			<!-- 여기서부터 시작 -->
			
			<form role="form" method="post">
				<input value="${sgallery_vo.sg_no}" name="sg_no" >
				<input value="${sgallery_vo.sg_picture}" name="sg_picture" >
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
							<img class="form-control" alt="사진들어가는 곳"
								src="">
						</div>
					</div>



						<div class="form-group">
							<button type="submit" class="btn btn-primary" id="reply_form">
								<span class="glyphicon glyphicon-pencil"></span> 댓글
							</button>


							<button type="submit" class="btn btn-danger" id="delete_form">
								<span class="glyphicon glyphicon-trash"></span> 삭제
							</button>

							<button type="submit" class="btn btn-info" id="list_form">
								<span class="glyphicon glyphicon-align-justify"></span> 사진첩
							</button>
						</div>
				</div>




				<script type="text/javascript">
			
			
				</script>

			</div> <!-- class: container -->
		</div> <!-- id: container -->
	</div> <!-- mobile -->
</body>