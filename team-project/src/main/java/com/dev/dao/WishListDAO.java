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
					+ "WHERE h.member_id = ? ";
		List<WishListJoinHotelVO> list = new ArrayList<>();
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				WishListJoinHotelVO whvo = new WishListJoinHotelVO();
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
}
