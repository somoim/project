<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.navAct01 { color:#493334 !important; font-weight:bold; background-color:#eeeeee;}
</style>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
			<ul class="list-group">
				
				<li class="list-group-item info_detail">
				
				 <div class="name"> 
					 	<span>사용자 이미지</span> <label>${memberVo.mid}</label> <label id="birth"><small>${memberVo.birth}</small></label>
					 	<label class="pull-right">${memberVo.address}</label>
				 	<hr>
					 	<div class="info">
					 		<p>자기소개</p>
					 	</div>
				 	<hr>
					 	<div class="category">
							<span>관심사 이미지들</span> 
					 	</div>
				 </div>
				
				</li>	
				
					
				<li class="list-group-item disabled">가입한 모임</li>
				<li class="list-group-item">
				
					<table class="table">
						<thead>
							<tr>
								<td>소모임 이름</td>	
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>111</td> 
							</tr>
							<tr>
								<td>222</td> 
							</tr>
						</tbody>
					</table>
				</li>
			</ul>
		</div>
	</div>
</body>

