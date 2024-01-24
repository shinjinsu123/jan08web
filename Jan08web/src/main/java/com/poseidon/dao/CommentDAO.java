package com.poseidon.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.poseidon.dto.CommentDTO;

public class CommentDAO extends AbstractDAO {

	public int commentWrite(CommentDTO dto) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "INSERT INTO comment (ccomment, board_no, mno, cip) "
				+ "VALUES (?, ?, (SELECT mno FROM member WHERE mid=?), ?)";
		// db에서 확인해보니 cip값이 null로 나와서, 이 값도 넣어줘야 한다.
		// 그래서 cip를 추가해주고 ?도 추가해준다.
		
		try {
			pstmt = con.prepareStatement(sql);    
			pstmt.setString(1, dto.getComment()); // Comment.java 서블릿과 동일
			pstmt.setInt(2, dto.getBoard_no());   // Comment.java 서블릿과 동일
			pstmt.setString(3, dto.getMid());     // Comment.java 서블릿과 동일
			pstmt.setString(4, dto.getIp());	// dto에 넣은 setip를 통해 get한 ip를 sql문 4번에 넣는다.
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, con);
		}
		return result;
	}

	public int commentDelete(CommentDTO dto) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE comment SET cdel=0 "
				+ "WHERE cno=? AND mno=(SELECT mno FROM member WHERE mid=?)";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getCno());
			pstmt.setString(2, dto.getMid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}		
		return result;
	}

}
