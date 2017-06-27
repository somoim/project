<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.thumbnail{
	width:200px;
	height:200px;
} 

.thumbnail img{
	width:100%;
	height:100%;
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
			<li><a href="../crew/tab_list">정보</a></li>
			<li class="act"><a href="../crew/tab_board">게시판</a></li>
			<li><a href="../crew/tab_gallery">사진첩</a></li>
			<li><a href="../crew/tab_chat">채팅</a></li>
		</ul>

		<div id="container">
			<!-- 여기서부터 시작 -->
			<div class="container">
		
		<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">이름 작성일</h3>
  </div>
  <div class="panel-body">
   제목 내용
  </div>
</div>
		


				
				<!-- 버튼 레이아웃 -->
				<a href="sboard_create" class="fixedBtn"> <span><span
						class="glyphicon glyphicon-pencil"></span></span> <span>글쓰기</span>
				</a>


				<script type="text/javascript">
					});
				</script>

			</div>
			<!-- class="container" -->
		</div>
		<!-- id="container" -->
	</div>
	<!-- mobile -->
</body>