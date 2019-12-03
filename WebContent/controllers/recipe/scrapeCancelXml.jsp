<?xml version="1.0" encoding="UTF-8"?>
<%@page import="com.mydrinkrecipe.dto.ScrapedRecipeDto"%>
<%@page import="com.mydrinkrecipe.db.ScrapedDB"%>
<%@ page language="java" contentType="text/xml; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	String myid = (String) session.getAttribute("id");
	String recipe_bno = request.getParameter("recipe_bno");

	ScrapedDB db = new ScrapedDB();
	ScrapedRecipeDto dto = new ScrapedRecipeDto();
	
	db.deleteScrape(myid, recipe_bno);
%>