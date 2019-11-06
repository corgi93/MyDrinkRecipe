<?xml version="1.0" encoding="UTF-8"?>
<%@page import="com.mydrinkrecipe.db.CommentDB"%>
<%@ page language="java" contentType="text/xml; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String comment_bno=request.getParameter("comment_bno");
	System.out.println("comment_bno:"+comment_bno);
	
	CommentDB db=new CommentDB();
	db.deleteComment(comment_bno);
%>
<result>
	delete
</result>
