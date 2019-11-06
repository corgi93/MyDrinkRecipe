<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mydrinkrecipe.db.CommentDB"%>
<%@page import="java.util.Vector"%>
<%@page import="com.mydrinkrecipe.dto.CommentDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
<%
	//페이징처리
	//우리는 한페이지당 5개의 글을 출력
	//한 블럭당 5개의 페이지를 출력하는거로 일단 계산
	int perPage=5;//한페이지당 출력할 글의 갯수
	int perBlock=5;//한블럭당 출력할 페이지의 갯수
	int totalCount;//전체 글의 갯수
	int startPage;//한블럭당 출력할 시작페이지
	int endPage;//한블럭당 출력할 끝페이지
	int startNum;//한페이지당 출력할 시작번호
	int endNum;//한페이지당 출력할 끝번호
	int totalPage;//총 페이지수
	int currentPage;//현재페이지
	int no;//각 페이지에서 출력할 시작번호
	
	//각페이지에 출력할 글들-getList 호출
	List<CommentDto> list=new Vector<>();
	
	//db 선언
	CommentDB db=new CommentDB();
	
	//총 게시글 갯수 구하기
	totalCount=db.getTotalCount();
	
	//현재 페이지 구하기
	String p=request.getParameter("pageNum");
	//페이지가 안넘어온경우 널값인데 이때는 1페이지로
	if(p==null)
		currentPage=1;
	else
		currentPage=Integer.parseInt(p);
	
	//총 페이지수
	totalPage=(totalCount/perPage)+(totalCount%perPage>0?1:0);
	
	//시작페이지번호
	startPage=(currentPage-1)/perBlock*perBlock+1;
	//끝페이지번호
	endPage=startPage+perBlock-1;
	//마지막블럭은 총 페이지보다 큰지 비교가 필요하다
	if(endPage>totalPage)
		endPage=totalPage;
	
	//각페이지당 불러올 글의 번호(오라클은 첫글이 1번)
	//1page 는 1, 2page 는 6,3page 는 11...
	startNum=(currentPage-1)*perPage+1;
	endNum=startNum+perPage-1;
	//마지막 글번호는 총 글의 갯수를 넘어선 안된다'
	if(endNum>totalCount)
		endNum=totalCount;
	
	//각페이지에서 출력할 시작번호
	//총글이 20개일경우 1page는 20,1page는 15,
	no=totalCount-(currentPage-1)*perPage;	
	
	//각페이지에 필요한 글 가져오기
	list=db.getList(startNum, endNum);
	
	//출력할 날짜 양식
	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm");	
%>
<%-- 
<!-- 페이지 번호 출력 -->
<div style="text-align: center;">
	
<%
	String go="index.jsp?main=guest/guestlist.jsp?pageNum=";
%>

<ul class="pagination">
<!-- 이전 -->
 <%
 if(startPage>1)
 {
 %>
 	<li><a href="<%=go%><%=startPage-1%>">Prev</a></li>
 <%} %>
<%
	for(int i=startPage;i<=endPage;i++)
	{
		if(i==currentPage)
		{%>
			<li><a style="color: red;font-weight: bold;"
			href="<%=go%><%=i%>"><%=i%></a></li>
		<%}else{%>
			<li><a style="color: black;"
			href="<%=go%><%=i%>"><%=i%></a></li>
		<%}		
	}
%>
 <!-- 다음 -->
 <%
 if(endPage<totalPage)
 {
 %>
 	<li><a href="<%=go%><%=endPage+1%>">Next</a></li>
 <%} %>
</ul>
</div>
</body>
</html>
 --%>