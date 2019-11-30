<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.util.Vector"%>
<%@page import="com.mydrinkrecipe.dto.MyScrapedDto"%>
<%@page import="java.util.List"%>
<%@page import="com.mydrinkrecipe.dto.ScrapedRecipeDto"%>
<%@page import="com.mydrinkrecipe.db.ScrapedDB"%>
<%@ page language="java" contentType="text/xml; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String my_id = request.getParameter("myid");
	
// paging
	int perPage = 3;//한페이지당 출력할 글의 갯수
	int perBlock = 3;//한블럭당 출력할 페이지의 갯수
	int startPage;//한블럭당 출력할 시작페이지	
	int endPage;//한블럭당 출력할 끝 페이지

	int startNum;//한페이지당 출력할 시작번호
	int endNum;//한페이지당 출력할 끝번호
	int totalPage;//총페이지수
	int currentPage;//현재페이지
	int no;//각 페이지에서 출력할 시작번호

	ScrapedDB s_db = new ScrapedDB();
	//총 게시글 갯수 구하기
	int totalCount = s_db.getTotalCount(my_id);

	//현재페이지 구하기
	String pageNum = request.getParameter("pageNum");

	//페이지가 안넘어온경우 널값인데 이때는 1페이지로
	if (pageNum == null)
		currentPage = 1;
	else
		currentPage = Integer.parseInt(pageNum);

	//total page num
	totalPage = (totalCount / perPage) + (totalCount % perPage > 0 ? 1 : 0);

	//시작페이지
	startPage = (currentPage - 1) / perBlock * perBlock + 1;

	//끝페이지번호
	endPage = startPage + perBlock - 1;

	//마지막블럭은 총 페이지보다 큰 지 비교가 필요하다
	if (endPage > totalPage)
		endPage = totalPage;

	//각 페이지당 불러올 글의 번호(오라클은 첫글이 1번)
	//1page는 1, 2page는 6,3page는 11...
	startNum = (currentPage - 1) * perPage + 1;
	endNum = startNum + perPage - 1;

	//마지막 글번호는 총 글의 갯수를 넘어선 안된다
	if (endNum > totalCount)
		endNum = totalCount;

	//각페이지에서 출력할 시작번호
	//총글이 20개일 경우 1page는 20,2page는 15,
	no = totalCount - (currentPage - 1) * perPage;

	List<MyScrapedDto> list = new Vector<MyScrapedDto>();

	list = s_db.getList(my_id, startNum, endNum);
%>

<ScrapedList> 
 <%
 	for (MyScrapedDto dto : list) {
 %> 
  <RecipeCard>
	<myId><%=dto.getImg()%></myId> 
	<recipeBno><%=dto.getRecipe_bno()%></recipeBno>
	<title><%=dto.getTitle()%></title>
	<writer><%=dto.getWriter()%></writer>
	<time><%=dto.getTime()%></time> 
	<likecount><%=dto.getLikecount()%></likecount>
	<img><%=dto.getImg()%></img> 
	<userImg><%=dto.getUser_img()%></userImg>
</RecipeCard>
 <%
 	}
 %> 
 <paging>
	<startPage><%=startPage %></startPage>
	<endPage><%=endPage%></endPage>
	<currentPage><%=currentPage %></currentPage>
	<pageNum><%=pageNum %></pageNum>
	<totalPage><%=totalPage %></totalPage>
	<startNum><%=startNum %></startNum>
	<endNum><%=endNum %></endNum>
	<perPage><%=perPage %></perPage>
	<perBlock><%=perBlock %></perBlock>
	<no><%=no %></no2>
</paging>
</ScrapedList>
