package com.mydrinkrecipe.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mydrinkrecipe.dbconnect.DbConnect;
import com.mydrinkrecipe.dto.RecipeDto;

public class RecipeDB {
	DbConnect db = new DbConnect();

	// 레시피 등록
	public void insertRecipe(RecipeDto dto) {
		String sql = "insert into recipe values(seq_recipe.nextval,?,?,?,?,?,?,?,?)";

		Connection conn = db.getConnection();
		PreparedStatement ps = null;

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getIngredient());
			ps.setString(4, dto.getTime());
			ps.setString(5, dto.getPrice());
			ps.setInt(6, dto.getLikecount());
			ps.setString(7, dto.getKcal());
			ps.setString(8, dto.getImg());

			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(ps, conn);
		}
	}

}
