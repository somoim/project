<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#fileUpload { margin-bottom: 5px;}
.list_btn { margin-top: 5px; margin-bottom:30px;}

.imgsize{ max-height:100%; max-width:100%;}
.uploadedList { margin: 20px 0 30px 0; min-height:150px; background-color: #fff; padding: 20px; border-radius: 10px; border: 1px solid #ddd;}
.imgshow { width: 25%;}
.imgshow>div,.imgshow>span { display:inline-block; width: 100%;}
.imgshow div a:first-child { width: 80%; display:inline-block;}
.delbtn { border: 0px; padding: 2px 4px; border-radius: 5px; background-color: #fff; display: inline-block;}
.delbtn:hover { padding: 2px 4px; border-radius: 5px; background-color: #fff; display: inline-block;}
</style>
</head>
<body>
	<!-- 모바일 Layout -->
	<div id="mobile">
		<div id="container">
			<!-- 여기서부터 시작 -->
			<div class="container">
				<input value="${vo.cno}" name="cno" id="cno" type="hidden">
				<input value="${vo.sb_no}" name="sb_no" id="sb_no" type="hidden"> 
				<input value="	${vo.sb_picture}" name="sb_picture" type="hidden" >
			
				<div class="row">
					<div class="picTitle">
						<h6>
							게시글 수정하기 <small>글을 수정합니다.</small>
						</h6>
					</div>
				</div>

				<div class="">
					<form id="myForm" action="" method="post">
						<div class="form-group">
							<label>아이디</label>
							<input class="form-control" name="mid" id="mid" value="${login.mid}" readonly="readonly" >
						</div>
						
						<div class="form-group">
							<label>제목</label>
							<input class="form-control" name="sb_title" id="sb_title" value="${vo.sb_title}">
						</div>
						
						<div class="form-group">
							<label>내용</label>
							<textarea rows="10" cols="3" class="form-control" name="sb_content" id="sb_content">${vo.sb_content}</textarea>
						</div>

							<div class="filebox">
								<input id="fileUpload" type="file" id="file">
								<div class="form-group">
									<ul id="uploadedList" class="clearfix uploadedList">
									
									</ul>	
								</div>
							</div>
						<input class="btn btn-primary form-control submit_form"	id="submit_btn" type="submit">
					</form>
						<a href="/crew/tab_board?cno=${vo.cno}" class="btn btn-danger form-control list_btn" id="list_btn">게시판으로 이동</a>

					<script id="source" type="text/x-handlebars-template"> 
						<li class="imgshow"> 
							<span><img class="imgsize" alt="첨부파일" src="{{imgsrc}}"></span> 
						   <div> 
						    	<a href="{{getLink}}">{{fileName}}</a> 
						    	<a href="{{sg_picture}}" class="delbtn"> 
						    	<span class="glyphicon glyphicon-remove-circle"></span> </a> 
						  </div>
						</li> 
					</script>

				

				<script type="text/javascript">
					$(document).ready(function() {
						
						
						var source = $("#source").html();
						var template = Handlebars.compile(source);
						getPicture(sb_no);
						
						function getPicture(sb_no) {
							var result = $("input[name=sb_picture]").val();
							
							alert(result);
							
							if(result != "base.jpg"){
								var data = sBoard_getFileInfo(result);
								var ht = template(data);
								$(".uploadedList").html(ht);
							} 
						}
						
						 $("#submit_btn").on("click", function() {
							var sb_no = $("#sb_no").val();
							var cno = $("#cno").val();	
							 
							 
							var files = event.target.files; 
							var formData = new FormData();
							formData.append("file",	files);

							var form = $("#myForm");
							var str = "";
							
							var img = $(".delbtn").attr("href");
							
							alert(img);
							
							str += "<input value='"+$(".delbtn").attr("href")+"' name='sb_picture' type='hidden'>";
							
							alert(str);
						
							form.append(str);
						 	form.attr("method", "post");
							form.attr("action", "/crew/sboard_update?cno="+${vo.cno}+"&sb_no="+${vo.sb_no});
							form.get(0).submit(); 
							alert("게시글이 수정되었습니다.");
							 
							
						 });
						 
						
						
						$("input[type=file]").change(function(event) {
							event.preventDefault();
							var files = event.target.files;
							var file = files[0];

							var formData = new FormData();
							formData.append("file",	file);
							
							$.ajax({
								type : 'post',
								url : '/uploadAjax/sboard',
								data : formData,	
								dataType : 'text',
								processData : false,
								contentType : false,
								success : function(result) {
									var data = sBoard_getFileInfo(result);
									var ht = template(data);
									$(".uploadedList").html(ht);
								}
							});
						});

						
							
						 $(".uploadedList").on("click", "li div .delbtn", function(event) {
							event.preventDefault();
							var delBtn = $(this);
							var delLi = $(this).parent("div").parent("li");
							
							$.ajax({
								type:"post",
								url:"/deleteFile/sboard",
								data:{
									fileName : delBtn.attr("href")
								},
								dataType: "text",
								success: function(result) {
									if(result == "DELETE_SUCCESS"){
										delLi.remove();
										alert("취소되었습니다.");	
										$("input[type=file]").val("");
									}
								}
							});
						}); 
						
					});
				</script>
				
				</div> <!-- class : row -->
			</div> <!-- class: container -->
		</div> <!-- id: container -->
	</div> <!-- mobile -->
</body>