<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	
	.info_detail{
		 height: 200px;
	}
	
	#birth{
		color: gray;
	}
	
	.panel-heading{
		border-bottom: solid 1px black;
	}
	
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$(".attendDate").each(function(idx){
			var date = $(this).attr("data-date");
			
			var year = date.substring(0, 4);
			var month = date.substring(4, 6);
			var day = date.substring(6, 8);
			var hour = date.substring(8, 10);
			var minute =date.substring(10, 12);
			
			var str = year + "/" + month + "/" + day + " " + hour + "시" + minute + "분";
			$(".date"+date).html(str);
		});
	});
</script>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
		<div class="panel panel-info"> 
			<div class="panel-heading">
				<h4 class="panel-title"><a href="#">운영자 e-mail</a></h4>
				<small> 소모임 삭제를 원하면 메일주세요</small>
			</div>
		</div>
		<div class="panel">
			<div class="panel-heading">
				<label>${memberVo.name}</label>
				<label id="birth"><small>${memberVo.birth}</small></label>
			 	<label class="pull-right">${memberVo.address}</label>
			</div>
			<div class="panel-body">
				<div class="category">
					<span>관심 카테고리 : ${memberVo.category}</span> 
					<button class="btn btn-primary pull-right">설정</button>
				</div>
			</div>
		</div>
		
		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			<div class="panel panel-default">

				<div class="panel-heading" role="tab" id="headingOne">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							개설 소모임 리스트</a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body">
						<table class="table">
							<thead>
								<tr>
									<th>제목</th>
									<th>지역</th>
									<th>카테고리</th>
									<th>인원</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${openCrewList}" var="openCrew">
									<tr>
										<td>${openCrew.title}</td>
										<td>${openCrew.region}</td>
										<td>${openCrew.category}</td>
										<td>${openCrew.join_cnt}/${openCrew.attend_cnt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
		
				<div class="panel-heading" role="tab" id="headingTwo">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
							가입 소모임 리스트</a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					<div class="panel-body">
						<table class="table">
							<thead>
								<tr>
									<th>제목</th>
									<th>지역</th>
									<th>카테고리</th>
									<th>인원</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${joinCrewList}" var="joinCrew">
									<tr>
										<td>${joinCrew.title}</td>
										<td>${joinCrew.region}</td>
										<td>${joinCrew.category}</td>
										<td>${joinCrew.join_cnt}/${joinCrew.attend_cnt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="panel-heading" role="tab" id="headingThree">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
							참여 정모 리스트</a>
					</h4>
				</div>
				<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
					<div class="panel-body">
						<table class="table">
							<thead>
								<tr>
		 							<th>소모임 제목</th>
		 							<th>소모임 인원</th>
		 							<th>정모 제목</th>
		 							<th>정모 장소</th>
		 							<th>정모 일시</th>
		 							<th>금액</th>
		 							<th>정모 인원</th>
		 						</tr>
							</thead>
							<tbody>
								<c:forEach items="${joinSlist}" var="joinSlist">
									<tr>
										<td>${joinSlist.title}</td>
										<td>${joinSlist.join_cnt}/${joinSlist.crew_attend_cnt}</td>
										<td>${joinSlist.attend_title}</td>
										<td>${joinSlist.attend_region}</td>
										<td data-date="${joinSlist.attend_date}" class="attendDate">
											<span class="date${joinSlist.attend_date}"></span> </td>
										<td>${joinSlist.attend_money}</td>
										<td>${joinSlist.s_join_cnt}/${joinSlist.slist_attend_cnt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
			</div>
		</div>
		
		<div class="panel-group" id="accordionEtc" role="tablist" aria-multiselectable="true">	
			<div class="panel panel-default">
				<div class="panel-heading">
					<p>기본정보</p>
				</div>
				<div class="panel-body">
					<div class="panel-heading" role="tab" id="etc_notice_head">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordionEtc" href="#etc_notice" aria-expanded="true" aria-controls="etc_notice">
								공지사항</a>
						</h4>
					</div>
					<div id="etc_notice" class="panel-collapse collapse" role="tabpanel" aria-labelledby="etc_notice_head">
						<div class="panel-body">공지사항 내용 입니다</div>
					</div>
					
					<div class="panel-heading" role="tab" id="etc_info_head">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordionEtc" href="#etc_info" aria-expanded="true" aria-controls="etc_info">
								도움말</a>
						</h4>
					</div>
					<div id="etc_info" class="panel-collapse collapse" role="tabpanel" aria-labelledby="etc_info_head">
						<div class="panel-body">도움말 내용 입니다</div>
					</div>
					
					<div class="panel-heading" role="tab" id="etc_version_head">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordionEtc" href="#etc_version" aria-expanded="true" aria-controls="etc_version">
								버전정보</a>
						</h4>
					</div>
					<div id="etc_version" class="panel-collapse collapse" role="tabpanel" aria-labelledby="etc_version_head">
						<div class="panel-body">버전정보 : 1.0.0 </div>
					</div>
				</div>
				
				<div class="panel-heading">
					<p>알림설정</p>
				</div>
				<div class="panel-body">
					<div class="panel-heading" role="tab" id="etc_chat_head">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordionEtc" href="#etc_chat" aria-expanded="true" aria-controls="etc_chat">
								채팅 알림 설정</a>
						</h4>
					</div>
					<div id="etc_chat" class="panel-collapse collapse" role="tabpanel" aria-labelledby="etc_chat_head">
						<div class="panel-body">채팅 알림 설정 내용 입니다</div>
					</div>
					
					<div class="panel-heading" role="tab" id="etc_board_head">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordionEtc" href="#etc_board" aria-expanded="true" aria-controls="etc_board">
								게시글 알림 설정</a>
						</h4>
					</div>
					<div id="etc_board" class="panel-collapse collapse" role="tabpanel" aria-labelledby="etc_board_head">
						<div class="panel-body">게시글 알림 설정 내용 입니다</div>
					</div>
					
					<div class="panel-heading" role="tab" id="etc_tag_head">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordionEtc" href="#etc_tag" aria-expanded="true" aria-controls="etc_tag">
								태그 메시지 알림 설정</a>
						</h4>
					</div>
					<div id="etc_tag" class="panel-collapse collapse" role="tabpanel" aria-labelledby="etc_tag_head">
						<div class="panel-body">태그 메시지 알림 설정 내용 입니다</div>
					</div>
				</div>
				
			</div>
		</div>
			
	</div>
</div>
</body>
</html>