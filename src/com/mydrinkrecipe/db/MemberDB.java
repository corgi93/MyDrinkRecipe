package com.mydrinkrecipe.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mydrinkrecipe.dbconnect.DbConnect;
import com.mydrinkrecipe.dto.MemberDto;

public class MemberDB {
	DbConnect db = new DbConnect();

	public void registerMember(MemberDto dto) {
		String sql = "insert into member(nickname,id,pw,email,register) values(?,?,?,?,sysdate)";

		Connection conn = db.getConnection();
		PreparedStatement ps = null;

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getNickname());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPassword());
			ps.setString(4, dto.getEmail());

			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(ps, conn);
		}
	}

	public MemberDto getMyPageInfos(String id) {
		MemberDto dto = new MemberDto();
		String sql = "select * from member where id=?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setNickname(rs.getString("nickname"));
				dto.setUser_img(rs.getString("user_img"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}


	public void insertProfile(MemberDto dto) {
		String sql = "update member set user_img=?, introduce=? where id=?";

		Connection conn = null;
		PreparedStatement ps = null;
		conn = db.getConnection();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getUser_img());
			ps.setString(2, dto.getIntroduce());
			ps.setString(3, dto.getId());

			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(ps, conn);
		}
	}

	public MemberDto getLoginData(String id) {
		MemberDto dto = new MemberDto();
		String sql = "select id, pw from member where id=?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("pw"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}

	public boolean isExistingId(String id) {
		boolean find = false;
		String sql = "select * from member where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next())
				find = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return find;
	}

	public boolean isExistingNick(String nick) {
		boolean find = false;
		String sql = "select * from member where nickname=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nick);
			rs = pstmt.executeQuery();

			if (rs.next())
				find = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return find;
	}

	public boolean isLogin(String id, String pw) {
		boolean find = false;
		String sql = "select * from member where id=? and password=?";

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		conn = db.getConnection();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);

			if (rs.next()) {
				find = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, ps, conn);
		}
		return find;

	}
}
