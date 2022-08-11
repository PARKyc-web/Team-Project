package com.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dev.common.DAO;
import com.dev.vo.HotelVO;
import com.dev.vo.WishListJoinHotelVO;
import com.dev.vo.WishListVO;

public class WishListDAO extends DAO{

	// 나의 숙박위시리스트 : yj
	public List<WishListJoinHotelVO> getWishList(String memberId) {
		String sql = "select * from hotel h FULL OUTER JOIN wish_list w ON (h.hotel_id = w.hotel_id) "
					+ "WHERE w.member_id = ? AND w.onOff = 0";
		List<WishListJoinHotelVO> list = new ArrayList<>();
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				WishListJoinHotelVO whvo = new WishListJoinHotelVO();
				whvo.setHotelId(rs.getInt("hotel_id"));
				whvo.setHotelName(rs.getString("hotel_name"));
				whvo.setMemberId(rs.getString("member_id"));
				whvo.setOnOff(rs.getInt("onOff"));

				list.add(whvo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	// 호텔 상세 페이지 내 위시리스트(하트)의 상태를 나타내는 함수입니다.
	public int heartColor(String memberId, int hotelId) {
		String sql = "select onOff from wish_list where member_id = ? and hotel_id = ?";
		connect();
		
		int result = -1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, hotelId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("onOff");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return result;
	}
	
	public void insertWishList(String memberId, int hotelId) {
		String sql = "insert into wish_list values(?, ?, 0)";
		connect();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, hotelId);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("INSERT wishList");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	public int changeOnOff(String memberId, int hotelId, int onOff) {
		String sql = "update wish_list set onOff=? where member_id=? and hotel_id=?";
		connect();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, onOff);
			pstmt.setString(2, memberId);
			pstmt.setInt(3, hotelId);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			disconnect();
		}
		System.out.println(onOff);
		return onOff;
	}
}
