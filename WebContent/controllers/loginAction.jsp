<%@page import="com.mydrinkrecipe.dto.MemberDto"%>
<%@page import="com.mydrinkrecipe.db.MemberDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
	<%
		// post로 받은 데이터 한글처리
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String idsave = request.getParameter("idsave");

		// member DB에서 id, pw

		MemberDB db = new MemberDB();
		MemberDto dto = db.getLoginData(id);

		System.out.println(dto.getId() + "/" + id);
		System.out.println(dto.getPassword() + "/" + pw);

		if (id.equals(dto.getId())) {
			if (pw.equals(dto.getPassword())) {
				// login작업 -> session값 생성
				session.setAttribute("id", id);
				session.setAttribute("pw", pw);

				session.setAttribute("idsave", idsave == null ? "no" : "yes");
				//session유지 시간
				session.setMaxInactiveInterval(60 * 60 * 12);
	%>
	<script type="text/javascript">
		alert("인증완료!")
		location.href = "../main.jsp";
	</script>

	<%
		} else {
	%>

	<script type="text/javascript">
		alert("비밀번호가 다릅니다.")
		location.href = "../views/login.jsp"
	</script>
	<%
		}
		} else {
	%>
	<script type="text/javascript">
		alert("아이디가 다릅니다.");
		location.href = "../views/login.jsp"
	</script>
	<%
		}
	%>
</body>
</html>