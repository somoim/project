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
<script type="text/javascript">
	$(document).ready(function(){	
		
	});
</script>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
		<!-- 여기서부터 시작 -->
		<div class="panel panel-default" id="search_title">
			<div class="panel-heading">
				<input class="" id="searchTitle" placeholder="모임명을 입력하세요">
				<button class="btn btn-default">검색<span class="glyphicon glyphicon-search"></span></button>
			</div>
		</div>
		<div class="panel panel-default" id="category_list">
			<div class="panel-heading">
				<h3 class="panel-title">카테고리를 선택하세요</h3>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><a href="/search/searchCrew?category=아웃도어/여행">아웃도어/여행</a></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><a href="/search/searchCrew?category=운동/스포츠">운동/스포츠</a></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><a href="/search/searchCrew?category=인문학/책/글">인문학/책/글</a></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><a href="/search/searchCrew?category=외국/언어">외국/언어</a></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><a href="/search/searchCrew?category=문화/공연">문화/공연</a></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><a href="/search/searchCrew?category=음악/악기">음악/악기</a></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><a href="/search/searchCrew?category=공예/만들기">공예/만들기</a></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><a href="/search/searchCrew?category=댄스/무용">댄스/무용</a></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><a href="/search/searchCrew?category=봉사활동">봉사활동</a></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><a href="/search/searchCrew?category=사교/인맥">사교/인맥</a></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><a href="/search/searchCrew?category=차/오토바이">차/오토바이</a></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><a href="/search/searchCrew?category=사진">사진</a></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><a href="/search/searchCrew?category=야구관람">야구관람</a></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><a href="/search/searchCrew?category=게임/오락">게임/오락</a></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><a href="/search/searchCrew?category=요리/제조">요리/제조</a></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><a href="/search/searchCrew?category=반려동물">반려동물</a></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><a href="/search/searchCrew?category=가족/결혼">가족/결혼</a></h4>
			</div>
			<div class="panel-body">
				<h4 class="panel-title"><a href="/search/searchCrew?category=자유주제">자유주제</a></h4>
			</div>
			
		</div>
		<!--  -->
	</div>
</div>
</body>