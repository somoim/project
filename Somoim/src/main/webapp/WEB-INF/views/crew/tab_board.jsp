<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.thumbnail {
	width: 200px;
	height: 200px;
}

.thumbnail img {
	width: 100%;
	height: 100%;
}

.thumbnail_list {
	margin-top: 20px;
}

#header {
	display: none;
}

#footer {
	display: none;
}

#container {
	height: 100%;
	margin-top: 95px;
	margin-bottom: 0;
}

.sub_tab {
	display: table;
	width: 100%;
	position: fixed;
	top: 55px;
}

.sub_tab li {
	display: table-cell;
	width: 25%;
	text-align: center;
	height: 40px;
	line-height: 39px;
	background-color: #ffffff;
	font-size: 14px;
	font-weight: bold;
	color: #929292;
	border-bottom: 1px solid #929292;
}

.sub_tab li a {
	display: block;
	color: inherit;
}

.sub_tab li a:hover {
	color: inherit;
	text-decoration: none;
}

.sub_tab li:hover {
	height: 40px;
	line-height: 38px;
	color: #493334;
	border-bottom: 2px solid #493334;
}

.sub_tab li.act {
	height: 40px;
	line-height: 38px;
	color: #493334;
	border-bottom: 2px solid #493334;
}
</style>
</head>
<body>
	<!-- 모바일 Layout -->
	<div id="mobile">
		<header id="header2">
			<div class="backCont">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</div>
			<div class="titleCont">게시판탭</div>
			<div class="snsCont">
				<span class="glyphicon glyphicon-new-window"></span> <span
					class="glyphicon glyphicon-option-vertical"></span>
			</div>
		</header>
		<ul class="sub_tab">
			<li><a href="../crew/tab_list?cno=${cno}">정보</a></li>
			<li class="act"><a href="../crew/tab_board?cno=${cno}">게시판</a></li>
			<li><a href="../crew/tab_gallery?cno=${cno}">사진첩</a></li>
			<li><a href="../crew/tab_chat?cno=${cno}">채팅</a></li>
		</ul>

	<div id="container">
		<div class="container">
		
			<div class="row">
				
					<div class="list-group">
					
					<c:forEach items="${list}" var="sboard_vo">
						<form role="form" method="post">
							<input value="${sboard_vo.sb_no}" name="sb_no" type="hidden">
							<input value="${sboard_vo.cno}" name="cno"  type="hidden">
						</form>
						
					<a href="#" class="list-group-item" data-sb_no="${sboard_vo.sb_no}" data-cno="${sboard_vo.cno}">
						<h4 class="list-group-item-heading">
							<p>${sboard_vo.mid}</p>
							<p>${sboard_vo.sb_writeday}</p>
						</h4>
						<hr>
						<p class="list-group-item-text">
							<p>${sboard_vo.sb_title}</p>
							<p>${sboard_vo.sb_content}</p>
						</p>
					</a>	
						</c:forEach>
					</div>
			</div>
	
		<!-- 버튼 레이아웃 -->
		<a href="/crew/sboard_create?cno=${cno}" class="fixedBtn"> <span><span
				class="glyphicon glyphicon-pencil"></span></span> <span>글쓰기</span>
		</a>

		<script type="text/javascript">
			$(document).ready(function() {
				$(".list-group-item").on("click", function(event) {
					event.preventDefault();
					
					var sb_no = $(this).attr("data-sb_no");
					var cno = $(this).attr("data-cno");
					
					alert("sb_no::: "+sb_no); 	
					alert("cno::: "+cno); 
					
					self.location="/crew/sboard_detail?cno="+cno+"&sb_no="+sb_no;
				});
			});
			
			// 뒤로가기
			$(".backCont").click(function() {
				self.location="/crew/list";
			});
		
		</script>
				
			</div>
		</div>
	</div>	<!-- mobile -->
</body>