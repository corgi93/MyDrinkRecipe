<%@page import="com.mydrinkrecipe.dto.RecipeMemberDto"%>
<%@page import="com.mydrinkrecipe.dto.RecipeDto"%>
<%@page import="com.mydrinkrecipe.db.RecipeDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@include file="./views/includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MY DRINK RECIPE</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css"
   href="/MyDrinkRecipe/resources/css/detail.css">
</head>
<body>

   <%
      RecipeDB db = new RecipeDB();
      String bno = request.getParameter("recipe_bno");

      RecipeMemberDto dto = db.getDetail(bno);
   %>

    <input id="bno" type="hidden" value="<%=bno %>">
<div class="detail">
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
                     value="<%=dto.getRecipe_bno()%>"> 
                     <input type="hidden"id="member_nick" name="member_nick" value="<%=dto.getWriter()%>">
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
         나만의 꿀팁
      </div>
      <p class="tip_content"><%=dto.getContent()%></p>
   </div>
   <div class="answer_comment">
   <div class="comment_subject">한 줄 댓글</div>
      <div id="comment_box">
         <div class="new_comment">
            <div class="answer_info">
                  <input class="input_content" type="text" name="content"
                     id="content" placeholder="한 줄 댓글을 남겨주세요" /> 
                  <input type="hidden" id="recipe_bno" name="recipe_bno" value="<%=bno%>"> <!-- hidden으로 id랑 name주고 value보내장! -->
                  <input type="hidden" id="nick" name="nick" value="<%=dto.getNickname()%>"> <!-- hidden으로 id랑 name주고 value보내장! -->
                  <input type="hidden" id="user_img" name="user_img" value="<%=dto.getUser_img()%>"><!-- hidden으로 id랑 name주고 value보내장! -->
                  <button type="button" id="btnsave" class="btn2">댓글남기기</button>
            </div>
         </div>
               <p class="user_comment"></p>
      </div>
   <div class="answer_input" id="out1"> </div>
	<!--  <form class="form-delete" action="./controllers/comments/commentdelete.jsp" method="post">
   		<input type="hidden" name="comment_del" value="comment_del"/>
   		<button type="submit" class="btn_delete">삭제</button>
   </form>  -->
   
</div>
   <script type="text/javascript" src="./resources/js/detailComment.js"></script>
		
	<script id="commentTemplate" type="commentTemplate">
		<div class="old_comment">
			<span class="answer_profil_img">
				<img src={memberimg}>
			</span>
			<div style="width:600px;">
				<b>{nickname}</b>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<writeday>{writeday}</writeday>
			</div>
			<div style="width:600px;">{content}</div>
		</div>
	</script>

</body>
</html>