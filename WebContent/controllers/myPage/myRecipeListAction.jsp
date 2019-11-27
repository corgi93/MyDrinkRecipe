<?xml version="1.0" encoding="UTF-8"?>
<%@page import="com.mydrinkrecipe.dto.MyRecipesDto"%>
<%@page import="com.mydrinkrecipe.db.MyRecipeDB"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/xml; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String my_id = request.getParameter("myid2");

	// paging
	int perPage2 = 3;//한페이지당 출력할 글의 갯수
	int perBlock2 = 3;//한블럭당 출력할 페이지의 갯수
	int startPage2;//한블럭당 출력할 시작페이지	
	int endPage2;//한블럭당 출력할 끝 페이지

	int startNum2;//한페이지당 출력할 시작번호
	int endNum2;//한페이지당 출력할 끝번호
	int totalPage2;//총페이지수
	int currentPage2;//현재페이지
	int no2;//각 페이지에서 출력할 시작번호

	MyRecipeDB myDB = new MyRecipeDB();
	//총 게시글 갯수 구하기
	int totalCount2 = myDB.getTotalCount(my_id);

	//현재페이지 구하기
	String pageNum2 = request.getParameter("pageNum2");

	//페이지가 안넘어온경우 널값인데 이때는 1페이지로
	if (pageNum2 == null)
		currentPage2 = 1;
	else
		currentPage2 = Integer.parseInt(pageNum2);

	//total page num
	totalPage2 = (totalCount2 / perPage2) + (totalCount2 % perPage2 > 0 ? 1 : 0);

	//시작페이지
	startPage2 = (currentPage2 - 1) / perBlock2 * perBlock2 + 1;

	//끝페이지번호
	endPage2 = startPage2 + perBlock2 - 1;

	//마지막블럭은 총 페이지보다 큰 지 비교가 필요하다
	if (endPage2 > totalPage2)
		endPage2 = totalPage2;

	//각 페이지당 불러올 글의 번호(오라클은 첫글이 1번)
	//1page는 1, 2page는 6,3page는 11...
	startNum2 = (currentPage2 - 1) * perPage2 + 1;
	endNum2 = startNum2 + perPage2 - 1;

	//마지막 글번호는 총 글의 갯수를 넘어선 안된다
	if (endNum2 > totalCount2)
		endNum2 = totalCount2;

	//각페이지에서 출력할 시작번호
	//총글이 20개일 경우 1page는 20,2page는 15,
	no2 = totalCount2 - (currentPage2 - 1) * perPage2;

	List<MyRecipesDto> list = new Vector<MyRecipesDto>();

	list = myDB.getMyRecipesList(my_id, startNum2, endNum2);
%>


<MyRecipeList>
	<% for(MyRecipesDto dto : list){%>
	<RecipeCard>
		<myId><%=dto.getImg() %></myId>
		<recipeBno><%=dto.getRecipe_bno() %></recipeBno>
		<title><%=dto.getTitle() %></title>
		<writer><%=dto.getWriter() %></writer>
		<content><%=dto.getContent() %></content>
		<time><%=dto.getTime() %></time>
		<likecount><%=dto.getLikecount() %></likecount>
		<img><%=dto.getImg() %></img>
	</RecipeCard>
	<% } %>
	
	<paging>
		<startPage2><%=startPage2 %></startPage2>
		<endPage2><%=endPage2%></endPage2>
		<currentPage2><%=currentPage2 %></currentPage2>
		<pageNum2><%=pageNum2 %></pageNum2>
		<totalPage2><%=totalPage2 %></totalPage2>
		<startNum2><%=startNum2 %></startNum2>
		<endNum2><%=endNum2 %></endNum2>
		<perPage2><%=perPage2 %></perPage2>
		<perBlock2><%=perBlock2 %></perBlock2>
		<no2><%=no2 %></no2>
	</paging>
</MyRecipeList>


