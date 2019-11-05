<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.mydrinkrecipe.dto.CommentDto"%>
<%@page import="com.mydrinkrecipe.db.CommentDB"%>
<%@ page language="java" contentType="text/xml; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String nick=request.getParameter("nick");
	String image=request.getParameter("user_img");
	String c_content=request.getParameter("content");
	String recipe_bno = request.getParameter("recipe_bno");
	
/* 	System.out.println(image); */

	CommentDB db=new CommentDB();
	
	CommentDto dto=new CommentDto();
	dto.setNickname(nick);
	dto.setContent(c_content);
	dto.setMemberimg(image);
	dto.setRecipe_bno(recipe_bno);
	
	// insert
	db.insertComment(dto);

%>
<result>
	success
</result>

