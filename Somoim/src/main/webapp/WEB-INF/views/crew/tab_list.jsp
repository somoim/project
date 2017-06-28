
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#header { display:none;}
	#footer { display:none;}
	#container { height:100%; padding-top:95px; margin-bottom:0;}
	.sub_tab { display:table; width:100%; position: fixed; top:55px;}
	.sub_tab li { display: table-cell; width:25%; text-align:center; height:40px; line-height:39px; background-color: #ffffff; font-size:14px; font-weight:bold; color:#929292; border-bottom:1px solid #929292;}
	.sub_tab li a { display:block; color:inherit;}
	.sub_tab li a:hover { color:inherit; text-decoration: none;}
    .sub_tab li:hover { height:40px; line-height:38px; color:#493334; border-bottom: 2px solid #493334;}
    .sub_tab li.act { height:40px; line-height:38px; color:#493334; border-bottom: 2px solid #493334;}
    .panel{margin-bottom: auto;}
    .power{color: red;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		
		// 뒤로가기
		$(".backCont").click(function() {
			self.location="/crew/list";
		});
		
		$(".sList").click(function(){
			self.location="#"
		});
		
		var cno = $(".getCno").val();
		$(".role").on("click","button",function(){
			var mid=$(this).attr("data-mid");
			$.ajax({
				type : "get",
				url : "/crew/update_Role/"+cno,
				data : {
					mid : mid
				},
				dataType : "text",
				success:function(result){
					self.location="/crew/tab_list";
				}
			});
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
			정보탭
		</div>
		<div class="snsCont">
			<!-- <span class="glyphicon glyphicon-new-window"></span> -->
			<span class="glyphicon glyphicon-option-vertical"></span>
		</div>
	</header>
	<ul class="sub_tab">
		<li class="act"><a href="../crew/tab_list">정보</a></li>
		<li><a href="../crew/tab_board">게시판</a></li>
		<li><a href="../crew/tab_gallery">사진첩</a></li>
		<li><a href="../crew/tab_chat">채팅</a></li>
	</ul>
	<div id="container" class="container">
		<div class="row">
			  <div class="col-xs-12 col-md-12">
			    <a href="#" class="picture">
			      <img src="../resources/img/mobile/images.jpg" alt="" width="100%;" height="120px">
			    </a>
			  </div>
		</div>
		<div class="row">
			 <div class="input-group">
				  <span class="input-group-addon" id="basic-addon1" style="background-color: white;">${crewVO.category}</span>
				  <input type="text" value="${crewVO.title}" class="form-control" aria-describedby="basic-addon1" readonly="readonly" style="background-color: white;">
				  <input class="getCno" value="${crewVO.cno}" type="hidden">
			</div>
		</div>
		<div class="row">
			<div class="content">
				${crewVO.content}
			</div>
		</div>
		<div class="row">
			<button class="form-control sList"><span class="glyphicon glyphicon-plus"></span>새로운 정모 만들기</button>
			<div class="panel panel-default">
			  <!-- Default panel contents -->
			  <c:forEach items="${sList_list}" var="sList">
			  <div class="panel-heading">${sList.attend_title}</div>
			  <!-- List group -->
			  <ul class="list-group">
			    <li class="list-group-item">${sList.attend_date}</li>
			    <li class="list-group-item">${sList.attend_region}</li>
			    <li class="list-group-item">${sList.attend_money}</li>
			  </ul>
			  </c:forEach>
			</div>
			
		</div>
		<div class="row role" >
			<c:forEach items="${member_list}" var="member">
				<h5 class="col-xs-12 col-xs-offset-1">${member.name} 
					<c:if test="${crewVO.role == member.mid}">
					<span class="col-xs-offset-8 power">운영자</span>
					</c:if>
					<c:if test="${crewVO.mid == member.mid}">
					<span class="col-xs-offset-8 power">모임장</span>
					</c:if>
					<c:if test="${crewVO.role != member.mid && crewVO.mid == login.mid && crewVO.mid != member.mid}">
					<button class="btn btn-success col-xs-offset-8" data-mid="${member.mid}">운영자위임</button>
					</c:if>
				</h5>
			</c:forEach>
		</div>
	</div>
		<!-- 버튼 레이아웃 -->		
		<a href="#" class="fixedBtn">
			<span><span class="glyphicon glyphicon-pencil"></span></span>
			<span>글쓰기</span>
		</a>
	

</div>


</body>

