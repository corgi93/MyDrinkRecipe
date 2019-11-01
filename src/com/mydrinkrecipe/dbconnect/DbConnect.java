package com.mydrinkrecipe.dbconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "mdr";
	String pass = "a1234";

	public DbConnect() {
		try {
			Class.forName(driver);
			// System.out.println("오라클 드라이버 성공!");

		} catch (ClassNotFoundException e) {
			System.out.println("오라클 드라이버 실패:" + e.getMessage());
		}
	}

	public Connection getConnection() {
		// db server 에 연결 시도
		Connection conn = null;
		try {
			conn = (Connection) DriverManager.getConnection(url, user, pass);
			//System.out.println("오라클 연결 성공");
		} catch (SQLException e) {
			System.out.println("오라클 연결 실패:" + e.getMessage());
		}
		return conn;
	}

	public void dbClose(PreparedStatement ps, Connection conn) {
		try {
			ps.close();
			conn.close();
		} catch (SQLException e) {
		}
	}

	public void dbClose(ResultSet rs, PreparedStatement ps, Connection conn) {
		try {
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
		}
	}

	public void dbClose(Statement stmt, Connection conn) {
		try {
			stmt.close();
			conn.close();
		} catch (SQLException e) {
		}
	}

	public void dbClose(ResultSet rs, Statement stmt, Connection conn) {
		try {
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
		}
	}

}
