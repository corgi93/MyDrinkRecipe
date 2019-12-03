package com.mydrinkrecipe.dto;

public class MyScrapedDto {
	// Scraped_recipes dto
	private String my_id;
	private String recipe_bno;

	// Recipe 메뉴 뿌려줄 데이터
	private String title;
	private String writer;
	private String time;
	private String img;
	private int likecount;

	// member
	private String user_img;

	public String getMy_id() {
		return my_id;
	}

	public void setMy_id(String my_id) {
		this.my_id = my_id;
	}

	public String getRecipe_bno() {
		return recipe_bno;
	}

	public void setRecipe_bno(String recipe_bno) {
		this.recipe_bno = recipe_bno;
	}

	// Recipe getter, setter
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getLikecount() {
		return likecount;
	}

	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	// member dto
	public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

}
