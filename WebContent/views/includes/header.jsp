<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MY DRINK RECIPE</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<link
	href="https://fonts.googleapis.com/css?family=Anton|Jomolhari|Sunflower:300&display=swap"
	rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/MyDrinkRecipe/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="/MyDrinkRecipe/resources/css/register.css">
<link rel="stylesheet" type="text/css" href="/MyDrinkRecipe/resources/css/userform.css">
<link rel="stylesheet" type="text/css" href="/MyDrinkRecipe/resources/css/myPage.css">


</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
	%>

	<header>
		<div class="header-container">
			<div class="logo">
				<a href="/MyDrinkRecipe/main.jsp"><img
					style="width: 100px; height: 100%;"
					src="/MyDrinkRecipe/resources/img/mdr_logo.png"></a>
			</div>

			<div class="user_area">
				<ul>
					<li class="register"><a
						href="/MyDrinkRecipe/views/register.jsp">레시피등록</a></li>
					<%
						if (id == null) {
					%>
					<li class="login"><a href="/MyDrinkRecipe/views/login.jsp">로그인</a></li>
					<%
						} else {
					%>
					<li class="login" id="logOn"><b><%=id%>님</b>
						<ul class="logOn-list">
							<li class="logOns"><a href="/MyDrinkRecipe/views/myPage.jsp">마이페이지</a></li>
							<li class="logOns"><a
								href="/MyDrinkRecipe/controllers/login/logoutAction.jsp">로그아웃</a></li>
						</ul></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</header>
</body>
</html>
