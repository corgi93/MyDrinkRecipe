<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@include file="../includes/header.jsp"%>
<div class="login-container">
	<h2>회원가입</h2>

	<div class="form-body">
		<form action="" method="post">
			<div>
				<div class="text">아이디</div>
				<input class="login_form" type="text" placeholder="아이디">
			</div>
			<div>
				<div class="text">닉네임</div>
				<input class="login_form" type="text" placeholder="닉네임">
			</div>
			<div>
				<div class="text">비밀번호</div>
				<input class="login_form" type="password" placeholder="비밀번호">
			</div>
			<div>
				<div class="text">비밀번호 확인</div>
				<input class="login_form" type="password" placeholder="비밀번호 확인">
			</div>
			<div>
				<div class="text">닉네임</div>
				<input class="login_form" type="password" placeholder="비밀번호 확인">
			</div>
			<div>
				<button type="submit" onclick="location.href='../main.jsp'">가입하기</button>
			</div>

			<div class="checkbox">
				<input type="checkbox" value="1">로그인 상태 유지
			</div>
		</form>	
	</div>
</div>
</body>
</html>