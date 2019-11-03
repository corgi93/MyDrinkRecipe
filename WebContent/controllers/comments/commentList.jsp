<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.mydrinkrecipe.dto.CommentDto"%>
<%@page import="com.mydrinkrecipe.db.CommentDB"%>
<%@ page language="java" contentType="text/xml; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	CommentDB db = new CommentDB();
	String comment_bno = request.getParameter("comment_bno");
	String recipe_bno = request.getParameter("recipe_bno");

	System.out.println("코멘트bno:"+comment_bno);
	System.out.println("레시피bno:"+recipe_bno);
	
	List<CommentDto> list = db.getCommentList(comment_bno, recipe_bno);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<result> 
<%
 	for (CommentDto dto : list) {
%> 
	<commentdata> 
 		<comment_bno><%=dto.getComment_bno()%></comment_bno>
		<content><%=dto.getContent()%></content> 
		<writeday><%=sdf.format(dto.getWriteday())%></writeday>
	</commentdata> 
	<%}%> 
 </result>
	