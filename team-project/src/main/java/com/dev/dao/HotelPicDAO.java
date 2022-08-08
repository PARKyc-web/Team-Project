package com.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dev.common.DAO;
import com.dev.vo.HotelPicVO;
import com.dev.vo.HotelVO;

public class HotelPicDAO extends DAO{

	
	public int insertNewHotelPic(HotelPicVO pvo) {
		
		int result =0;
		try {
			connect();
			
			String sql = "INSERT INTO hotel_pic "
					   + "VALUES(?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, pvo.getHotelId());
			pstmt.setString(2, pvo.getPath());
			pstmt.setString(3, pvo.getName());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			disconnect();
		}
		
		return result;
	}
	
	
	public HotelPicVO getHotelPicPath(HotelVO hotelInfo){		
		HotelPicVO vo = new HotelPicVO();		
		connect();
		try {
			String sql = "SELECT * FROM hotel_pic WHERE hotel_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hotelInfo.getHotelId());			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setHotelId(hotelInfo.getHotelId());
				vo.setName(rs.getString("name"));
				vo.setPath(rs.getString("path"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			disconnect();
		}
		
		return vo;		
	}
	
	public List<HotelPicVO> getAllHotelPicPath(int hotelId){		
		List<HotelPicVO> list = new ArrayList<>();
		connect();
		try {
			String sql = "SELECT * FROM hotel_pic WHERE hotel_id = ? ORDER BY name";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hotelId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {				
				HotelPicVO vo = new HotelPicVO();
				
				vo.setHotelId(rs.getInt("hotel_id"));
				vo.setPath(rs.getString("path"));
				vo.setName(rs.getString("name"));
				
				list.add(vo);
			}			
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			disconnect();
		}
		
		return list;
	}
	
}
