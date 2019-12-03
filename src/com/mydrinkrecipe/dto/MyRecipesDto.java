package com.mydrinkrecipe.dto;

public class MyRecipesDto {
	// recipe table
	private String recipe_bno;
	private String title;
	private String content;
	private String time;
	private int likecount;
	private String img;
	private String writer;

	// member table
	private String nickname;

	public String getRecipe_bno() {
		return recipe_bno;
	}

	public void setRecipe_bno(String recipe_bno) {
		this.recipe_bno = recipe_bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
