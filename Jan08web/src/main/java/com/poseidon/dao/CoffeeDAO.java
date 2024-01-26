package com.poseidon.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.connector.Response;

import com.poseidon.db.DBConnection;
import com.poseidon.dto.BoardDTO;
import com.poseidon.dto.CoffeeDTO;
import com.poseidon.dto.CommentDTO;
import com.poseidon.util.Util;

public class CoffeeDAO extends AbstractDAO {

	public int coffeeSelect(CoffeeDTO dto) {
		
		Connection con = DBConnection.getInstance().getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO menu (menu) VALUES (?)";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMenu());
			result = pstmt.executeUpdate();
			if(result == 1) {
				System.out.println("성공적으로 투표 되었습니다.");
			}else {
				System.out.println("선택 에러");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, con);
		}
		
		return result;
	}

	public List<CoffeeDTO> coffeeShow() {
		List<CoffeeDTO> list = new ArrayList<CoffeeDTO>();
		// db정보
		DBConnection db = DBConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM menu";
		con = db.getConnection();
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CoffeeDTO dto = new CoffeeDTO();
				dto.setId(rs.getInt(1));
				dto.setMenu(rs.getString(2));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs, pstmt, con);
		}
		
		return list;
	}
	
}