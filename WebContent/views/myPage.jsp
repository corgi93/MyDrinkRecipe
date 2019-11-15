<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="com.mydrinkrecipe.db.MyRecipeDB"%>
<%@page import="com.mydrinkrecipe.dto.MyRecipesDto"%>
<%@page import="com.mydrinkrecipe.db.ScrapedDB"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="com.mydrinkrecipe.dto.MyScrapedDto"%>
<%@page import="com.mydrinkrecipe.dto.MemberDto"%>
<%@page import="com.mydrinkrecipe.db.MemberDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<%@include file="./includes/header.jsp"%>

<%
	String getSessionID = (String) session.getAttribute("id");

	MemberDB db = new MemberDB();
	MemberDto dto = db.getMyPageInfos(getSessionID);

	// 찜한 목록 list
	ScrapedDB scrapedDB = new ScrapedDB();
	List<MyScrapedDto> list = new Vector<MyScrapedDto>();
	list = scrapedDB.getScrapedRecipes(getSessionID);
%>

<%
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


	//총 게시글 갯수 구하기
	int totalCount = scrapedDB.getTotalCount(id);

	//현재페이지 구하기
	String pageNum = request.getParameter("pageNum");

	//페이지가 안넘어온경우 널값인데 이때는 1페이지로
	if (pageNum == null)
		currentPage = 1;
	else
		currentPage = Integer.parseInt(pageNum);

	//총 페이지수
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

	//각 페이지에 필요한 글 가져오기
	// list = scrapedDB.getList(id, startNum, endNum);
%>

<%
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
	int totalCount2 = myDB.getTotalCount(id);

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

	//각 페이지에 필요한 글 가져오기
	// list = scrapedDB.getList(id, startNum, endNum);
%>

