<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@include file="./includes/header.jsp"%>


<div id="register_area">
	<h2>내 꿀조합 등록</h2>
	<form action="" method='post'>
		<div>
			레시피 이름: <input class="register_input" type="text" name='' />
		</div>
		<div>
			소요 시간 : <input class="register_input" type="text" name='' />
		</div>
		<div>
			재 료 : <input class="register_input" type="text" name='' />
		</div>
		<div>
			kcal : <input class="register_input" type="text" name='' />
		</div>
		<div class="form_btns">
			<button class="btns" type="submit">등록완료</button>
			<button class="btns" type="button">뒤로</button>
		</div>
	</form>
</div>
</body>
</html>