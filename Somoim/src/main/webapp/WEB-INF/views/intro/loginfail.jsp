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
	<div id="container">
		<div class="container">
		<div class="row">
			<div class="col-xs-10 col-xs-offset-1 loginBox">
				
				<form class="form-horizontal login_form" action="/user/loginPost" method="post">
				
					<div class="form-group">
						
					</div>
	
					<div class="form-group">
						<div class="col-xs-12">로그인 정보를 확인해주세요.</div>
					</div>
	
					<div class="form-group">
						<div class="col-xs-12">
						<button class="btn bnt-danger pull-right" id="joinBtn" type="submit">회원가입</button>
						<button class="btn btn-default pull-right" id="loginBtn" type="submit">로그인</button>
						</div>
					</div>
				
				</form>
			</div>
		</div>
		</div>
	</div>
	
	<script type="text/javascript">
		
		// 로그인창 레이아웃
		var width=$("div.container").innerWidth();
		var height=window.innerHeight;
		var h = $(".row").innerHeight();
		$(".row").css("margin-top", height/2-h/2);
		
		// 폼 버튼제어
		var $form = $(".login_form");
		$("#joinBtn").click(function() {
			$form.attr("action", "/intro/join");
			$form.attr("method", "get");
			$form.submit();
		});
		$("#loginBtn").on("click", function() {
			$form.attr("method", "POST");
			$form.attr("action", "/intro/login_post");
			$form.submit();
		});
		

	</script>
</div>
	
</body>
</html>
