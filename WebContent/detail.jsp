<%@page import="com.mydrinkrecipe.db.ScrapedDB"%>
<%@page import="com.mydrinkrecipe.dto.RecipeMemberDto"%>
<%@page import="com.mydrinkrecipe.dto.RecipeDto"%>
<%@page import="com.mydrinkrecipe.db.RecipeDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="./views/includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MY DRINK RECIPE</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css"
	href="/MyDrinkRecipe/resources/css/detail.css">
</head>
<body>
	<%
		RecipeDB db = new RecipeDB();
		String bno = request.getParameter("recipe_bno");

		RecipeMemberDto dto = db.getDetail(bno);
	%>

	<input id="bno" type="hidden" value="<%=bno%>">

	<div class="recipe_head">
		<div class="recipe_image">
			<img alt="이미지 없음" src="r_thumbnail/<%=dto.getImg()%>">
		</div>
		<div class="recipe_main">
			<div class="recipe_name_bar">
				<div class="recipe_name">
					<h2>
						<strong><%=dto.getTitle()%></strong>
					</h2>
					<input type="hidden" id="recipe_bno" name="recipe_bno"
						value="<%=dto.getRecipe_bno()%>"> <input type="hidden"
						id="member_nick" name="member_nick" value="<%=dto.getWriter()%>">
					<%
						ScrapedDB scrape_db = new ScrapedDB();
						boolean isPicked = scrape_db.isScrapedRecipe(dto.getRecipe_bno(), id);

						if (id.equals(dto.getId())) {
					%>
					<button>수정</button>
					<%
						} else {
							if (isPicked == false) {
					%>

					<button type="button" id="scrapeBtn" style="color: green;" 
						onclick="scrapeRecipe()">스크랩</button>
					<%
						} else {
					%>
					<button type="button" id="scrapeCancel" style="color: red;"
						onclick="cancelRecipe()">스크랩 취소</button>
					<%
						}
					}
					%>
					<div id="scrapeout">
					
					</div>
				</div>
				<div class="recipe_creater">
					<img class="head_profil" src="resources/img/<%=dto.getUser_img()%>">
					<h3><%=dto.getNickname()%></h3>
				</div>
			</div>

			<div class="recipe_ingre">
				<ul>
					<li class="ingre_top"><h3>
							재료 :
							<%=dto.getIngredient()%></h3></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="recipe_info">
		<div class="img_box">
			<div class="img">
				<img alt="이미지 없음" src="resources/img/wallet.PNG"
					style="width: 150px; height: 150px;">
			</div>
			<p><%=dto.getPrice()%></p>
		</div>
		<div class="img_box">
			<div class="img">
				<img alt="이미지 없음" src="resources/img/clock1.png "
					style="width: 150px; height: 150px;">
			</div>
			<p>
				<%=dto.getTime()%></p>
		</div>
		<div class="img_box">
			<div class="img">
				<img alt="이미지 없음" src="resources/img/run.PNG"
					style="width: 150px; height: 150px;">
			</div>
			<p><%=dto.getKcal()%></p>
		</div>
	</div>

	<div class="recipe_tip">
		<div class="tip">
			<strong>나만의 꿀팁<strong></strong>
		</div>
		<p class="tip_content"><%=dto.getContent()%></p>
	</div>
	<div class="answer_comment">
		<div class="comment_subject">한 줄 댓글</div>
		<div id="comment_box">
			<div class="new_comment">
				<div class="answer_info">
					<input class="input_content" type="text" name="content"
						id="content" placeholder="한 줄 댓글을 남겨주세요" /> <input type="hidden"
						id="recipe_bno" name="recipe_bno" value="<%=bno%>">
					<!-- hidden으로 id랑 name주고 value보내장! -->
					<input type="hidden" id="nick" name="nick"
						value="<%=dto.getNickname()%>">
					<!-- hidden으로 id랑 name주고 value보내장! -->
					<input type="hidden" id="user_img" name="user_img"
						value="<%=dto.getUser_img()%>">
					<!-- hidden으로 id랑 name주고 value보내장! -->
					<button type="button" id="btnsave" class="btn2">댓글남기기</button>
				</div>
			</div>


			<div class="answer_input" id="out1"></div>
			<p class="user_comment"></p>
		</div>
	</div>

	<script type="text/javascript" src="./resources/js/detailScrape.js"></script>
	<script type="text/javascript" src="./resources/js/detailComment.js"></script>
</body>
</html>