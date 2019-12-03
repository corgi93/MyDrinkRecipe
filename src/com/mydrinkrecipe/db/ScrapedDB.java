package com.mydrinkrecipe.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import com.mydrinkrecipe.dbconnect.DbConnect;
import com.mydrinkrecipe.dto.MyScrapedDto;
import com.mydrinkrecipe.dto.ScrapedRecipeDto;

public class ScrapedDB {
	DbConnect db = new DbConnect();

	public void insertScrapedRecipe(ScrapedRecipeDto dto) {
		String sql = "insert into scraped_recipes values (?,?)";

		Connection conn = db.getConnection();
		PreparedStatement ps = null;

		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, dto.getMy_id());
			ps.setString(2, dto.getRecipe_bno());

			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(ps, conn);
		}
	}

	public boolean isScrapedRecipe(String recipe_bno, String my_id) {
		boolean find = false;
		String sql = "SELECT * FROM scraped_recipes WHERE my_id=? AND recipe_bno=?";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		conn = db.getConnection();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, my_id);
			ps.setString(2, recipe_bno);
			rs = ps.executeQuery();

			if (rs.next())
				find = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, ps, conn);
		}
		return find;
	}

	public List<MyScrapedDto> getScrapedRecipes(String my_id) {
		List<MyScrapedDto> list = new Vector<MyScrapedDto>();

		String sql = "SELECT s.my_id, s.recipe_bno, r.title, r.writer, r.time, r.likecount, r.img, m.user_img FROM scraped_recipes s, recipe r, member m WHERE s.my_id=? AND s.recipe_bno = r.recipe_bno AND s.my_id = m.id ORDER BY recipe_bno DESC";
		Connection conn = db.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, my_id);

			rs = ps.executeQuery();

			while (rs.next()) {
				MyScrapedDto dto = new MyScrapedDto();
				// scraped_reipces
				dto.setMy_id(rs.getString("my_id"));
				dto.setRecipe_bno(rs.getString("recipe_bno"));

				// reipce
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setTime(rs.getString("time"));
				dto.setLikecount(rs.getInt("likecount"));
				dto.setImg(rs.getString("img"));

				// member
				dto.setUser_img(rs.getString("user_img"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, ps, conn);
		}
		return list;
	}

	public List<MyScrapedDto> getList(String myid, int start, int end) {
		List<MyScrapedDto> list = new Vector<MyScrapedDto>();
		String sql = "select a.* from (select ROWNUM as RNUM, b.* from"
				+ "(SELECT s.my_id, s.recipe_bno, r.title, r.writer, r.time, r.likecount, r.img, m.user_img FROM scraped_recipes s, recipe r, member m "
				+ "WHERE s.my_id=? AND s.recipe_bno = r.recipe_bno AND s.my_id = m.id ORDER BY recipe_bno asc)b)a where a.RNUM>=? and a.RNUM<=?";
		Connection conn = db.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, myid);
			ps.setInt(2, start);
			ps.setInt(3, end);

			// 실행
			rs = ps.executeQuery();

			while (rs.next()) {
				MyScrapedDto dto = new MyScrapedDto();
				// scraped_reipces
				dto.setMy_id(rs.getString("my_id"));
				dto.setRecipe_bno(rs.getString("recipe_bno"));

				// reipce
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setTime(rs.getString("time"));
				dto.setLikecount(rs.getInt("likecount"));
				dto.setImg(rs.getString("img"));

				// member
				dto.setUser_img(rs.getString("user_img"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, ps, conn);
		}
		return list;
	}

	public void deleteScrape(String my_id, String recipe_bno) {
		String sql = "delete from scraped_recipes where my_id=? and recipe_bno=?";

		Connection conn = db.getConnection();
		PreparedStatement ps = null;

		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, my_id);
			ps.setString(2, recipe_bno);

			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(ps, conn);
		}
	}

	public int getTotalCount(String my_id) {
		String sql = "select count(*) from scraped_recipes where my_id=?";
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
