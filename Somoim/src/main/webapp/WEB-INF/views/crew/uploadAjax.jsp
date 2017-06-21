<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.fileDrop {
	width: 100%;
	height: 200px;
	border: 1px dotted red;
}
</style>

</head>
<body>
	<!-- 모바일 Layout -->
	<div id="mobile">
		<div id="container">
			<!-- 여기서부터 시작 -->
			<div class="fileDrop"></div>
			<div class="uploadedList"></div>

			<script type="text/javascript">
				$(".fileDrop").on("dragenter dragover", function(event) {
					event.preventDefault();
				});
				$(".fileDrop").on("drop", function(event) {
					event.preventDefault();
					var files = event.originalEvent.dataTransfer.files;
					var file = files[0];
					
					var formData = new FormData();
					formData.append("file", file);
					
					$.ajax({
						type: 'post',
						url: 'uploadAjax',
						data: formData,
						dataType: 'text',
						processData: false,
						contentType: false,
						success: function(data) {
							alert(data);
						}
					});
				});
			</script>

		</div>
	</div>
</body>