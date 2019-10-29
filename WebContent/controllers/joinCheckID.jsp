<?xml version="1.0" encoding="UTF-8"?>
<%@page import="com.mydrinkrecipe.db.MemberDB"%>
<%@ page language="java" contentType="text/xml; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	String userId = request.getParameter("userId");
	MemberDB db = new MemberDB();
	boolean isExistID = db.isExistingId(userId);
%>
<Exist><%=isExistID%></Exist>