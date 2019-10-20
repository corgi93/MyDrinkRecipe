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
	width: 100px;
	height: 100px;
	border: 1px solid gray;
}

div.content1 {
	position: absolute;
	right: 200px;
	left: 500px;
	top: 100px;
	width: 400px;
	height: 400px;
	border: 1px solid gray;
}

img.img_attr {
	top: 500px;
	width: 120px;
	height: 120px;

}

#recipe_info {
	position: absolute;
	top: 500px;
	maring-top: 200px;
}

div.attrs {
	display: inline-block;
	maring-top: 20px;
}

div.attrs>img_attr1 {
	position: absolute;
	right: 200px;
	left: 200px;
	
	/* border: 1px solid gray; */
}
div.attrs>img_attr2{
	position: absolute;
	right: 200px;
	left: 500px;

	/* border: 1px solid gray; */
}

div.attrs>img_attr3 {
	position: absolute;
	right: 200px;
	left: 800px;

} /* border: 1px solid gray; */
</style>

</head>
<body>
	<div class="img1">
		<img src="../image/SurekPra.png" />
	</div>

	<div class="content1">
		<h1>슈렉프라푸치노</h1>
		<hr>
		<h2>레시피Recipe</h2>
		<h3>#통자바칩 1/2</h3>
		<h3>#초코드리즐</h3>
		<h3>#일반휘핑</h3>
		<h3>#자바칩1/2 갈아넣기</h3>
		<h3>#그린티 프라푸치노</h3>
		<h3>#에스프레소 1샷</h3>
		<h3>#에스프레소 2샷</h3>

		<!-- <pre>
		레시피= #통자바칩 1/2
			#초코드리즐
			#일반휘핑
			#자바칩1/2 갈아넣기
			#그린티 프라푸치노
			#에스프레소 1샷</pre> -->
	</div>

	<div id="recipe_info">
		<div class="attrs">
			<img class="img_attr1" src="../image/price.png" />
		</div>
		<div class="attrs">
			<img class="img_attr2" src="../image/time.png" />
		</div>
		<div class="attrs">
			<img class="img_attr3" src="../image/kcal.png" />
		</div>
	</div>
	
</body>
</html>