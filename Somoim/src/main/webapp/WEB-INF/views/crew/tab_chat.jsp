<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#header { display:none;}
	#footer { display:none;}
	#container { height:100%; margin-top:0; margin-bottom:0;}
	.sub_tab { display:table; width:100%; position: fixed; top:55px;}
	.sub_tab li { display: table-cell; width:25%; text-align:center; height:40px; line-height:39px; background-color: #ffffff; font-size:14px; font-weight:bold; color:#929292; border-bottom:1px solid #929292;}
	.sub_tab li a { display:block; color:inherit;}
	.sub_tab li a:hover { color:inherit; text-decoration: none;}
    .sub_tab li:hover { height:40px; line-height:38px; color:#493334; border-bottom: 2px solid #493334;}
    .sub_tab li.act { height:40px; line-height:38px; color:#493334; border-bottom: 2px solid #493334;}
    .msg{ background-color: white;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$(".send").click(function(){
			$("form").attr("action", "tab_chat");
			$("form").attr("method", "post");
			$("form").get(0).submit(); 
		});
	});
</script>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<header id="header2">
		<div class="backCont">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</div>
		<div class="titleCont">
			채팅
		</div>
		<div class="snsCont">
			<span class="glyphicon glyphicon-new-window"></span>
			<span class="glyphicon glyphicon-option-vertical"></span>
		</div>
	</header>
	<ul class="sub_tab">
		<li><a href="../crew/tab_list">정보</a></li>
		<li><a href="../crew/tab_board">게시판</a></li>
		<li><a href="../crew/tab_gallery">사진첩</a></li>
		<li class="act"><a href="../crew/tab_chat">채팅</a></li>
	</ul>
	<div id="container" class="container">
		
			<div class="row">
				<div class="form-group"><br><br><br><br>
				<c:forEach items="${list}" var="x">
					<p>${x.mid}</p>
					<label class="msg">${x.msg}</label><h6>${x.ch_date}</h6>
				</c:forEach>
				</div>
			</div>
		<form action="/crew/tab_chat" method="post">
			<div class="row">
				<div class="input-group">
					<input name="mid" id="mid" value="m001" hidden="hidden">
					<input name="cno" id="cno" value="1" hidden="hidden">
					<input type="text" class="form-control" placeholder="메세지를 입력하세요" name="msg" id="msg">
					<span class="input-group-btn">
					<button class="btn btn-default send" type="submit">보내기</button>
					</span>
				</div><!-- /input-group -->
			</div>
		</form>
	</div>
</div>

</body>

