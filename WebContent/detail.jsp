<%@page import="com.mydrinkrecipe.dto.RecipeMemberDto"%>
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
<body>

	<%
		RecipeDB db = new RecipeDB();
		String bno = request.getParameter("recipe_bno");

		RecipeMemberDto dto = db.getDetail(bno);
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
					<form action="./controllers/recipe/scrapRecipeXml.jsp">
						<input type="hidden" id="recipe_bno" name="recipe_bno"
							value="<%=dto.getRecipe_bno()%>"> <input type="hidden"
							id="member_nick" name="member_nick" value="<%=dto.getWriter()%>">
						<button type="submit" id="scrapeBtn">스크랩</button>
					</form>
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
				<span class="answer_profil_img">image</span>
				<div class="answer_info">
					<div class="answer_nickname">nickname</div>
					<div class="answer_writeday">writeday</div>
					<div class="answer_input"></div>
					<form class="comment_box" id="comment_form"
						action="./controllers/comments/commentAction.jsp"
						accept-charset="UTF-8" method="post">
						<input class="input_content" type="text" name="content"
							id="content" placeholder="한 줄 댓글을 남겨주세요" /> 
						<input type="hidden" id="recipe_bno" name="recipe_bno" value="<%=bno%>"> 
						<input type="hidden" id="nick" name="nick" value="<%=dto.getNickname()%>"> 
						<input type="hidden" id="user_img" name="user_img" value="<%=dto.getUser_img()%>">
						<button type="submit" id="btnsave" class="btn2">댓글남기기</button>
					</form>
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

	<script type="text/javascript" src="./resources/js/detail.js"></script>
	<script type="text/javascript">
	$(function() {
		//처음 시작시 댓글 리스트 출력
		/* list();  */
		
		$("#btnsave").click(function(){
			var content = $("#content").val();
			var recipe_bno = $("#recipe_bno").val();
			var nick = $("#nick").val();
			var user_img=$("#user_img").val();
			
			if(content==null){
				alert("내용을 반드시 입력해주세요");
				return false;
			}
			
			$.ajax({
				type:"post",
				url:"controllers/comments/commentAction.jsp",
				dataType:"xml",
				data:{
					"content":content,
					"recipe_bno" : recipe_bno,
					"nick" : nick,
					"user_img":user_img,
				},
				success:function(data){
					var d = data.find("commentdata").text();
					var s=$(this);

					$("#content").val("");
					$("#content").focus();
					
				$(data).find("commentdata").each(function(){
					var str="";
					
					str+="<div stylye='width:600px;'>";
					str+="<b>"+s.find("nick").text()+"</b>";
					str+="+s.find("content").text();
					str+="+s.find("memberimg").text();";
					str+="<writeday>"+s.find("writeday").text()+"</write>";
					str+="</div>";
				});
				
				$("#out1").html(str);
				},
				 statusCode : {
		               404: function(){
		                  alert("url을 찾을수 없어요");
		               },
		               500: function(){
		                  alert("서버 오류");
		               }
		            }
			});
		});
	});
	
	<%-- function list()
	{
	//데이터 불러오기
	$.ajax({
		type:"post",
		url:"controllers/comments/commentList.jsp",
		data:{"recipe_bno":<%=dto.getRecipe_bno()%>},
		success:function(data){
			$(data).find("commentdata").each(function(){
				var s=$(this);
				str+="<div style='width:600px;''>";
				str+=s.find("content").text();
				str+="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				str+="<writeday>"+s.find("writeday").text()+"</writeday>";
				str+="</div>";
			});
			$("#out1").html(str);
		},
		statusCode:{
          	404:function(){
                    alert("url 을 찾을수 없어요");
          	},
          	500:function(){
                    alert("서버 오류");
          	}
    	}
	});
	}   --%>
	</script>

</body>
</html>