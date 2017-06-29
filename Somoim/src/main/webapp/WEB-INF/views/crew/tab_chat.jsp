<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../index.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	html, body, #mobile { height:100%;}
	#header { display:none;}
	#footer { display:none;}
	#container { margin-top:0; padding:95px 0 33px 0; margin-bottom:0; min-height:100%; background-color: #9bc0d2}
	.container { }
	.chattingBar { position:fixed; bottom:0; width:100%; transition: top 0.2s ease-in-out;}
	.sub_tab { display:table; width:100%; position: fixed; top:55px;}
	.sub_tab li { display: table-cell; width:25%; text-align:center; height:40px; line-height:39px; background-color: #ffffff; font-size:14px; font-weight:bold; color:#929292; border-bottom:1px solid #929292;}
	.sub_tab li a { display:block; color:inherit;}
	.sub_tab li a:hover { color:inherit; text-decoration: none;}
    .sub_tab li:hover { height:40px; line-height:38px; color:#493334; border-bottom: 2px solid #493334;}
    .sub_tab li.act { height:40px; line-height:38px; color:#493334; border-bottom: 2px solid #493334;}
    #replies p { font-weight:bold;  margin: 0 0 5px; }
    #replies h6 { margin:5px 0 15px;}
    .msg{ background-color: white; padding:0 5px; font-weight:normal; border-radius: 3px;}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		
		
		var cno = 1;
		getChatList(cno);
		setInterval("getChatList("+cno+")", 5000);
		$(".send").click(function(){
			var mid = $("#mid").val();
			var cno = $("#cno").val();
			var msg = $("#msg").val();
			$.ajax({	
				type:"post",
				url:"/crew/tab_chat",
				data:{
					mid : mid,
					cno : cno,
					msg : msg
				},
				dataType: "text",
				success: function(result) {
						$("#msg").val("");
						getChatList(cno);
				}
			});
		});
		
		// 뒤로가기
		$(".backCont").click(function() {
			self.location="/crew/list";
		});
		
		
	});
	function getChatList(cno) {
		console.log(cno);
		$.getJSON("/crew/tab_chat/"+cno, function(data) {
			
			var source = $("#source").html();
			var template = Handlebars.compile(source);
			$("#replies").html(template(data));

		});
	}
	
</script>

<script id="source" type="text/x-handlebars-template">
{{#each.}}
	
	<p>{{mid}}</p>
	<label class="msg">{{msg}}</label>
	<h6>{{ch_date}}</h6>
	
{{/each}}
</script>
</head>
<body>
<!-- 모바일 Layout -->


<div id="mobile">
	<header id="header2">
		<div class="backCont">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</div>
		<div class="titleCont">
			채팅
		</div>
		<div class="snsCont">
			<span class="glyphicon glyphicon-new-window"></span>
			<span class="glyphicon glyphicon-option-vertical"></span>
		</div>
	</header>
	<ul class="sub_tab">
		<li><a href="../crew/tab_list">정보</a></li>
		<li><a href="../crew/tab_board">게시판</a></li>
		<li><a href="../crew/tab_gallery">사진첩</a></li>
		<li class="act"><a href="../crew/tab_chat">채팅</a></li>
	</ul>
	<div id="container" >
		<div class="container">
			<div class="row">
				<div class="form-group col-xs-10">
					<div id="replies">
						
					</div>
				</div>
			</div>
		
			
		</div>
	</div>
	
	<div class="input-group chattingBar">
		<input name="mid" id="mid" value="${login.mid}" hidden="hidden">
		<input name="cno" id="cno" value="${cno}" hidden="hidden">
		<input type="text" class="form-control" placeholder="메세지를 입력하세요" name="msg" id="msg">
		<span class="input-group-btn">
		<button class="btn btn-default send" type="button">보내기</button>
		</span>
	</div><!-- /input-group -->
</div>

 
</body>

