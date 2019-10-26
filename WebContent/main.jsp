<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@include file="./includes/header.jsp"%>

<style type="text/css">
#container {
	margin: 0 auto;
	width: 70%;
}

.mainimg {
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
	
}

.recipe_card {
	display: inline-block;
	margin-right: 20px;
	padding: 30px;
	width: 250px;
	height: 300px;
	border: 1px solid black;
}

img {
	vertical-align: center;
}

/*
 banner 애니메이션 css
*/

.dot {
	height: 15px;
	width: 15px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active {
  background-color: #7171ff;
}

/* fade animation*/
.fade {
	animation-name: fade;
	animation-duration: 2.0s;
}

@
keyframes fade {
	from {opacity: .4
}
to {
	opacity: 1
}
}
</style>

</head>
<body>
	<div id="container">
		<div class="slideshow-container">
			<div class="slides fade">
				<img style="width: 100%; height: 500px;" src="resources/img/1.jpg">
			</div>
			<div class="slides fade">
				<img style="width: 100%; height: 500px;" src="resources/img/2.jpg">
			</div>
			<div class="slides fade">
				<img style="width: 100%; height: 500px;" src="resources/img/3.jpg">
			</div>
			<div style="text-align: center">
				<span class="dot"></span> <span class="dot"></span> <span
					class="dot"></span>
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

	<script type="text/javascript">
		var slide_idx = 0;
		showSlides();

		function showSlides() {
			// var i;

			// slides와 dots element를 DOM에서 가져옴
			var slides = document.getElementsByClassName("slides");
			var dots = document.getElementsByClassName("dot");
			console.log(dots);

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
			setTimeout(showSlides, 2500);
		}
	</script>
</body>
</html>
