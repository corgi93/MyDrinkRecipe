<%@page import="com.mydrinkrecipe.dto.MemberDto"%>
<%@page import="com.mydrinkrecipe.db.MemberDB"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		String id = (String) session.getAttribute("id");

		request.setCharacterEncoding("utf-8");
		String uploadPath = " C:\\Users\\geuna\\eclipse-workspace\\MyDrinkRecipe\\WebContent\\thumbnail_user\\";
		// String uploadPath = getServletContext().getRealPath("/r_thumbnail/");

		int size = 1024 * 1024 * 10;

		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8",
					new DefaultFileRenamePolicy());

			String introduce = multi.getParameter("introduce");
			// 실제 업로드 이미지이름 읽어오기
			String user_img = multi.getFilesystemName("profileImg");

			MemberDto dto = new MemberDto();
			dto.setId(id);
			dto.setIntroduce(introduce);
			dto.setUser_img(user_img);

			// db에 data insert
			MemberDB db = new MemberDB();
			db.insertProfile(dto);

			response.sendRedirect("../../views/myPage.jsp");

		} catch (Exception e) {
			System.out.println("업로드 오류: " + e.getMessage());
		}
	%>
</body>
</html>