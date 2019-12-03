package com.mydrinkrecipe.dbconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "mdr";
	String pass = "5118586";

	public DbConnect() {
		try {
			Class.forName(driver);

		} catch (ClassNotFoundException e) {
			System.out.println("�삤�씪�겢 �뱶�씪�씠踰� �떎�뙣:" + e.getMessage());
		}
	}

	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = (Connection) DriverManager.getConnection(url, user, pass);
			//System.out.println("�삤�씪�겢 �뿰寃� �꽦怨�");
		} catch (SQLException e) {
			System.out.println("�삤�씪�겢 �뿰寃� �떎�뙣:" + e.getMessage());
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
