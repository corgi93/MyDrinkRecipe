package com.mydrinkrecipe.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import com.mydrinkrecipe.dbconnect.DbConnect;
import com.mydrinkrecipe.dto.MyRecipesDto;
import com.mydrinkrecipe.dto.MyScrapedDto;

public class MyRecipeDB {

	DbConnect db = new DbConnect();

	public List<MyRecipesDto> getMyRecipes(String my_id) {
		List<MyRecipesDto> list = new Vector<MyRecipesDto>();
		String sql = "SELECT r.recipe_bno, r.title, r.content, r.likecount, r.time, r.writer, r.img, m.nickname FROM recipe r, member m WHERE r.writer = m.nickname AND m.id=?";

		Connection conn = db.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, my_id);

			rs = ps.executeQuery();

			while (rs.next()) {
				MyRecipesDto dto = new MyRecipesDto();

				// reipce
				dto.setRecipe_bno(rs.getString("recipe_bno"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWriter(rs.getString("writer"));
				dto.setTime(rs.getString("time"));
				dto.setLikecount(rs.getInt("likecount"));
				dto.setImg(rs.getString("img"));

				// member
				dto.setNickname(rs.getString("nickname"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, ps, conn);
		}
		return list;
	}
	
	public List<MyRecipesDto> getMyRecipesList(String my_id, int start, int end) {
		List<MyRecipesDto> list = new Vector<MyRecipesDto>();
		String sql = "SELECT a.* FROM (select ROWNUM as RNUM, b.* FROM "
				+ "(SELECT r.recipe_bno, r.title, r.content, r.likecount, r.time, r.writer, r.img, m.nickname FROM recipe r, member m WHERE r.writer = m.nickname AND m.id=?)b)a "
				+ "where a.RNUM>=? and a.RNUM<=?";
		Connection conn = db.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, my_id);
			ps.setInt(2, start);
			ps.setInt(3, end);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				MyRecipesDto dto = new MyRecipesDto();
				
				// reipce
				dto.setRecipe_bno(rs.getString("recipe_bno"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWriter(rs.getString("writer"));
				dto.setTime(rs.getString("time"));
				dto.setLikecount(rs.getInt("likecount"));
				dto.setImg(rs.getString("img"));
				
				// member
				dto.setNickname(rs.getString("nickname"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, ps, conn);
		}
		return list;
	}

	public int getTotalCount(String my_id) {
		String sql = "select count(*) from recipe r, member m where r.writer = m.nickname AND m.id=?";
		Connection conn = db.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, my_id);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, ps, conn);
		}
		return count;
	}

}
