package com.mydrinkrecipe.dto;

import java.sql.Timestamp;

public class CommentDto {
	private int bno;
	private int recipe_bno;
	private String content;
	private Timestamp writeday;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRecipe_bno() {
		return recipe_bno;
	}
	public void setRecipe_bno(int recipe_bno) {
		this.recipe_bno = recipe_bno;
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
