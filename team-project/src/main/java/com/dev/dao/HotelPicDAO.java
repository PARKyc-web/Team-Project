package com.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dev.common.DAO;
import com.dev.vo.HotelPicVO;
import com.dev.vo.HotelVO;

public class HotelPicDAO extends DAO{

	
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
	
}
