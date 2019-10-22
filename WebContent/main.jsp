<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>이색음료대잔치</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
.header {
	background-color: gray;
}

.mainimg {
	width: 90%;
	height: 500px;
	border: solid 1px;
}

.button {
	background-color: #f44336; /* Green */
	border: none;
	color: white;
	padding: 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 20px;
}

.recipes {
	width: 90%;
}

.recipe_card {
	display: inline-block;
	padding: 30px;
	width: 250px;
	height: 300px;
	border: 1px solid black;
}
</style>
</head>
<body>
	<header>
		<div class="header">
			<ul>
				<li>로고</li>
				<li>카페/바</li>
				<li>로그인/회원가입</li>
			</ul>
		</div>
	</header>

	<div id="container" style="margin: 0 auto;width: 85%">
		<div class="mainimg">
			<div>
				<img src="">
			</div>
		</div>
		<div class="btn" style="text-align: center;">
			<a href="#"><button class="button button1">레시피만들기</button></a>
		</div>

		<b>최신레시피</b>
		<div class="recipes">
			<div class="recipe_card"></div>
			<div class="recipe_card"></div>
			<div class="recipe_card"></div>
			<div class="recipe_card"></div>
			<div class="recipe_card"></div>
			<div class="recipe_card"></div>
			<div class="recipe_card"></div>
			<div class="recipe_card"></div>
		</div>
	</div>
	<footer> 사업자: team_Acorn </footer>
</body>
</html>































