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
		 height: 100px;
	}
	
	#birth{
		color: gray;
	}
	
	.panel-heading{
		border-bottom: solid 1px black;
	}
	
	
</style>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
		<div class="panel panel-info"> 
			<div class="panel-heading">
				<h4 class="panel-title">관리자 페이지</h4>
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
		
		<!-- 관리자 : 전체회원수 / 소모임수 / 소모임별 회원수 / 회원삭제 / 소모임삭제 -->
		<!-- 경영자 : 전체회원수 / 소모임수 / 소모임별 회원수 / 총 방문자수 -->
		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			<div class="panel panel-default">
				<div class="panel-heading">
					<p>전체 회원수 <span class="pull-right"> ${memberCnt} 명</span> </p>
				</div>
				<div class="panel-heading">
					<p>소모임 수 <span class="pull-right"> ${crewCnt} 개</span> </p>
				</div>
				<div class="panel-heading" role="tab" id="headingOne">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							소모임 별 회원 수</a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body">
						<table class="table">
							<thead>
								<tr>
									<th>소모임 제목</th>
									<th>지역</th>
									<th>카테고리</th>
									<th>소모임 인원</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${crewList}" var="crewVo">
									<tr>
										<td>${crewVo.title}</td>
										<td>${crewVo.region}</td>
										<td>${crewVo.category}</td>
										<td>${crewVo.join_cnt}/${crewVo.attend_cnt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
				<!-- 경영자만 보이게 -->
				<c:if test="${login.power==3}">
					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
								총 방문자 수<span class="pull-right"> ${visitorCnt} 명</span> </a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
						<div class="panel-body">
							<table class="table">
								<thead>
									<tr>
										<th>일자</th>
										<th>방문자수</th>	
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${visitorList}" var="visitorVO">
										<tr>
											<td>${visitorVO.visit_day}</td>
											<td>${visitorVO.count} 명</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</c:if>		
				
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