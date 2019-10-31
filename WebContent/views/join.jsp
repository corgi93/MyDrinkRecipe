<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@include file="./includes/header.jsp"%>

<%
	Boolean idcheck = (Boolean) request.getAttribute("idcheck");
%>
<script>
	function formNullCheck() {
		var id = document.getElementById("userId");
		var nick = document.getElementById("userNick");
		var pw = document.getElementById("userPw");
		var pw_check = document.getElementById("pw_check");
		var email = document.getElementById("userEmail");

		if (id.value == "") {
			alert("아이디를 입력해주세요");
			id.focus();
			return false;
		}

		if (nick.value == "") {
			alert("닉네임을 입력해주세요");
			nick.focus();
			return false;
		}

		if (pw.value == "") {
			alert("비밀번호를 입력해주세요");
			pw.focus();
			return false;
		}

		if (pw_check.value == "") {
			alert("비밀번호 확인을 해주세요");
			pw_check.focus();
			return false;
		}
		if (email.value == "") {
			alert("이메일을 입력해주세요");
			email.focus();
			return false;
		}
		alert("회원가입 완료")
	}

	function checkId() {
		var userId = $("#userId").val();
		$
				.ajax({
					url : '../controllers/join/joinCheckID.jsp',
					type : 'get',
					data : {
						"userId" : userId
					},
					success : function(data) {
						var isExist = $(data).find('Exist').text();
						var str = '';
						if (isExist == 'true') {
							var str = "<div style='color: red; font-size: 5px;'>이미 사용중인 아이디입니다.</div>"
							$("#idCheck").html(str);
						} else {
							var str = "<div style='color: green; font-size: 5px;'>사용 가능한 아이디입니다.</div>"
							$("#idCheck").html(str);
						}
					}
				})
	}

	function checkNick() {
		var userNick = $("#userNick").val();
		$.ajax({
					url : '../controllers/join/joinCheckNick.jsp',
					type : 'get',
					data : {
						"userNick" : userNick
					},
					success : function(data) {
						var isExist = $(data).find('Exist').text();
						var str = '';
						if (isExist == 'true') {
							var str = "<div style='color: red; font-size: 5px;'>이미 사용중인 닉네임입니다.</div>"
							$("#nickCheck").html(str);
						} else {
							var str = "<div style='color: green; font-size: 5px;'>사용 가능한 닉네임입니다.</div>"
							$("#nickCheck").html(str);
						}
					}
				})
	}

	function checkPw() {
		var p1 = $("#userPw").val();
		var p2 = $("#pw_check").val();
		if (p1 != p2) {
			alert("두 비밀번호가 일치하지 않습니다.")
		} else {
			alert("비밀번호 확인완료")
		}
		return false;
	}
</script>

<div class="login-container">
	<h2>회원가입</h2>

	<div class="form-body">
		<form action="../controllers/joinAction.jsp" method="post"
			onsubmit="return formNullCheck();">
			<div>
				<div class="text">아이디</div>
				<input class="login_form" type="text" id="userId" name="id"
					placeholder="아이디" onblur="checkId()">
				<div id="idCheck"></div>
			</div>
			<div>
				<div class="text">닉네임</div>
				<input class="login_form" type="text" id="userNick" name="nickname"
					placeholder="닉네임" onblur="checkNick()">
				<div id="nickCheck"></div>
			</div>
			<div>
				<div class="text">비밀번호</div>
				<input class="login_form" type="password" id="userPw" name="pw"
					placeholder="비밀번호">
			</div>
			<div>
				<div class="text">비밀번호 확인</div>
				<input class="login_form" type="password" id="pw_check"
					name="pw_check" placeholder="비밀번호 확인" onblur="checkPw()">
			</div>
			<div>
				<div class="text">e-mail</div>
				<input class="login_form" type="email" id="userEmail" name="email"
					placeholder="이메일">
			</div>
			<div>
				<button type="submit" onclick="location.href='../main.jsp'">가입하기</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>