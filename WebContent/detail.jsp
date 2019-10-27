<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	.recipe_head{
		border: 1px solid red;
		width: 700px;
		height: 400px;
		margin: 0 auto; /* 크기가 정해진 div(block 인 태그) 중앙정렬 */
		padding: 20px;
	}
	.recipe_head .image{
		width: 300px;
		height: 300px;
		border: 1px solid blue;
		float: left;
	}
	.recipe_head .image_side{
		width: 300px;
		height: 300px;
		border: 1px solid purple;
		float: left;
	}
	ul li{
		list-style:none; /* ul li 에 있는 점 제거  */
	}
</style>
<header>

</header>

<div class="recipe_head">
	<div class="image">
		image
	</div>
	<div class="image_side">
		<div class="recipe_name_bar">
			<div class="recipe_name">
				recipe_name
			</div>
			<div class="recipe_creater">
				recipe_creater
			</div>
		</div>
		<div class="recipe_ingre">
			<ul>
				<li>재료</li>
				<li>재료</li>
				<li>재료</li>
				<li>재료</li>
			</ul>
		</div>
	</div>
</div>
<div class="recipe_info">
	<div class="img_box">
		<p>img</p>
		<p>이름</p>
	</div>
	<div class="img_box">
		<p>img</p>
		<p>이름</p>
	</div>
	<div class="img_box">
		<p>img</p>
		<p>이름</p>
	</div>
</div>
<div class="recipe_tip">

</div>
<div class="r_answer">

</div>

</body>
</html>
	