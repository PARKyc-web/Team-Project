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
	public List<WishListJoinHotelVO> getWishList(WishListJoinHotelVO vo) {
		String sql = "select * from hotel h FULL OUTER JOIN wish_list w ON (h.hotel_id = w.hotel_id) "
					+ "WHERE h.member_id = ? ";
		List<WishListJoinHotelVO> list = new ArrayList<>();
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMemberId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				WishListJoinHotelVO jwhvo = new WishListJoinHotelVO();
				jwhvo.setHotelName(rs.getString("hotelNmae"));
				jwhvo.setMemberId(rs.getString("memberId"));
				jwhvo.setOnOff(rs.getInt("onOff"));
				

				list.add(jwhvo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
}
