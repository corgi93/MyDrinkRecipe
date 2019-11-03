<%@page import="com.mydrinkrecipe.dto.RecipeDto"%>
<%@page import="com.mydrinkrecipe.db.RecipeDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MY DRINK RECIPE</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css"
	href="/MyDrinkRecipe/resources/css/detail.css">

<%@include file="./views/includes/header.jsp"%>

</head>
<%
	String root = request.getContextPath();
%>

<body>

	<%
		RecipeDB db = new RecipeDB();
		String bno = request.getParameter("bno");
		int r_bno = Integer.parseInt(bno);

		RecipeDto dto = db.getDetail(r_bno);
	%>

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
				</div>
				<div class="recipe_creater">
					<img class="head_profil" src="resources/img/profil1.png">
					<h3>아이엠샘</h3>
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
		<p class="tip_content">스키틀즈를 좋아하는 사람은 스키틀즈 토핑을 넣어보세요</p>
	</div>
	<div class="answer_comment">
		<div class="comment_subject">한 줄 댓글</div>
		<div id="comment_box">
			<div class="new_comment">
				<span class="answer_profil_img">image</span>
				<div class="answer_info">
					<div class="answer_nickname">nickname</div>
					<div class="answer_writeday">writeday</div>
					<div class="answer_input"></div>
						<input class="input_content" type="text" name="content"
							id="content" placeholder="한 줄 댓글을 남겨주세요" /> 
						<input type="hidden" name="recipe_bno" value="<%=dto.getBno()%>">
						<button type="submit" id="btnsave" class="btn2">댓글남기기</button>
				</div>
			</div>

			<div class="old_comment">
				<span class="answer_profil_img" id="img">image</span>
				<div class="answer_info">
					<div class="answer_nickname" id="nickname">nickname</div>
					<div class="answer_writeday">writeday</div>
					<div class="answer_input" id="out1"></div>
					<p class="user_comment"></p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>