package com.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dev.common.DAO;
import com.dev.vo.ReservationJoinHotelVO;

public class ReservationDAO extends DAO{
	
	// 숙박리스트 출력 : yj
		public List<ReservationJoinHotelVO> getReservationList(String memberId) {
			String sql = "select * from hotel h FULL OUTER JOIN reservation rn "
					+ "ON (h.hotel_id = rn.hotel_id) where h.member_id = ? ";
			List<ReservationJoinHotelVO> list = new ArrayList<>();
			connect();
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);
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
		
		//hotelId -> hotelName 불러오기 : yj
//			public HotelVO getHotelListMyPage(int hotelId){
//				String sql = "select * from hotel where hotel_id = ? ";
//				HotelVO hvo = new HotelVO();
//				connect();
//				try {
//					pstmt = conn.prepareStatement(sql);
//					pstmt.setInt(1, hotelId);
//					rs = pstmt.executeQuery();
//					
//					if(rs.next()) {
//						hvo.setHotelId(rs.getInt("hotel_id"));
//						hvo.setMemberId(rs.getString("member_id"));
//						hvo.setHotelName(rs.getString("hotelName"));
//						hvo.setHotelLocation(rs.getString("hotel_location"));
//						hvo.setHotelPrice(rs.getInt("hotel_price"));
//						hvo.setHotelType(rs.getString("hotel_type"));
//						hvo.setHotelDesc(rs.getString("hotel_desc"));
//						
//						hvo.setMaxP(rs.getInt("max_p"));
//						
//						hvo.setHotelOptionWifi(rs.getInt("hotel_option_wifi"));
//						hvo.setHotelOptionSwim(rs.getInt("hotel_option_swim"));
//						hvo.setHotelOptionWpet(rs.getInt("hotel_option_wpet"));
//						hvo.setHotelOptionKitchen(rs.getInt("hotel_option_kitchen"));
//						hvo.setHotelOptionParking(rs.getInt("hotel_option_parking"));
//					
//						return hvo;
//					}
//				}catch(SQLException e) {
//					e.printStackTrace();
//				}finally {
//					disconnect();
//				}
//				return hvo;
//			}
	
	
	//예약취소 : yj
	
}
