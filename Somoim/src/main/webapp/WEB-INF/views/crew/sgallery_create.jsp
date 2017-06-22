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
							사진올리기 <small>사진을 업로드합니다.</small>
						</h1>
					</div>
				</div>

				<div class="row">
					<form class="form-group">
						<label>아이디</label> <input class="form-control" type="text"
							name="name" id="name" readonly="readonly" placeholder="아이디가져오기">
					</form>
				</div>

				<form id="myForm" action="sgallery_create" method="post">
					<div class="filebox">
						<!-- <label class="form-control" class="fileUpload" for="fileUpload">업로드할 파일 선택하기</label>  -->
						<input id="fileUpload" type="file" id="file">
						<input class="btn btn-primary form-control submit_form"	id="submit_btn" type="submit">
						<button class="btn btn-danger form-control reset_btn" id="reset_btn" type="reset">취소</button>
					</div>

					<div class="row">
						<ul class="clearfix uploadedList"></ul>
					</div>

				</form>


				<script id="source" type="text/x-handlebars-template"> 
					<li class="col-xs-3"> 
						<span><img alt="첨부파일" src="{{imgsrc}}"></span> 
					<div> 
						<a href="{{getLink}}">{{fileName}}</a> 
						<a href="{{sg_picture}}" class="btn btn-default btn-xs pull-right delbtn"> 
						<span class="glyphicon glyphicon-remove-circle"></span> </a> 
					</div> 
					</li> 
				</script>


				<script type="text/javascript">
					$(document).ready(function() {
						var source = $("#source").html();
						var template = Handlebars.compile(source);

						$("input[type=file]").change(function(event) {
							event.preventDefault();
							var files = event.target.files;
							var file = files[0];

							var formData = new FormData();
							formData.append("file",	file);
							
							$.ajax({
								type : 'post',
								url : '/uploadAjax',
								data : formData,
								dataType : 'text',
								processData : false,
								contentType : false,
								success : function(result) {
									var data = getFileInfo(result);
									var ht = template(data);
									$(".uploadedList").html(ht);
								}
							});
						});

						 $("#submit_btn").on("click", function(event) {
							event.preventDefault();
							var files = event.target.files; 
							var formData = new FormData();
							formData.append("file",	files);

							var form = $("#myForm");
							var str = "";

							str += "<input value='"+$(".delbtn").attr("href")+"' name='sg_picture' type='hidden'>";
								
							form.append(str);
							form.get(0).submit();
						}); 
					});
				</script>

			</div>
		</div>
	</div>
</body>