<body>
	<div id="myPage_container">
		<div class="user_infos">
			<div id="user_wrapper">
				<div class="left_infos">
					<img class="user_thumbnail"
						src="../thumbnail_user/<%=dto.getUser_img()%>" /> <img
						class="upload_thumbnail" src="../resources/img/camera.svg">
				</div>
				<div class="right_infos">
					<h2><%=dto.getNickname()%></h2>
					<div>
						<span>팔로잉</span> <span style="padding-left: 50px;">팔로워</span>
					</div>
					<div>
						<span>0명</span> <span style="padding-left: 75px;">0명</span>
					</div>
					<div>
						<button class="modify_profile">프로필 수정</button>
					</div>
				</div>
			</div>
		</div>

		<div class="tab">
			<div class="tabmenu">
				<div id="list_of_scraped" class="tablist active"
					onclick="openTab(event, 'scrapedList')">
					찜한 레시피 <input type="hidden" id="myid" name="myid" value="<%=id%>">
					<input type="hidden" id="startNum" name="startName"
						value="<%=startNum%>"> <input type="hidden" id="endNum"
						name="endName" value="<%=endNum%>">
				</div>

				<div id="list_of_myRecipe" class="tablist"
					onclick="openTab(event, 'myRecipeList')">
					마이 리스트 <input type="hidden" id="myid2" name="myid2" value="<%=id%>">
					<input type="hidden" id="startNum2" name="startNum2"
						value="<%=startNum2%>"> <input type="hidden" id="endNum2"
						name="endNum2" value="<%=endNum2%>">
				</div>
				<div id="list_of_following" class="tablist"
					onclick="openTab(event, 'content3')">팔로잉</div>
			</div>

			<section id="content1" class="content" style="display: block;">

			</section>

		</div>
	</div>

	<div>
		<div class="modal2 hidden">
			<div class="modal_overlay2"></div>
			<div class="modal_content">
				<button class="closebtn2">❌</button>
				<h1>내 프로필</h1>
				<form action="../controllers/profile/profileUpload.jsp"
					method="post" enctype="multipart/form-data">
					<div class="modify_btn">
						<div>
							<input class="modify_input" type="text" name="introduce"
								placeholder="자기 소개 한 줄">
						</div>

						<div class="filebox">
							<label for="user_img">프로필 업로드</label> <input type="file"
								name="profileImg" class="modify_input" id="user_img">
						</div>
						<button class="complete" type="submit">저장</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div>
		<div class="modal hidden">
			<div class="modal_overlay"></div>
			<div class="modal_content">
				<button class="closebtn">❌</button>
				<h1>프로필 수정</h1>
				<form action="../controllers/profile/modifyPofile.jsp" method="post">
					<div>
						<input class="modify_input" name="e-mail" type="text"
							placeholder="이메일을 수정하시겠습니까?">
					</div>
					<div>
						<input class="modify_input" name="nickname" type="text"
							placeholder="닉네임을 수정하시겠습니까?">
					</div>
					<div>
						<input class="modify_input" name="pw" type="text"
							placeholder="현재 비밀번호"> <input class="modify_input"
							name="pw_check" type="text" placeholder="새 비밀번호"> <input
							class="modify_input" name="pw_new" type="text"
							placeholder="새 비밀번호 확인">
					</div>
					<button class="complete">저장</button>
				</form>
			</div>
		</div>
	</div>



	<script>
		var scrapedContent = document.getElementById("list_of_scraped");
		var myRecipeContent = document.getElementById("list_of_myRecipe");
		var followingContent = document.getElementById("list_of_following");
		
 		window.addEventListener("load", function(){
			getScrapedRecipes()
		}) 

		scrapedContent.addEventListener("click", function(){
			getScrapedRecipes()
		})

		myRecipeContent.addEventListener("click", function(){
			getMyRecipes()
		})
		
		
		function openTab(event) {
			// selector가 여러개일 경우 querySelectorAll
			var tablist = document.querySelectorAll(".tablist");
			
			for (var i = 0; i < tablist.length; i++) { 	
				tablist[i].className = tablist[i].className.replace(" active", "");
			}

			event.currentTarget.className += " active";
		}

		function getMyRecipes() {
			var myid2 = document.getElementById("myid2").value;
			var startNum2 = document.getElementById("startNum2").value;
			var endNum2 = document.getElementById("endNum2").value;

			$.ajax({
					url : "../controllers/myPage/myRecipeListAction.jsp",
					type : 'get',
					data : {
						"myid2" : myid2,
						"startNum2" : startNum2,
						"endNum2" : endNum2,
					},
					dataType : 'xml',
					success : function(data) {
						var result = "";
						var html = document.getElementById("tabcontent2").innerHTML;
						var paging = document.getElementById("pagingTemplate2").innerHTML;
						$(data).find("RecipeCard").each(
								function() {
									var thisRecipe = $(this);
									result += html.replace("{writer}",thisRecipe.find("writer").text())
												  .replace("{likecount}",thisRecipe.find("likecount").text())
												  .replace(	"{title}",thisRecipe.find("title").text())
												  .replace("{time}",thisRecipe.find("time").text())
												  .replace("{img}",thisRecipe.find("img").text())
												  .replace("{userImg}",thisRecipe.find("userImg").text())
												  .replace("{recipeBno}",thisRecipe.find("recipeBno").text())
												  .replace("{content}",	thisRecipe.find("content").text())
								})
								result += paging;
						document.querySelector("#content1").innerHTML = result;
					}
				})
		}

		function getScrapedRecipes() {
			var myid = document.getElementById("myid").value;
			var startNum = document.getElementById("startNum").value;
			var endNum = document.getElementById("endNum").value;
			
			$.ajax({
				url : "../controllers/myPage/myScrapeAction.jsp",
				type : 'get',
				data : {	
					"myid" : myid,
					"startNum" : startNum,
					"endNum" : endNum
				},
				dataType : 'xml',
				success : function(data) {
					var result = "";
					var html = document.getElementById("tabcontent").innerHTML;
					var paging = document.getElementById("pagingTemplate").innerHTML;

					$(data).find("RecipeCard").each(function() {
							var thisRecipe = $(this);
							result += html.replace("{writer}",thisRecipe.find("writer").text())
										  .replace("{likecount}",thisRecipe.find("likecount").text())
										  .replace("{title}",thisRecipe.find("title").text())
										  .replace("{time}",thisRecipe.find("time").text())
										  .replace("{img}",thisRecipe.find("img").text())
										  .replace("{userImg}",thisRecipe.find("userImg").text())
										  .replace("{recipeBno}",thisRecipe.find("recipeBno").text())
									})
							result += paging;
					document.querySelector("#content1").innerHTML = result;
				}
			})
		}

	</script>


	<script id="tabcontent" type="RecipeCardTemplate">
         <div class="recipe_card">
            <div class="card_img">
               <a class="card1" href="../detail.jsp?recipe_bno={recipeBno}"> 
               <img src="../r_thumbnail/{img}">
               </a> <a class="card2"> <img src="../thumbnail_user/{userImg}">
               </a>
            </div>
            <div style="text-align: center;">
               <p>
                  <a class="card3"><b>{writer}</b></a>
               </p>
               <p>
                  <a class="card4">{title}</a>
               </p>
            </div>
            <div class="option">
               <div class="option1">
                  <i class="fas fa-heart"></i>&nbsp; {likecount}명
               </div>
               <div class="option2">
                  <i class="fas fa-hourglass-half"></i>&nbsp; {time}
               </div>
            </div>
         </div>
    </script>

	<script id="pagingTemplate" type="pagingTemplate">
		<div style="width: 800px; margin: 0 auto;">
			<ul class="pagination">
		<%
			if (startPage > 1) {
		%>
			<li><a id="prev" href="./myPage.jsp?pageNum=<%=startPage - 1%>">이전</a></li>

		<%
			}
			for (int i = startPage; i <= endPage; i++) {
				if (i == currentPage) {
		%>
			<li><a href="./myPage.jsp?pageNum=<%=i%>" style="color: red; font-weight: bold;"><%=i%></a></li>
		<%
				} else {
		%>
			<li><a href="./myPage.jsp?pageNum=<%=i%>" style="color: black;"><%=i%></a></li>
		<%
				}
			}
		%>

		<%
			if (endPage < totalPage) {
		%>
			<li><a id="next" href="./myPage.jsp?pageNum=<%=endPage + 1%>">다음</a></li>
		<%
			}
		%>
			</ul>
		</div>
    </script>

	<script type="text/javascript">
    	var prev = document.querySelector("#prev");
    	var next = document.querySelector("#next");
    	var pageNum2 = pageNum2;
    	var startPage2 = startPage2;
    	
    	$.ajax({
			 data: {
				"prev" : prev,				 
				"next" : next				 
			 }
    	})
    </script>


	<script id="pagingTemplate2" type="pagingTemplate">
		<div style="width: 800px; margin: 0 auto;">
			<ul class="pagination">
		<%
			if (startPage2 > 1) {
		%>
			<li><a href="./myPage.jsp?pageNum2=<%=startPage2 - 1%>">이전</a></li>

		<%
			}
			for (int i = startPage2; i <= endPage2; i++) {
				if (i == currentPage2) {
		%>

			<li><a href="./myPage.jsp?pageNum2=<%=i%>" style="color: red; font-weight: bold;"><%=i%></a></li>
		<%
				} else {
		%>
			<li><a href="./myPage.jsp?pageNum2=<%=i%>" style="color: black;"><%=i%></a></li>
		<%
				}
			}
		%>

		<%
			if (endPage2 < totalPage2) {
		%>
			<li><a href="./myPage.jsp?pageNum2=<%=endPage2 + 1%>">다음</a></li>
		<%}%>
			</ul>
		</div>
    </script>

	<script id="tabcontent2" type="RecipeCardTemplate">
         <div class="my_recipes">
				<div class="left_infos">
 					<a href="../detail.jsp?recipe_bno={recipeBno}"> 
              		 <img class="user_thumbnail"  src="../r_thumbnail/{img}">
               		</a>
				</div>
				<div class="right_infos">
					<h2 class="r_title">{title}</h2>
					<div>
						{content} 
					</div>
					<div>
						<button class="myRecipeBtn">수정</button>
						<button class="myRecipeBtn">삭제</button>
					</div>
				</div>
         </div>
    </script>


	<script type="text/javascript" src="../resources/js/modal.js"></script>

</body>
</html>

