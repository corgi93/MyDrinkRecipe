package com.mydrinkrecipe.dto;

import java.sql.Timestamp;

public class CommentDto {
	private int c_bno;
	private int recipe_bno;
	private String c_content;
	private Timestamp writeday;
	
	public int getRecipe_bno() {
		return recipe_bno;
	}
	public void setRecipe_bno(int recipe_bno) {
		this.recipe_bno = recipe_bno;
	}
	public int getC_bno() {
		return c_bno;
	}
	public void setC_bno(int c_bno) {
		this.c_bno = c_bno;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	
}
