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
		<div class="panel panel-default">
			<div class="panel-heading">
				<p>가입한 모임</p>
			</div>
			<c:forEach items="${join_list}" var="join">
				<div class="panel-body" style="border: 1px dotted gray;">
						<p><span>${join.title}</span> <span class="text-right">${join.join_cnt} / ${join.attend_cnt} 명</span></p>
						<p>정모날짜/장소</p>
				</div>
			</c:forEach>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<p>맞춤 추천 모임</p>
			</div>
			<c:forEach items="${sel_list}" var="sel">
				<div class="panel-body" style="border: 1px dotted gray;">
						<p>정모 요일/날짜/시간</p>
						<p>
							<span>${sel.region}</span> |  
							<span>${sel.title}</span> | 
							<span>정모장소</span>
						</p>
						<p><span class="text-right">${sel.join_cnt} / ${sel.attend_cnt} 명</span></p>
				</div>
			</c:forEach>
		</div>
		<!--  -->
	</div>
</div>
</body>

