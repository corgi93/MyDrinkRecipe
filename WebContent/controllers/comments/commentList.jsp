<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.mydrinkrecipe.dto.CommentDto"%>
<%@page import="com.mydrinkrecipe.db.CommentDB"%>
<%@ page language="java" contentType="text/xml; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String recipe_bno = request.getParameter("recipe_bno");
	String comment_bno = request.getParameter("comment_bno");
	System.out.println(recipe_bno);

	CommentDB db=new CommentDB();
	List<CommentDto> list=db.getCommentList(recipe_bno);
	
	System.out.println(comment_bno);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
/* 	for(CommentDto c_dto:list) {
		System.out.println(c_dto.getRecipe_bno());
		System.out.println(c_dto.getContent());
		System.out.println(c_dto.getWriteday());
		
	} */
	
%>
<result>
	<% for(CommentDto c_dto:list) 
	{%>
	<commentdata>
		<bno><%=c_dto.getRecipe_bno() %></bno>
		<cbno><%=c_dto.getComment_bno() %></cbno>
		<nick><%=c_dto.getNickname() %></nick>
		<content><%=c_dto.getContent() %></content>
		<memberimg><%=c_dto.getMemberimg() %></memberimg>
		<writeday><%=sdf.format(c_dto.getWriteday()) %></writeday>	
	</commentdata>
	<%}
	%>
</result>

