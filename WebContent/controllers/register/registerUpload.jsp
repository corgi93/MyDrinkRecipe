<%@page import="com.mydrinkrecipe.db.RecipeDB"%>
<%@page import="com.mydrinkrecipe.dto.RecipeDto"%>
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
		request.setCharacterEncoding("utf-8");
		//String uploadPath = "C:\\Users\\mynam\\eclipse-workspace\\MyDrinkRecipe\\WebContent\\r_thumbnail\\";
		String uploadPath = "C:\\Users\\gurwl\\workspace\\java\\MyDrinkRecipe\\WebContent\\r_thumbnail";
		// String uploadPath = getServletContext().getRealPath("/r_thumbnail/");
		System.out.print(uploadPath);

		int size = 1024 * 1024 * 10;

		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8",
					new DefaultFileRenamePolicy());

			String title = multi.getParameter("title");
			String time = multi.getParameter("time");
			String ingredient = multi.getParameter("ingredient");
			String price = multi.getParameter("price");
			String kcal = multi.getParameter("kcal");
			String content = multi.getParameter("content");
			String writer = multi.getParameter("writer");

			// 실제 업로드 이미지이름 읽어오기
			String imgname = multi.getFilesystemName("thumbnail");
			System.out.println(imgname);

			RecipeDto dto = new RecipeDto();

			dto.setTitle(title);
			dto.setTime(time);
			dto.setIngredient(ingredient);
			dto.setWriter(writer);
			dto.setPrice(price);
			dto.setKcal(kcal);
			dto.setContent(content);
			dto.setImg(imgname);

			// db에 data insert
			RecipeDB db = new RecipeDB();
			db.insertRecipe(dto);

			response.sendRedirect("../../main.jsp");

		} catch (Exception e) {
			System.out.println("업로드 오류: " + e.getMessage());
		}
	%>
</body>
</html>