<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.navAct04 { color:#493334 !important; font-weight:bold; background-color:#eeeeee;}
</style>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
			회원가입수정..header 필요
			<form class="myform">	
				<div class="form-group">
					<label>이름</label>
					<input class="form-control" type="text" name="name" id="name" placeholder="본인이름">
					<br>
					
					<label>성별</label>
					남성<input type="radio" name="gender" id="gender" value="1" checked="checked">
					여성<input type="radio" name="gender" id="gender" value="2">
					<br>
					<br>
					
					<label>아이디</label>
					<input class="form-control" name="mid">
					<br>
					
					<label>비밀번호</label>
					<input class="form-control" name="password">
					<br>
					<label>비밀번호 확인</label>
					<input class="form-control" name="password">
					<br>
				
					<label>생년월일</label>
					<div class="row">
						<div class="col-sm-4">
							<select	name="searchType" class="selectpicker" id="ssel" data-width="150px">
								<!-- <option disabled>검색기준</option> -->
								<option value="2013">2013</option>
						        <option value="2012">2012</option>
						        <option value="2011">2011</option>
						        <option value="2010">2010</option>
			 			        <option value="2009">2009</option>
			 			        <option value="2008">2008</option>
						        <option value="2007">2007</option>
						        <option value="2006">2006</option>
						        <option value="2005">2005</option>
						        <option value="2004">2004</option>
						        <option value="2003">2003</option>
						        <option value="2002">2002</option>
						        <option value="2001">2001</option>
						        <option value="2000">2000</option>
								</select>년
						</div> <!-- 년도 select -->
						<div class="col-sm-4">
							<select	name="searchType" class="selectpicker" id="ssel" data-width="150px">
								<option value="1">1</option>
						        <option value="2">2</option>
						        <option value="3">3</option>
						        <option value="4">4</option>
						        <option value="5">5</option>
						        <option value="6">6</option>
						        <option value="7">7</option>
						        <option value="8">8</option>
						        <option value="9">9</option>
						        <option value="10">10</option>
						        <option value="11">11</option>
						        <option value="12">12</option>
							</select>월
						</div> <!-- 월 select -->
						<div class="col-sm-4">
							<select	name="searchType" class="selectpicker" id="ssel" data-width="150px">
							   <option value="1">1</option>
						       <option value="2">2</option>
						       <option value="3">3</option>
						       <option value="4">4</option>
						       <option value="5">5</option>
						       <option value="6">6</option>
						       <option value="7">7</option>
						       <option value="8">8</option>
						       <option value="9">9</option>
						       <option value="10">10</option>
						       <option value="11">11</option>
						       <option value="12">12</option>
						       <option value="13">13</option>
						       <option value="14">14</option>
						       <option value="15">15</option>
						       <option value="16">16</option>
						       <option value="17">17</option>
						       <option value="18">18</option>
						       <option value="19">19</option>
						       <option value="20">20</option>
						       <option value="21">21</option>
						       <option value="22">22</option>
						       <option value="23">23</option>
						       <option value="24">24</option>
						       <option value="25">25</option>
						       <option value="26">26</option>
						       <option value="27">27</option>
						       <option value="28">28</option>
						       <option value="29">29</option>
						       <option value="30">30</option>
						       <option value="31">31</option>
							</select>일
						</div> <!-- 월 select -->
					</div> <!-- 생년월일 div -->
					<br>
					     
					<label>거주지역</label>
					<input class="form-control" name="address">
					<br>
					
					<label>핸드폰번호</label>
					<input  class="form-control" type="tel" name="pNum" title="전화번호를 입력하세요."	placeholder="0**-000*-0000"	pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13">
					<br>
					
					<label>관심사</label> /// 최대 갯수 지정 필요
					<br>
						<input type="checkbox" name="category" value="아웃도어/여행">아웃도어/여행 
						<input type="checkbox" name="category" value="운동/스포츠">운동/스포츠
						<input type="checkbox" name="category" value="인문학/책/글">인문학/책/글
						<input type="checkbox" name="category" value="외국/언어">외국/언어
						<input type="checkbox" name="category" value="문화/공연">문화/공연
						<input type="checkbox" name="category" value="음악/악기">음악/악기
						<input type="checkbox" name="category" value="공예/만들기">공예/만들기
						<input type="checkbox" name="category" value="댄스/무용">댄스/무용<br>
						<input type="checkbox" name="category" value="봉사활동">봉사활동
						<input type="checkbox" name="category" value="사교/인맥">사교/인맥
						<input type="checkbox" name="category" value="차/오토바이">차/오토바이
						<input type="checkbox" name="category" value="사진">사진
						<input type="checkbox" name="category" value="야구관람">야구관람
						<input type="checkbox" name="category" value="게임/오락">게임/오락
						<input type="checkbox" name="category" value="요리/제조">요리/제조
						<input type="checkbox" name="category" value="반려동물">반려동물
						<input type="checkbox" name="category" value="가족/결혼">가족/결혼<br>
						<input type="checkbox" name="category" value="자유주제">자유주제
					<br>
					<br>
					
					
					<label>50자 자기소개</label>
					<input class="form-control intro_self">
					<br><br>
					
					<div class="row"></div>
						<div class="col-sm-6">
							<button class="form-control btn btn-primary" type="submit">회원정보수정</button>
						</div>
						<div class="col-sm-6">
							<button class="col-sm-6 form-control btn btn-danger" type="submit">취소</button>
						</div>
					</div>
					<br>
					<br>
				</div> <!-- class="form-group" -->
		</form> <!-- class="myform" -->
	</div> <!-- id="container" -->
</div>  <!-- id="mobile" -->
	
</body>
</html>
