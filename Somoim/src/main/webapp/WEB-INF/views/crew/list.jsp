<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<div class="panel panel-warning" id="crew_list">
			<c:forEach items="${list}" var="crewVO">
				<div class="panel-heading">
					<span>No. ${crewVO.cno} </span> &nbsp;&nbsp; <span class="text-right">${crewVO.join_cnt} / ${crewVO.attend_cnt} 명</span>
				</div>
				<div class="panel-body">
					<p>${crewVO.region}</p>
					<p>${crewVO.title}</p>
					<p>정모날짜/장소 ... c:if로 정모날짜 확인 후 표시???</p>
				</div>
			</c:forEach>
		</div>
		<!--  -->
	</div>
</div>
</body>