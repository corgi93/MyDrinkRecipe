package com.mydrinkrecipe.dto;

import java.sql.Timestamp;

public class CommentDto {
	private String comment_bno;
	private String recipe_bno;
	private String nickname;
	private String memberimg;
	private String content;
	private Timestamp writeday;

	public String getComment_bno() {
		return comment_bno;
	}

	public void setComment_bno(String comment_bno) {
		this.comment_bno = comment_bno;
	}

	public String getRecipe_bno() {
		return recipe_bno;
	}

	public void setRecipe_bno(String recipe_bno) {
		this.recipe_bno = recipe_bno;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMemberimg() {
		return memberimg;
	}

	public void setMemberimg(String memberimg) {
		this.memberimg = memberimg;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getWriteday() {
		return writeday;
	}

	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}

}
