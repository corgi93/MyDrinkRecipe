<%@page import="com.mydrinkrecipe.dto.RecipeMemberDto"%>
<%@page import="java.util.Vector"%>
<%@page import="com.mydrinkrecipe.dto.RecipeDto"%>
<%@page import="java.util.List"%>
<%@page import="com.mydrinkrecipe.db.RecipeDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="./views/includes/header.jsp"%>

<%
      RecipeDB db = new RecipeDB();
      List<RecipeMemberDto> list = new Vector<RecipeMemberDto>();
      list = db.getCardList();
%>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<body>
	<div id="container">
		<div class="slideshow-container">
			<div class="slides fade">
				<img style="width: 100%; height: 400px;" src="resources/img/1.jpg">
			</div>
			<div class="slides fade">
				<img style="width: 100%; height: 400px;" src="resources/img/2.jpg">
			</div>
			<div class="slides fade">
				<img style="width: 100%; height: 400px;" src="resources/img/3.jpg">
			</div>
			<div style="text-align: center; margin-top: -25px;">
				<span class="dot"></span> <span class="dot"></span> <span
					class="dot"></span>
			</div>
		</div>
		<div class="btn" style="text-align: center; margin-top: 10px;">
			<a href="./views/register.jsp"><button class="button button1">레시피만들기</button></a>
		</div>

		<h2>최신레시피</h2>

		<!-- 이 밑부분을 form으로 만들어야함 -->
		<div class="recipes">
			<%
            for (RecipeMemberDto dto : list) {
         %>

			<div class="recipe_card">
				<div class="card_img">
					<a class="card1"
						href="./detail.jsp?recipe_bno=<%=dto.getRecipe_bno()%>"> <img
						src="r_thumbnail/<%=dto.getImg()%>">
					</a> <a class="card2"> <img
						src="thumbnail_user/<%=dto.getUser_img()%>">
					</a>
				</div>
				<div style="text-align: center;">
					<p>
						<a class="card3"><b><%=dto.getWriter()%></b></a>
					</p>
					<p>
						<a class="card4"><%=dto.getTitle()%></a>
					</p>
					<p>
						<a class="card5"><%=dto.getRecipe_bno()%></a>
					</p>
				</div>
				<div class="option">
					<div class="option1">
						<i class="fas fa-heart"></i>&nbsp;<%=dto.getLikecount() %>명
					</div>
					<div class="option2">
						<i class="fas fa-hourglass-half"></i>&nbsp;<%=dto.getTime()%>
					</div>
				</div>
			</div>
			<%
            }
         %>

			<div class="recipe_card">
				<div class="card_img">
					<a class="card1"> <img src="resources/img/drop.jpg">
					</a> <a class="card2"> <img src="resources/img/love.jpg">
					</a>
				</div>
				<div style="text-align: center;">
					<p>
						<a class="card3"><b>닉네임</b></a>
					</p>
					<p>
						<a class="card4">타이틀</a>
					</p>
				</div>
				<div class="option">
					<div class="option1">
						<i class="fas fa-heart"></i>&nbsp;명
					</div>
					<div class="option2">
						<i class="fas fa-hourglass-half"></i>&nbsp;분
					</div>
				</div>
			</div>




			<div class="recipe_card">
				<div class="card_img">
					<a class="card1"> <img src="resources/img/drop.jpg">
					</a> <a class="card2"> <img src="resources/img/love.jpg">
					</a>
				</div>
				<div style="text-align: center;">
					<p>
						<a class="card3"><b>닉네임</b></a>
					</p>
					<p>
						<a class="card4">제목</a>
					</p>
				</div>
				<div class="option">
					<div class="option1">
						<i class="fas fa-heart"></i>&nbsp;명
					</div>
					<div class="option2">
						<i class="fas fa-hourglass-half"></i>&nbsp;분
					</div>
				</div>
			</div>
			<div class="recipe_card">
				<div class="card_img">
					<a class="card1"> <img src="resources/img/drop.jpg">
					</a> <a class="card2"> <img src="resources/img/love.jpg">
					</a>
				</div>
				<div style="text-align: center;">
					<p>
						<a class="card3"><b>닉네임</b></a>
					</p>
					<p>
						<a class="card4">제목</a>
					</p>
				</div>
				<div class="option">
					<div class="option1">
						<i class="fas fa-heart"></i>&nbsp;명
					</div>
					<div class="option2">
						<i class="fas fa-hourglass-half"></i>&nbsp;분
					</div>
				</div>
			</div>
			<div class="recipe_card">
				<div class="card_img">
					<a class="card1"> <img src="resources/img/drop.jpg">
					</a> <a class="card2"> <img src="resources/img/love.jpg">
					</a>
				</div>
				<div style="text-align: center;">
					<p>
						<a class="card3"><b>닉네임</b></a>
					</p>
					<p>
						<a class="card4">제목</a>
					</p>
				</div>
				<div class="option">
					<div class="option1">
						<i class="fas fa-heart"></i>&nbsp;명
					</div>
					<div class="option2">
						<i class="fas fa-hourglass-half"></i>&nbsp;분
					</div>
				</div>
			</div>
			<div class="recipe_card">
				<div class="card_img">
					<a class="card1"> <img src="resources/img/drop.jpg">
					</a> <a class="card2"> <img src="resources/img/love.jpg">
					</a>
				</div>
				<div style="text-align: center;">
					<p>
						<a class="card3"><b>닉네임</b></a>
					</p>
					<p>
						<a class="card4">제목</a>
					</p>
				</div>
				<div class="option">
					<div class="option1">
						<i class="fas fa-heart"></i>&nbsp;명
					</div>
					<div class="option2">
						<i class="fas fa-hourglass-half"></i>&nbsp;분
					</div>
				</div>
			</div>
			<div class="recipe_card">
				<div class="card_img">
					<a class="card1"> <img src="resources/img/drop.jpg">
					</a> <a class="card2"> <img src="resources/img/love.jpg">
					</a>
				</div>
				<div style="text-align: center;">
					<p>
						<a class="card3"><b>닉네임</b></a>
					</p>
					<p>
						<a class="card4">제목</a>
					</p>
				</div>
				<div class="option">
					<div class="option1">
						<i class="fas fa-heart"></i>&nbsp;명
					</div>
					<div class="option2">
						<i class="fas fa-hourglass-half"></i>&nbsp;분
					</div>
				</div>
			</div>
			<div class="recipe_card">
				<div class="card_img">
					<a class="card1"> <img src="resources/img/drop.jpg">
					</a> <a class="card2"> <img src="resources/img/love.jpg">
					</a>
				</div>
				<div style="text-align: center;">
					<p>
						<a class="card3"><b>닉네임</b></a>
					</p>
					<p>
						<a class="card4">제목</a>
					</p>
				</div>
				<div class="option">
					<div class="option1">
						<i class="fas fa-heart"></i>&nbsp;명
					</div>
					<div class="option2">
						<i class="fas fa-hourglass-half"></i>&nbsp;분
					</div>
				</div>
			</div>
			<div class="recipe_card">
				<div class="card_img">
					<a class="card1"> <img src="resources/img/drop.jpg">
					</a> <a class="card2"> <img src="resources/img/love.jpg">
					</a>
				</div>
				<div style="text-align: center;">
					<p>
						<a class="card3"><b>닉네임</b></a>
					</p>
					<p>
						<a class="card4">제목</a>
					</p>
				</div>
				<div class="option">
					<div class="option1">
						<i class="fas fa-heart"></i>&nbsp;명
					</div>
					<div class="option2">
						<i class="fas fa-hourglass-half"></i>&nbsp;분
					</div>
				</div>
			</div>
		</div>
	</div>


	<footer> 사업자:  </footer>


	<script type="text/javascript">
      var slide_idx = 0;
      showSlides();

      function showSlides() {
         // var i;

         // slides와 dots element를 DOM에서 가져옴
         var slides = document.getElementsByClassName("slides");
         var dots = document.getElementsByClassName("dot");

         for (var i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
         }

         slide_idx++;

         if (slide_idx > slides.length) {
            slide_idx = 1
         }

         for (var i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace("active", "");
         }

         slides[slide_idx - 1].style.display = "block";
         dots[slide_idx - 1].className += " active";

         // 2.5초마다 변경, 재귀
         setTimeout(showSlides, 3000);
      }
      
   </script>
</body>
</html>