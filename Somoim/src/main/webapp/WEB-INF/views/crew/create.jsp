<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.fileDrop{
		width:80%;
		height:100px;
		border: 1px dotted gray;
		background-color: lightslategray;
		margin: auto;
	}
</style>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container">
		<div class="container">
			<div class="row">
				<div class="page-header">
			 		<h3>소모임개설</h3>
				</div>
			</div>
			<div class="row">
				<form id="myForm" action="" method="post">
				
					<div class="form-group">
						<label for="title">(제목)소모임명</label>
						<input name="title" id="title" class="form-control">
					</div>	
					
					
					<div class="form-group">
						<label for="content">(내용)소모임소개</label>
						<textarea name="content" id="content" class="form-control"></textarea>
					</div>
					
					<div class="form-group">
						<label for="mid">개설자</label>
						<input value="${login.mid}" name="mid" id="mid" class="form-control" readonly="readonly">
					</div>
					
					<div class="form-group">
						<label for="content">소모임 지역</label>
						<input name="content" id="content" class="form-control">
					</div>
					
					<div class="form-group">
						<label for="content">소모임 인원</label>
						<input name="content" id="content" class="form-control">
					</div>
					
					<div class="form-group">
					
						<label>카테고리 선택</label>
						<div class="input-group">
							<input type="checkbox" name="category" value="아웃도어/여행" id="check1" onclick="check_only(this)"><label for="check1" onclick="check_only(this)">아웃도어/여행</label> 
							<input type="checkbox" name="category" value="운동/스포츠" id="check2" onclick="check_only(this)"><label for="check2" onclick="check_only(this)">운동/스포츠</label>
							<input type="checkbox" name="category" value="인문학/책/글" id="check3" onclick="check_only(this)"><label for="check3" onclick="check_only(this)">인문학/책/글</label> 
							<input type="checkbox" name="category" value="외국/언어" id="check4" onclick="check_only(this)"><label for="check4" onclick="check_only(this)">외국/언어</label>
							<input type="checkbox" name="category" value="문화/공연" id="check5" onclick="check_only(this)"><label for="check5" onclick="check_only(this)">문화/공연</label> 
							<input type="checkbox" name="category" value="음악/악기" id="check6" onclick="check_only(this)"><label for="check6" onclick="check_only(this)">음악/악기</label> 
							<input type="checkbox" name="category" value="공예/만들기" id="check7" onclick="check_only(this)"><label for="check7" onclick="check_only(this)">공예/만들기</label> 
							<input type="checkbox" name="category" value="댄스/무용" id="check8" onclick="check_only(this)"><label for="check8" onclick="check_only(this)">댄스/무용</label> 
							<input type="checkbox" name="category" value="봉사활동" id="check9" onclick="check_only(this)"><label for="check9" onclick="check_only(this)">봉사활동</label> 
							<input type="checkbox" name="category" value="사교/인맥" id="check10" onclick="check_only(this)"><label for="check10" onclick="check_only(this)">사교/인맥</label> 
							<input type="checkbox" name="category" value="차/오토바이" id="check11" onclick="check_only(this)"><label for="check11" onclick="check_only(this)">차/오토바이</label> 
							<input type="checkbox" name="category" value="사진" id="check12" onclick="check_only(this)"><label for="check12" onclick="check_only(this)">사진</label> 
							<input type="checkbox" name="category" value="야구관람" id="check13" onclick="check_only(this)"><label for="check13" onclick="check_only(this)">야구관람</label> 
							<input type="checkbox" name="category" value="게임/오락" id="check14" onclick="check_only(this)"><label for="check14" onclick="check_only(this)">게임/오락</label> 
							<input type="checkbox" name="category" value="요리/제조" id="check15" onclick="check_only(this)"><label for="check15" onclick="check_only(this)">요리/제조</label> 
							<input type="checkbox" name="category" value="반려동물" id="check16" onclick="check_only(this)"><label for="check16" onclick="check_only(this)">반려동물</label> 
							<input type="checkbox" name="category" value="가족/결혼" id="check17" onclick="check_only(this)"><label for="check17" onclick="check_only(this)">가족/결혼</label> 
							<input type="checkbox" name="category" value="자유주제" id="check18" onclick="check_only(this)"><label for="check18" onclick="check_only(this)">자유주제</label> 
						</div>
					</div>
					
					
				</form>
				
				<div class="row">
					<div class="form-group">
						<label>업로드할 파일을 드랍시키세요</label>
						<div class="fileDrop">
							drag & drop
						</div>
					</div>
					
					<ul class="clearfix uploadedList">
						
					</ul>
				</div>
				
				<div class="form-group">
					<button class="btn btn-primary" type="submit" id="submit_form">
						<span class="glyphicon glyphicon-check"></span> 등록</button>
					<button class="btn btn-danger" type="reset">
						<span class="glyphicon glyphicon-remove"></span> 초기화</button>
					<button class="btn btn-info" type="submit" id="list_form">
						<span class="glyphicon glyphicon-align-justify"></span> 목록</button>
				</div>
	
			</div>	

		</div>
	
	</div>
</div>
</body>
</html>
