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
		$(".getCno").each(function(idx){
			var cno = $(this).attr("data-cno");	
			getsList(cno);
		});
	});
	
	function getsList(cno){
		$.getJSON("/my/list_sList/"+cno, function(data) {
			console.log(data);
			var source = $("#source").html();
			var template = Handlebars.compile(source);
			$(".next_sList"+cno).html(template(data));
		});
	}
</script>
<script id="source" type="text/x-handlebars-template">
	<p>정모 : {{attend_title}} | 일시 : {{attend_date}} | 장소 : {{attend_region}} </p>
</script>
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
			<c:forEach items="${attend_list}" var="join">
				<div class="panel-body" style="border: 1px dotted gray;">
						<p data-cno="${join.cno}" class="getCno"><span>${join.title}</span> <span class="text-right">${join.join_cnt} / ${join.attend_cnt} 명</span></p>
						<div class="next_sList${join.cno}"></div>
				</div>
			</c:forEach>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<p>맞춤 추천 모임</p>
			</div>
			<c:forEach items="${sel_list}" var="sel">
				<div class="panel-body" style="border: 1px dotted gray;">
						<div class="next_sList${sel.cno}"></div>
						<p data-cno="${sel.cno}" class="getCno">
							<span>${sel.region}</span> |  
							<span>${sel.title}</span>
						</p>
						<p><span class="text-right">${sel.join_cnt} / ${sel.attend_cnt} 명</span></p>
				</div>
			</c:forEach>
		</div>
		<!--  -->
	</div>
</div>
</body>