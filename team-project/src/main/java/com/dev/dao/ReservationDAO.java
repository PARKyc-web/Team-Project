package com.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dev.common.DAO;
import com.dev.vo.ReservationJoinHotelVO;

public class ReservationDAO extends DAO{
	
	// 숙박리스트 출력 : yj
		public List<ReservationJoinHotelVO> getReservationList(ReservationJoinHotelVO vo) {
			System.out.println(vo);
			String sql = "select * from hotel h FULL OUTER JOIN reservation rn "
					+ "ON (h.hotel_id = rn.hotel_id) where h.member_id = ? ";
			List<ReservationJoinHotelVO> list = new ArrayList<>();
			connect();
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getMemberId());
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					System.out.println("rs.next RUN!!");
					ReservationJoinHotelVO rhvo = new ReservationJoinHotelVO();
					//출력값
					rhvo.setHotelName(rs.getString("hotel_name"));
					rhvo.setInDate(rs.getDate("in_date"));
					rhvo.setOutDate(rs.getDate("out_date"));
					rhvo.setTotalPrice(rs.getInt("total_price"));
					rhvo.setMemberId(rs.getString("member_id"));
					
					list.add(rhvo);
					
					System.out.println(rhvo.getHotelName());
					System.out.println(rhvo.getMemberId());
					System.out.println(rhvo.getTotalPrice());
					
					System.out.println("LIST ADDED!!");
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			
			return list;

		}
}
