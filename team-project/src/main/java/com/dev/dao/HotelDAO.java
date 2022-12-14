package com.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dev.common.DAO;
import com.dev.controller.MyPageModiController;
import com.dev.vo.Criteria;
import com.dev.vo.HotelPicVO;
import com.dev.vo.HotelVO;

public class HotelDAO extends DAO{	
	
	
	public void disabledHotel(String memberId) {
		
		try {
			connect();
			
			String sql = "UPDATE hotel "
					   + "SET hotel_able = 1 "
					   + "WHERE member_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			int result = pstmt.executeUpdate();
								
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			disconnect();
		}		
	}
	
	
	public void addHotelPic(HotelPicVO pvo) {
		try {
			connect();
			
			String sql= "INSERT INTO hotel_pic "
					  + "VALUES(?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pvo.getHotelId());
			pstmt.setString(2, pvo.getPath());
			pstmt.setString(3, pvo.getName());
			
			int result = pstmt.executeUpdate();
			System.out.println(result + "건 숙소사진이 삽입되었습니다.");
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			disconnect();
		}
	}
	
	
	public void updateHotel(HotelVO hvo) {		
		try {
			connect();
			
			String sql = "UPDATE hotel "
					   + "SET  hotel_name =?, hotel_location =?, hotel_price =?, hotel_type =?, "
					   + "hotel_desc =?, max_p =?, hotel_option_wifi =?, hotel_option_swim =?, hotel_option_wpet =?, "
					   + "hotel_option_kitchen =?, hotel_option_parking =? "
					   + "WHERE hotel_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, hvo.getHotelName());
			pstmt.setString(2, hvo.getHotelLocation());
			pstmt.setInt(3, hvo.getHotelPrice());
			pstmt.setString(4, hvo.getHotelType());
			pstmt.setString(5, hvo.getHotelDesc());
			
			pstmt.setInt(6,  hvo.getMaxP());
			
			pstmt.setInt(7, hvo.getHotelOptionWifi());
			pstmt.setInt(8, hvo.getHotelOptionSwim());
			pstmt.setInt(9, hvo.getHotelOptionWpet());
			pstmt.setInt(10, hvo.getHotelOptionKitchen());
			pstmt.setInt(11, hvo.getHotelOptionParking());	
			
			pstmt.setInt(12, hvo.getHotelId());
			
			int result = pstmt.executeUpdate();
			System.out.println(result + "건 숙소정보가 수정되었습니다.");
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			disconnect();
		}		
	}
	
	public int getTotalOwnHotelCount(String memberId) {		
		int result = 0;
		try {
			connect();
			String sql = "SELECT count(*) "
					   + "FROM hotel "
					   + "WHERE member_id = ? AND hotel_able = 0";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("count(*)");
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			disconnect();
		}
		
		return result;
	}
	
	public List<HotelVO> getOwnHotel(String memberId, Criteria cri) {		
		List<HotelVO> list = new ArrayList<>();		
		try {
			connect();			
			String sql = "SELECT * "
					   + "FROM (SELECT rownum rn, hotel_id, member_id, hotel_name, hotel_location, hotel_price, "
					   + 	   "hotel_type, hotel_desc, max_p, hotel_option_wifi, hotel_option_swim, hotel_option_wpet, "
					   + 	   "hotel_option_kitchen, hotel_option_parking, hotel_able "
					   + 	   "FROM hotel "
					   +	   "WHERE member_id = ? AND rownum <= ? AND hotel_able = 0) "
					   + "WHERE rn > ? "
					   + "ORDER BY hotel_id";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, cri.getAmount()*cri.getPageNum());
			pstmt.setInt(3, cri.getAmount()*(cri.getPageNum()-1));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HotelVO vo = new HotelVO();
				
				vo.setHotelId(rs.getInt("hotel_id"));
				vo.setMemberId(rs.getString("member_id"));
				vo.setHotelName(rs.getString("hotel_name"));
				vo.setHotelLocation(rs.getString("hotel_location"));
				vo.setHotelPrice(rs.getInt("hotel_price"));
				vo.setHotelType(rs.getString("hotel_type"));
				vo.setHotelDesc(rs.getString("hotel_desc"));
				
				vo.setMaxP(rs.getInt("max_p"));
				
				vo.setHotelOptionWifi(rs.getInt("hotel_option_wifi"));
				vo.setHotelOptionSwim(rs.getInt("hotel_option_swim"));
				vo.setHotelOptionWpet(rs.getInt("hotel_option_wpet"));
				vo.setHotelOptionKitchen(rs.getInt("hotel_option_kitchen"));
				vo.setHotelOptionParking(rs.getInt("hotel_option_parking"));		
				
				list.add(vo);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			disconnect();
		}
		
