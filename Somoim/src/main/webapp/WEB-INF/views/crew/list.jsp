<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.navAct02 { color:#493334 !important; font-weight:bold; background-color:#eeeeee;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$(".getCno").each(function(idx){
			var cno = $(this).attr("data-cno");	
			getsList(cno);
		});
		
		// 상세보기
		$(".crewList").click(function() {
			var cno = $(this).attr("data-cno");
			self.location="/crew/tab_list?cno="+cno;
		});
		
		// 소모임 개설버튼
		$(".fixedBtn2").click(function() {
			self.location="/crew/create";
		});
	});
	
	function getsList(cno){
		$.getJSON("/crew/list_sList/"+cno, function(data) {
			console.log(data);
			var source = $("#source").html();
			var template = Handlebars.compile(source);
			$(".next_sList"+cno).html(template(data));
		});
	}
	
</script>
<script id="source" type="text/x-handlebars-template">
	<p> 정모 : {{attend_title}} | 일시 : {{attend_date}} | 장소 : {{attend_region}} </p>
</script>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
		<!-- 여기서부터 시작 -->
		<c:forEach items="${list}" var="crewVO" >
			<div class="panel panel-warning crewList" data-cno="${crewVO.cno}">
				<div class="panel-heading">
					<span data-cno="${crewVO.cno}" class="getCno">No. ${crewVO.cno} </span> &nbsp;&nbsp; <span class="pull-right"> ${crewVO.join_cnt} / ${crewVO.attend_cnt} 명</span>
				</div>
				<div class="panel-body">
					<p>${crewVO.region}</p>
					<p>${crewVO.title}</p>
					<div class="next_sList${crewVO.cno}"></div>
				</div>
			</div>
		</c:forEach>
		<!-- 버튼 레이아웃 -->		
		<div class="fixedBtn2">
			<span><span class="glyphicon glyphicon-plus"></span></span>
			<span>방개설</span>
		</div>
		<!--  -->
	</div>
</div>

</body>