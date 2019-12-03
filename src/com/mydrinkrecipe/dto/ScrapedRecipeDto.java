package com.mydrinkrecipe.dto;

public class ScrapedRecipeDto {
	private String my_id;
	private String writer;
	private String recipe_bno;

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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
}
