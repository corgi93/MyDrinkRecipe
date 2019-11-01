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
	String bno = request.getParameter("bno");
	String recipe_bno = request.getParameter("recipe_bno");

	int bno1 = Integer.parseInt(bno);
	int r_bno = Integer.parseInt(recipe_bno);

	System.out.println("레시피:"+bno1);
	System.out.println("레시피1:"+r_bno);
	
	List<CommentDto> list = db.getCommentList(bno1, r_bno);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<result> 
<%
 	for (CommentDto dto : list) {
%> 
	<commentdata> 
 		<bno><%=dto.getBno()%></bno>
		<content><%=dto.getContent()%></content> 
		<writeday><%=sdf.format(dto.getWriteday())%></writeday>
	</commentdata> 
	<%}%> 
 </result>
