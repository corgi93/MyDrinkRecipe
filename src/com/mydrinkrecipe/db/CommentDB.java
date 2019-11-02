package com.mydrinkrecipe.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import com.mydrinkrecipe.dbconnect.DbConnect;
import com.mydrinkrecipe.dto.CommentDto;

public class CommentDB {
	DbConnect db = new DbConnect();
	
	//댓글추가
	public void insertComment(CommentDto dto) {
		
		String sql="insert into r_comment values (seq_comment.nextval,?,?,sysdate)";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getConnection();
		//바인딩
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getRecipe_bno());
			pstmt.setString(2, dto.getContent());
			//sql실헹
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	//댓글목록반환
	public List<CommentDto> getCommentList(int recipe_bno,int bno)
	{
		List<CommentDto>list=new Vector<CommentDto>();
		String sql="select*from comment where recipe_bno=? & bno=? order by bno desc";
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setInt(1, recipe_bno);
			pstmt.setInt(2, bno);
			//실행
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				CommentDto dto=new CommentDto();
				dto.setBno(rs.getInt("bno"));
				dto.setRecipe_bno(rs.getInt("recipe_bno"));
				dto.setContent(rs.getString("content"));
				dto.setWriteday(rs.getTimestamp("writeday"));

				//리스트 추가
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
}
