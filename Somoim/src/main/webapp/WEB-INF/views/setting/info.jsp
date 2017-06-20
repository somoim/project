<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	
		<div id="container">
			<ul class="list-group">
				<li class="list-group-item list-group-item-info">운영자  연락</li>
				
				<li class="list-group-item info_detail">
				
				 <div class="name"> 
					 	<span>사용자 이미지</span> <label>아이디</label> <label id="birth"><small>생년월일</small></label>
					 	<label class="pull-right">거주지</label>
				 	<hr>
					 	<div class="info">
					 		<p>자기소개</p>
					 	</div>
				 	<hr>
					 	<div class="category">
						<span>관심사 이미지들</span> 
						 <button class="btn btn-primary pull-right">설정</button>
					 	</div>
				 </div>
				
				</li>
				
				<li class="list-group-item disabled" style="height: 20px;"></li>
				
					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseOne" aria-expanded="true"
										aria-controls="collapseOne">개설 소모임 리스트(모임장만)</a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">
									<table class="table">
										<thead>
											<tr>
												<th>번호</th>	<th>소모임제목</th>	<th>소모임인원</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>aaa</td> <td>aaa</td> <td>aaa</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
					
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseTwo" aria-expanded="true"
									aria-controls="collapseOne">가입 소모임 리스트</a>
							</h4>
						</div>
						
						<div id="collapseTwo" class="panel-collapse collapse in"
							role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								<table class="table">
										<thead>
											<tr>
												<th>번호</th>	<th>소모임제목</th>	<th>소모임인원</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>aaa</td> <td>aaa</td> <td>aaa</td>
											</tr>
										</tbody>
								</table>

							</div>
						</div>
	
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseThree" aria-expanded="true"
									aria-controls="collapseOne">가입 정모 리스트</a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse in"
							role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								<table class="table">
									<thead>
										<tr>
				 							<th>번호</th>	<th>소모임제목</th>	<th>소모임인원</th>	<th>정모제목</th>
				 							<th>정모인원</th>
				 						</tr>
									</thead>
									<tbody>
										<tr>
											<td>aaa</td> <td>aaa</td> <td>aaa</td> <td>aaa</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
					
					

			
				
				
				<li class="list-group-item disabled">기본정보</li>
				<li class="list-group-item">공지사항</li>
				<li class="list-group-item">도움말</li>
				<li class="list-group-item">버전정보</li>
				<li class="list-group-item disabled">알림설정</li>
				<li class="list-group-item">채팅 알림 설정</li>
				<li class="list-group-item">게시글 알림 설정</li>
				<li class="list-group-item">태그 메시지 알림 설정</li>

			</ul>
		</div>
	</div>

</body>
</html>