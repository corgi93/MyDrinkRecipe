package com.mydrinkrecipe.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import com.mydrinkrecipe.dbconnect.DbConnect;
import com.mydrinkrecipe.dto.MemberDto;
import com.mydrinkrecipe.dto.RecipeDto;

public class RecipeDB {
	DbConnect db = new DbConnect();

	public List<RecipeDto> getList() {
		String sql = "select * from recipe";

		List<RecipeDto> list = new Vector<RecipeDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		
	}
}
