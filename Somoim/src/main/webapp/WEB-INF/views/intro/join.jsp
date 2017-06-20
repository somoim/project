<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	html, body, #mobile { height:100%; }
	#header { display:none}
	#footer { display:none}
	#container { min-height:100%; height:100%; margin-top:0; margin-bottom:0;}
</style>
</head>
<body>
<!-- 모바일 Layout -->
<div id="mobile">
	<div id="container" class="container">
		<!-- 여기서부터 시작 -->
		<div class="row">
			<div class="col-xs-12 loginBox">
				<div>회원가입</div>
				<form class="form-horizontal login_form" action="/user/loginPost" method="post">
				
					<div class="form-group">
						<label class="col-xs-2 control-label" for="id">ID</label>
						<div class="col-xs-10 id_form">
							<input class="form-control" name="id" id="id" placeholder="아이디를 입력하세요">
						</div>
					</div>
	
					<div class="form-group">
						<label class="col-xs-2 control-label" for="upw">Password</label> 
						<div class="col-xs-10 upw_form">
							<input class="form-control" name="upw" id="upw" placeholder="비밀번호를 입력하세요">
						</div>
					</div>
	
					<div class="form-group">
						<div class="col-xs-offset-2">
						<button class="btn btn-default" type="submit">회원가입</button>
						<button class="btn bnt-danger" type="reset">취소</button>
						</div>
					</div>
				
				</form>
			</div>
			
		</div>
			
		
		<script type="text/javascript">
			var width=$("div.container").innerWidth();
			var height=window.innerHeight;
			var h = $(".row").innerHeight();
			
			$(".row").css("margin-top", height/2-h/2);

		</script>
	</div>
</div>
	
</body>
</html>
