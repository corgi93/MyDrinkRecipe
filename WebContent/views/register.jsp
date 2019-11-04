<%@page import="com.mydrinkrecipe.dto.MemberDto"%>
<%@page import="com.mydrinkrecipe.db.MemberDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@include file="./includes/header.jsp"%>

<%
	MemberDB db = new MemberDB();

	// session에서 얻은 id에서 dto 반환. nickname을 가져오기 위해
	MemberDto dto = db.getMyPageInfos(id);
%>
<div id="register_area">
	<h2>내 꿀조합 등록</h2>
	<form action="../controllers/register/registerUpload.jsp" method='post'
		enctype="multipart/form-data">
		<div>
			<h3>레시피 이름</h3>
			<input class="register_input" type="text" name='title'
				placeholder="레시피 이름을 작성해주세요" />
		</div>
		<div>
			<h3>재 료</h3>
			<input class="register_input" type="text" name='ingredient'
				placeholder="재료 이름을 작성해주세요" />
		</div>
		<div>
			<h3>가격</h3>
			<input class="register_input" type="text" name='price'
				placeholder="가격을 작성해주세요" />
		</div>
		<div>
			<h3>소요 시간</h3>
			<input class="register_input" type="text" name='time'
				placeholder="제조 시간을 작성해주세요" />
		</div>
		<div>
			<h3>kcal</h3>
			<input class="register_input" type="text" name='kcal'
				placeholder="칼로리를 작성해주세요" />
		</div>
		<div>
			<h3>나만의 황금조합</h3>
			<textarea class="register_input" name='content'
				placeholder="조리 과정을 적어주세요."></textarea>
		</div>
		<div>
			<h3>썸네일 등록</h3>
			<input class="register_input" type="file" name='thumbnail' />
		</div>
		<div class="form_btns">
			<button class="btns" id="complete" type="submit">등록완료</button>
			<button class="btns" id="back" type="button">뒤로</button>
		</div>

		<input type="hidden" name="writer" value="<%=dto.getNickname()%>">
	</form>
</div>
</body>
</html>