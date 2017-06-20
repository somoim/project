<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
iframe {
	width: 0px;
	height: 0px;
	border: 0px;
}

.filebox {
	margin-top: 20px;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #337ab7;
	cursor: pointer;
	border: 1px solid #2e6da4;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
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
							사진올리기 <small>사진을 업로드합니다.</small>
						</h1>
					</div>
				</div>

				<div class="row">
					<form class="form-group">	
						<label>아이디</label>
						<input class="form-control" type="text" name="name" id="name" readonly="readonly" placeholder="아이디가져오기">
					</form>
				</div>
			
				<form target="zeroframe" enctype="multipart/form-data" id="form1" action="gallery_create" method="post">
					<div class="filebox">
						<label for="fileUpload">업로드</label> 
						<input id="fileUpload"	type="file" name="file"> 
						<input type="submit" class="btn btn-primary">
					</div>
				</form>

				<iframe name="zeroframe"></iframe>

				<script type="text/javascript">
					function addFilePath(msg) {
						alert(msg);
						document.getElementById("form1").reset();
				
					}
				</script>

			</div>
		</div>
	</div>
</body>