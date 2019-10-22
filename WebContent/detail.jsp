<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style>
div.img1 {
	position: absolute;
	right: 200px;
	left: 200px;
	top: 100px;
	width: 150px;
	height: 150px;
	border: 1px solid gray;
}

div.content1 {
	position: absolute;
	right: 200px;
	left: 800px;
	top: 100px;
	width: 500px;
	height: 450px;
	border: 1px solid gray;
}

img.img_attr {
	top: 500px;
	width: 120px;
	height: 120px;
}

#recipe_info {
	position: absolute;
	top: 600px;
	left: 400px;
	maring-top: 200px;
}

div.attrs {
	display: inline-block;
	maring-top: 20px;
}

attrs.img_attr1 {
	position: absolute;
	top: 100px;
	right: 200px;
	left: 200px;

	/* border: 1px solid gray; */
}

attrs.img_attr2 {
	position: absolute;
	right: 200px;
	left: 500px;

	/* border: 1px solid gray; */
}

attrs.img_attr3 {
	position: absolute;
	top: 50px;
	right: 200px;
	left: 800px;
} /* border: 1px solid gray; */
</style>

</head>
<body>
	<div class="img1">
		<img src="./image/tank.jpg" />
	</div>

	<div class="content1">
		<h2>탱크보이주1</h2>
		<hr>
		<ul>
			<li>레시피Recipe</li>
			<li>탱크보이 1개</li>
			<li>소주4잔</li>
			<li>사이다 4잔</li>
			<li>스키틀즈 (토핑은 선택)</li>
		</ul>
		<div id="recipe_info">
			<div class="attrs">
				<img class="img_attr1" src="./image/price.png"
					style="width: 200px; height: 200px;" />
				<div>가격=약5200원(스키틀즈 포함)</div>
			</div>
			<div class="attrs">
				<img class="img_attr2" src="./image/time.png"
					style="width: 160px; height: 160px;" />
				<div>시간=약1분</div>
			</div>
			<div class="attrs">
				<img class="img_attr3" src="./image/kcal.png"
					style="width: 200px; height: 200px;" />
				<div>칼로리=약310kcal</div>
			</div>
		</div>
	</div>



</body>
</html>