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
			<div class="container">
				<div class="row">
					<div class="page-header">
						<h1>
							사진작성하기 <small>글을 작성합니다</small>
						</h1>
					</div>
				</div>
				<div class="row">
					<form action="" method="post">

						<input value="${cri.page}" name="page" type="hidden"> <input
							value="${cri.perPageNum}" name="perPageNum" type="hidden">

						<div class="form-group">
							<label for="title">제목</label> <input name="title" id="title"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="writer">작가</label> <input name="writer" id="writer"
								class="form-control">
						</div>

						<div class="form-group">
							<label for="content">내용</label>
							<textarea name="content" id="content" class="form-control"></textarea>
						</div>
					</form>

					<div class="row">
						<div class="form-group">
							<label>업로드할 파일을 드랍시키세요</label>
							<div class="fileDrop">drag & drop</div>
						</div>

						<ul class="clearfix uploadedList">

						</ul>
					</div>

					<div class="form-group">
						<button class="btn btn-primary" type="submit" id="submit_form">
							<span class="glyphicon glyphicon-check"></span> 등록
						</button>
						<button class="btn btn-danger" type="reset">
							<span class="glyphicon glyphicon-remove"></span> 초기화
						</button>
						<button class="btn btn-info" type="submit" id="list_form">
							<span class="glyphicon glyphicon-align-justify"></span> 목록
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>