<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@include file="../includes/header.jsp"%>

<div class="login-container">
	<h2>로그인</h2>

	<div class="form-body">
		<form action="../controllers/login/loginAction.jsp" method="post">
			<div>
				<div class="text">아이디 입력</div>
				<input class="login_form" type="text" name="id" placeholder="아이디 입력">
			</div>
			<div>
				<div class="text">비밀번호 입력</div>
				<input class="login_form" type="password" name="pw" placeholder="비밀번호 입력">
			</div>
			<div>
				<button type="submit">로그인</button>
				<button type="button" onclick="location.href='./join.jsp'">회원가입</button>
			</div>

			<div class="checkbox">
				<input type="checkbox" value="1">로그인 상태 유지
			</div>
		</form>	
	</div>
</div>
</body>
</html>