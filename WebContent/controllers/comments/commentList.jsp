<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.mydrinkrecipe.dto.CommentDto"%>
<%@page import="com.mydrinkrecipe.db.CommentDB"%>
<%@ page language="java" contentType="text/xml; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	CommentDB db=new CommentDB();
	String bno=request.getParameter("bno");
	
	List<CommentDto> list=db.getCommentList(bno);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
%>
<result>
	<senddate>
	<% for(CommentDto dto:list) 
	{%>
		<commentdata>
		<bno><%=dto.getBno() %></bno>
		<nick><%=dto.getContent() %></nick>
		<writeday><%=sdf.format(dto.getWriteday()) %></writeday>	
	</commentdata>
	<%}
	%>
	</senddate>
</result>
