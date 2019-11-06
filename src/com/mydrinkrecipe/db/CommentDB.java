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

	// 댓글추가
	public void insertComment(CommentDto dto) {

		String sql = "insert into r_comment values (seq_comment.nextval,?,?,?,?,sysdate)";

		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = db.getConnection();
		// 바인딩
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getRecipe_bno());
			pstmt.setString(2, dto.getNickname());
			pstmt.setString(3, dto.getMemberimg());
			pstmt.setString(4, dto.getContent());

			// sql실헹
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// 댓글목록반환
	public List<CommentDto> getCommentList(String recipe_bno) {
		List<CommentDto> list = new Vector<CommentDto>();
		String sql = "select * from r_comment where recipe_bno=? order by writeday desc";
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setString(1, recipe_bno);

			// 실행
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentDto dto = new CommentDto();
				dto.setComment_bno(rs.getString("comment_bno"));
				dto.setRecipe_bno(rs.getString("recipe_bno"));
				dto.setNickname(rs.getString("nickname"));
				dto.setMemberimg(rs.getString("memberimg"));
				dto.setContent(rs.getString("content"));
				dto.setWriteday(rs.getTimestamp("writeday"));

				// 리스트 추가
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	//댓글삭제
		public void deleteComment(String comment_bno)
		{
			String sql="delete from r_comment where comment_bno=?";

			Connection conn=null;
			PreparedStatement pstmt=null;
			conn=db.getConnection();
			try {
				pstmt=conn.prepareStatement(sql);
				//바인딩
				pstmt.setString(1, comment_bno);

				//실행
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//비번 체크
		public boolean isEqualPass(String comment_bno,String pass)
		{
			System.out.println(comment_bno);
			System.out.println(pass);
			boolean find=false;
			String sql="select * from r_comment where comment_bno=? and pass=?";

			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;

			conn=db.getConnection();
			try {
				pstmt=conn.prepareStatement(sql);
				//바인딩
				pstmt.setString(1, comment_bno);
				pstmt.setString(2, pass);
				//실행
				rs=pstmt.executeQuery();
				if(rs.next())
				{
					find=true;
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			return find;
		}
		
		//페이지별로 리스트 가져오기
		public List<CommentDto> getList(int start,int end)
		{
			String sql="select a.* from (select ROWNUM as RNUM,b.* from " + 
					"(select * from guest order by num desc)b)a " + 
					"where a.RNUM>=? and a.RNUM<=?";
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<CommentDto> list=new Vector<CommentDto>();
			try {
				pstmt=conn.prepareStatement(sql);
				//바인딩
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				//실행
				rs=pstmt.executeQuery();
				
				while(rs.next())
				{
					CommentDto dto=new CommentDto();
					dto.setComment_bno(rs.getString("Comment_bno"));
					dto.setRecipe_bno(rs.getString("Recipe_bno"));
					dto.setMemberimg(rs.getString("Memberimg"));
					dto.setNickname(rs.getString("nickname"));
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
		
		//전체 갯수 구하는 메서드
		public int getTotalCount()
		{
			String sql="select count(*) from r_comment";
			int n=0;
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next())
					n=rs.getInt(1);//1번열
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return n;
			
		}



}