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
		height: 312px;
		margin: 0 auto; /* 크기가 정해진 div(block 인 태그) 중앙정렬 */
		padding: 20px;
		display: flex;  /* 작성자 영역 옆으로 눕힘 */
		justify-content: space-between;  <!-- 공간 사이 띄움 -->
	}
	.recipe_head .image{
		width: 335px;
		height: 300px;
		border: 1px solid blue;
		float: left;
	}
	.recipe_head .recipe_main{
		width: 335px;
		height: 300px;
		border: 1px solid purple;
		float: left;
	}
	.recipe_name_bar{
		display: flex;  /* 작성자 영역 옆으로 눕힘 */
		justify-content: space-between;  <!-- 공간 사이 띄움 -->
	}
	.recipe_info{
		width: 700px;
		height: 200px;
		border: 1px solid #DDD;
		margin: 0 auto;
		padding: 20px;
		display: flex;
		justify-content: space-around;
	}
	.img_box{
		width: 150px;
		height: 200px;
		border: 1px solid red;
		text-align: center;
	}
	.img_box .img{
		width:100px;
		height: 100px;
		border: 1px solid black;
		border-radius: 50%;
		margin: 0 auto;
		overflow: hidden;/* 영역에서 넘치는 부분 바깥영역 자동 잘림 */
		
	}
	.recipe_tip{
		width:700px;
		height: 100px;
		border: 1px solid gray;
		margin: 0 auto;
		padding: 20px;
	}
	.recipe_tip .tip_content{
		width:655px;
		height: 50px;
		border: 1px solid gray;
		margin: 0 auto;
		padding: 20px;
	}
	.r_answer{
		width:700px;
		height: 200px;
		border: 1px solid gray;
		margin: 0 auto;
		padding: 20px;
	}
	.profil_img{
		width: 60px;
		height: 60px;
		border:  1px solid green;
		border-radius: 50%;
		margin: 0 auto;
		overflow: hidden;
		float: left;
	}
	.answer_info{
		width: 615px;
		height: 60px;
		border:  1px solid gray;
		margin: 0 auto;
		overflow: hidden;
		float: right;
	}
	.nickname{
		width: 100px;
		height: 20px;
		border:  1px solid gray;
		margin: 0 auto;
		float: left;
	}
	.writeday{
		width: 100px;
		height: 20px;
		border:  1px solid gray;
		margin: 0 auto;
		float: left;
	}
	.a_content{
		width: 600px;
		height: 25px;
		border:  1px solid gray;
		margin: 0 auto;
	}
	
	ul li{
		list-style:none; 
		/* ul li 에 있는 점 제거  */
	}
</style>
<header>

</header>

<div class="recipe_head">
	<div class="image">
	image
	</div>
	<div class="recipe_main">
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
		<div class="img">
		<img alt="이미지 없음" style="width:110px; height: 110px;" src="./image/price.png">
		</div>
		<p>가격=5200원</p>
	</div>
	<div class="img_box">
		<div class="img">
		</div>
		<p>소요시간=약1분</p>
	</div>
	<div class="img_box">
		<div class="img">
		</div>
		<p></p>
	</div>
</div>
<div class="recipe_tip">
	<div>나만의 꿀팁</div>
	<input class="tip_content" type="text" name=""/>
	</div>
<div class="r_answer">
<div>한줄 댓글</div>
	<div class="profil_img">image</div>
	<div class="answer_info">
		<div class="nickname">nickname</div>
		<div class="writeday">writeday</div>
		<div class="answer_content"> 
		<input class="a_content" type="text" name=""/>
		</div>
	</div>
	</div>
</body>
</html>
