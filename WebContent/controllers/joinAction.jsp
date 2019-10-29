<%@page import="com.mydrinkrecipe.dto.MemberDto"%>
<%@page import="com.mydrinkrecipe.db.MemberDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		response.setContentType("application/json");
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pw_chk = request.getParameter("pw_check");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");

		MemberDB db = new MemberDB();
		MemberDto dto = new MemberDto();

		dto.setId(id);
		dto.setPassword(pw);
		dto.setNickname(nickname);
		dto.setEmail(email);

		db.registerMember(dto);

		out.write("<script>");
		out.write("alert('회원가입 성공!'); location.href='../main.jsp';");
		out.write("</script>");
	%>
</body>
</html>