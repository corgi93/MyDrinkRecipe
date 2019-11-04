package com.mydrinkrecipe.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import com.mydrinkrecipe.dbconnect.DbConnect;
import com.mydrinkrecipe.dto.RecipeDto;
import com.mydrinkrecipe.dto.RecipeMemberDto;

public class RecipeDB {
   DbConnect db = new DbConnect();

   // 레시피 등록
   public void insertRecipe(RecipeDto dto) {
      String sql = "insert into recipe values(seq_recipe.nextval,?,?,?,?,?,?,?,?,?)";

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
         ps.setString(9, dto.getWriter());

         ps.execute();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         db.dbClose(ps, conn);
      }
   }

   // 전체데이터를 list에 담아 리턴하는 메소드
   public List<RecipeDto> getAllDatas() {
      List<RecipeDto> list = new Vector<RecipeDto>();
      String sql = "select * from recipe order by recipe_bno desc";
      Connection conn = db.getConnection();
      PreparedStatement ps = null;
      ResultSet rs = null;

      conn = db.getConnection();
      try {
         ps = conn.prepareStatement(sql);
         rs = ps.executeQuery();
         while (rs.next()) {
            RecipeDto dto = new RecipeDto();
            dto.setRecipe_bno(rs.getString("recipe_bno"));
            dto.setTitle(rs.getString("title"));
            dto.setContent(rs.getString("content"));
            dto.setIngredient(rs.getString("ingredient"));
            dto.setTime(rs.getString("time"));
            dto.setPrice(rs.getString("price"));
            dto.setLikecount(rs.getInt("likecount"));
            dto.setKcal(rs.getString("kcal"));
            dto.setImg(rs.getString("img"));

            list.add(dto);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         db.dbClose(rs, ps, conn);
      }
      return list;
   }

   public List<RecipeDto> getList() {
      String sql = "select * from recipe order by recipe_bno asc";
      Connection conn = db.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<RecipeDto> list = new Vector<RecipeDto>();

      try {
         pstmt = conn.prepareStatement(sql);

         // 실행
         rs = pstmt.executeQuery();

         while (rs.next()) {
            RecipeDto dto = new RecipeDto();

            dto.setRecipe_bno(rs.getString("recipe_bno"));
            dto.setTitle(rs.getString("title"));
            dto.setContent(rs.getString("content"));
            dto.setIngredient(rs.getString("ingredient"));
            dto.setTime(rs.getString("time"));
            dto.setPrice(rs.getString("price"));
            dto.setLikecount(rs.getInt("likecount"));
            dto.setKcal(rs.getString("kcal"));
            dto.setImg(rs.getString("img"));

            // 리스트 추가
            list.add(dto);
         }

      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         db.dbClose(rs, pstmt, conn);
      }
      return list;
   }

   public List<RecipeMemberDto> getCardList() {
      List<RecipeMemberDto> list = new Vector<RecipeMemberDto>();

      String sql = "select r.recipe_bno , r.title, r.time, r.img, r.writer, r.likecount, m.user_img , m.nickname from recipe r, member m where m.nickname = r.writer";
      Connection conn = db.getConnection();
      PreparedStatement ps = null;
      ResultSet rs = null;

      try {
         ps = conn.prepareStatement(sql);

         rs = ps.executeQuery();
         while (rs.next()) {
            RecipeMemberDto dto = new RecipeMemberDto();

            dto.setRecipe_bno(rs.getString("recipe_bno"));
            dto.setTitle(rs.getString("title"));
            dto.setTime(rs.getString("time"));
            dto.setImg(rs.getString("img"));
            dto.setWriter(rs.getString("writer"));
            dto.setLikecount(rs.getInt("likecount"));
            dto.setUser_img(rs.getString("user_img"));
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

   public RecipeMemberDto getDetail(String recipe_bno) {
      RecipeMemberDto dto = new RecipeMemberDto();

      String sql = "SELECT r.recipe_bno , r.title, r.time, r.img, r.writer, r.likecount, r.price, r.kcal, r.ingredient, r.content, m.user_img , m.nickname FROM recipe r, member m WHERE m.nickname = r.writer AND recipe_bno=?";

      Connection conn = db.getConnection();
      PreparedStatement ps = null;
      ResultSet rs = null;

      try {
         ps = conn.prepareStatement(sql);
         ps.setString(1, recipe_bno);

         rs = ps.executeQuery();
         if (rs.next()) {
            // recipe setter
            dto.setRecipe_bno(rs.getString("recipe_bno"));
            dto.setTitle(rs.getString("title"));
            dto.setTime(rs.getString("time"));
            dto.setImg(rs.getString("img"));
            dto.setWriter(rs.getString("writer"));
            dto.setLikecount(rs.getInt("likecount"));
            dto.setPrice(rs.getString("price"));
            dto.setKcal(rs.getString("kcal"));
            dto.setIngredient(rs.getString("ingredient"));
            dto.setContent(rs.getString("content"));
            dto.setLikecount(rs.getInt("likecount"));
            
            // member setter
            dto.setUser_img(rs.getString("user_img"));
            dto.setNickname(rs.getString("nickname"));
         }

      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         db.dbClose(rs, ps, conn);
      }

      return dto;

   }
}