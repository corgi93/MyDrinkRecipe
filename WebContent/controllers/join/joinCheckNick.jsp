<?xml version="1.0" encoding="UTF-8"?>
<%@page import="com.mydrinkrecipe.db.MemberDB"%>
<%@ page language="java" contentType="text/xml; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	String userNick = request.getParameter("userNick");
	MemberDB db = new MemberDB();
	boolean isExistNick = db.isExistingNick(userNick);
%>
<Exist><%=isExistNick%></Exist>