<%@page import="com.mydrinkrecipe.dto.CommentDto"%>
<%@page import="com.mydrinkrecipe.db.CommentDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String c_content=request.getParameter("content");
	
	CommentDB db=new CommentDB();
	
	CommentDto dto=new CommentDto();
	dto.setContent(c_content);
	
	db.insertComment(dto);
	response.sendRedirect("../../detail.jsp");
%>
</body>
</html>