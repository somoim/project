<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.text-right{
	text-align: right;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		/* 
		$(".getScno").each(function(idx){
			var sCno = $(this).attr("data-scno");

			$(".getCno").each(function(idx){
				var cno = $(this).attr("data-cno");		
				if(sCno == cno){
					getsList(cno);
					return;
				}
			});
		});
		 */
		
		$(".getCno").each(function(idx){
			var cno=$(this).attr("data-cno");
			getsList(cno);
		});
		
	});
	
	function getsList(cno){
		$.getJSON("/crew/list_sList/"+cno, function(data) {
			console.log(data);
			var source = $("#source").html();
			var template = Handlebars.compile(source);
			$(".next_sList").append(template(data));
		});
	}
	
</script>
<script id="source" type="text/x-handlebars-template">
	<p>no. {{cno}} | 날짜 : {{attend_date}} | 장소 : {{attend_region}} | 제목 : {{attend_title}} </p>
</script>
<script type="text/javascript">

</script>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
		<!-- 여기서부터 시작 -->
		<div class="panel panel-warning" id="crew_list">
			<c:forEach items="${list}" var="crewVO">
				<div class="panel-heading">
					<span data-cno="${crewVO.cno}" class="getCno">No. ${crewVO.cno} </span> &nbsp;&nbsp; <span class="text-align"> ${crewVO.join_cnt} / ${crewVO.attend_cnt} 명</span>
				</div>
				
				<div class="panel-body">
					<p>${crewVO.region}</p>
					<p>${crewVO.title}</p>
					<div class="next_sList"></div>
					
				</div>
			</c:forEach>
			<%-- 
			<c:forEach items="${sList}" var="sVO">
				<span data-scno="${sVO.cno}" class="getScno"></span>
			</c:forEach>
			 --%>
		</div>
		<!--  -->
	</div>
</div>
</body>