		return list;
	}
	
	
	
	public int sequenceCurval() {		
		int result = 0;		
		try {
			connect();

			
			String sql = "SELECT hotel_seq.nextval FROM dual";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			sql = "SELECT hotel_seq.currval seq "
					   + "FROM DUAL";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
					
			if(rs.next()) {
				result = rs.getInt("seq");
			}
						
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			disconnect();
		}
		
		return result;
	}
	
	public int insertNewHotel(HotelVO vo) {
		
		int result = 0;
		
		try {
			connect();
			
			String sql = "INSERT INTO hotel "
					   + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getHotelId());
			pstmt.setString(2, vo.getMemberId());
			pstmt.setString(3, vo.getHotelName());
			pstmt.setString(4, vo.getHotelLocation());
			pstmt.setInt(5, vo.getHotelPrice());
			pstmt.setString(6, vo.getHotelType());
			pstmt.setString(7, vo.getHotelDesc());
			
			pstmt.setInt(8,  vo.getMaxP());
			
			pstmt.setInt(9, vo.getHotelOptionWifi());
			pstmt.setInt(10,  vo.getHotelOptionSwim());
			pstmt.setInt(11, vo.getHotelOptionWpet());
			pstmt.setInt(12, vo.getHotelOptionKitchen());
			pstmt.setInt(13, vo.getHotelOptionParking());			
			
			result = pstmt.executeUpdate();	
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			disconnect();
		}
		
		return result;
	}
	
	
	public HotelVO getHotelInfo(long hotelId) {		
		HotelVO vo = null;
		connect();		
		try {
			String sql = "SELECT * FROM hotel where hotel_id = ? AND hotel_able=0";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, hotelId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {			
				vo = new HotelVO();
				
				vo.setHotelId(rs.getInt("hotel_id"));
				vo.setMemberId(rs.getString("member_id"));
				vo.setHotelName(rs.getString("hotel_name"));
				vo.setHotelLocation(rs.getString("hotel_location"));
				vo.setHotelPrice(rs.getInt("hotel_price"));
				vo.setHotelType(rs.getString("hotel_type"));
				vo.setHotelDesc(rs.getString("hotel_desc"));
				
				vo.setMaxP(rs.getInt("max_p"));
				
				vo.setHotelOptionWifi(rs.getInt("hotel_option_wifi"));
				vo.setHotelOptionSwim(rs.getInt("hotel_option_swim"));
				vo.setHotelOptionWpet(rs.getInt("hotel_option_wpet"));
				vo.setHotelOptionKitchen(rs.getInt("hotel_option_kitchen"));
				vo.setHotelOptionParking(rs.getInt("hotel_option_parking"));				
			}			
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			disconnect();
		}		
		
		return vo;
	}
	
	public int getHotelTableSize() {		
		int result = 0;		
		connect();
		try {
			
			String sql = "SELECT count(*) FROM hotel WHERE hotel_able=0";
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("count(*)");
			}
			
		}catch(SQLException e){
			e.printStackTrace();
			
		}finally {
			disconnect();
		}
		
		return result;
	}
	
	public List<HotelVO> getSearchHotelInfo(String keyword, Criteria cri){		
		
		List<HotelVO> list = new ArrayList<>();		
		connect();
		try {
			String sql = "SELECT * "
					+ " FROM (SELECT rownum rn, hotel_id, member_id, hotel_name, hotel_location, hotel_price, hotel_type, hotel_desc, "
					+ " max_p, hotel_option_wifi, hotel_option_swim, hotel_option_wpet, hotel_option_kitchen, "
					+ " hotel_option_parking, hotel_able "
					+ " FROM hotel "
					+ " WHERE (hotel_location LIKE '%"+ keyword + "%' OR hotel_name LIKE '%" + keyword + "%'"
					+ " OR hotel_type LIKE '%" + keyword + "%') AND rownum <= ? AND hotel_able = 0) "
					+ "WHERE rn > ? "
					+ "ORDER BY hotel_id";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cri.getAmount()*cri.getPageNum());
			pstmt.setInt(2, cri.getAmount()*(cri.getPageNum()-1));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {				
				HotelVO vo = new HotelVO();				
				
				vo.setHotelId(rs.getInt("hotel_id"));
				vo.setMemberId(rs.getString("member_id"));
				vo.setHotelName(rs.getString("hotel_name"));
				vo.setHotelLocation(rs.getString("hotel_location"));
				vo.setHotelPrice(rs.getInt("hotel_price"));
				vo.setHotelType(rs.getString("hotel_type"));
				vo.setHotelDesc(rs.getString("hotel_desc"));
				
				vo.setMaxP(rs.getInt("max_p"));
				
				vo.setHotelOptionWifi(rs.getInt("hotel_option_wifi"));
				vo.setHotelOptionSwim(rs.getInt("hotel_option_swim"));
				vo.setHotelOptionWpet(rs.getInt("hotel_option_wpet"));
				vo.setHotelOptionKitchen(rs.getInt("hotel_option_kitchen"));
				vo.setHotelOptionParking(rs.getInt("hotel_option_parking"));
				
				list.add(vo);
			}			
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			disconnect();
		}
		
		return list;		
	}
	
	public int getSearchHotelCount(String keyword) {		
		connect();
		try {
			String sql = "SELECT count(*) "
					+ " FROM (SELECT rownum rn, hotel_id, member_id, hotel_name, hotel_location, hotel_price, hotel_type, hotel_desc, "
					+ " max_p, hotel_option_wifi, hotel_option_swim, hotel_option_wpet, hotel_option_kitchen, "
					+ " hotel_option_parking, hotel_able "
					+ " FROM hotel "
					+ " WHERE (hotel_location LIKE '%"+ keyword + "%' OR hotel_name LIKE '%" + keyword + "%'"
					+ " OR hotel_type LIKE '%" + keyword + "%') AND hotel_able = 0) "
					+ "ORDER BY hotel_id";
			
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("count(*)");
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			disconnect();
		}
		
		return 0;
	}
	
	public String getHostName(int hotelId) {
		String hostName = "";
		
		String sql = "select member_name from member_info NATURAL JOIN hotel where hotel_id = ?";
		connect();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hotelId);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				hostName = rs.getString("member_name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return hostName;
	}
	
	
	
	
}
