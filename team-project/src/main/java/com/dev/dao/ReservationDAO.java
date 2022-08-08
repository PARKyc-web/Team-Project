package com.dev.dao;

import java.util.Calendar;

import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.dev.common.DAO;
import com.dev.vo.ReservationJoinHotelVO;
import com.dev.vo.ReservationVO;

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
		

		// 특정 호텔의 예약된 날짜를 반환하는 함수입니다.
		public List<Date> invalidDate(int hotelId) {
			List<Date> invalidDateList = new ArrayList<Date>();
			Date startDate;
			int day = 0;
			
			String sql = "select in_date, (TRUNC(out_date) - TRUNC(in_date))AS day from reservation where hotel_id=?";
			connect();
			
			List<ReservationVO> dateList = new ArrayList<>();
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, hotelId);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					startDate = rs.getDate("in_date");
					day = rs.getInt("day");
					
					Calendar cal = Calendar.getInstance();
					cal.setTime(startDate);
					for(int i=0; i<day; i++) {
						DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
						invalidDateList.add(Date.valueOf(df.format(cal.getTime())));

						cal.add(Calendar.DATE, 1);
					}
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			System.out.println(invalidDateList);
			return invalidDateList;
		}
		
		public void insertReservation(String memberId, int hotelId, String checkIn, String checkOut, int totalPrice) {
			String sql = "insert into reservation(reserv_id, member_id, hotel_id, in_date, out_date, total_price) values(hotel_seq.nextval, ?, ?, ?, ?, ?)";
			connect();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);
				pstmt.setInt(2, hotelId);
				pstmt.setString(3, checkIn);
				pstmt.setString(4, checkOut);
				pstmt.setInt(5, totalPrice);
				
				int result = pstmt.executeUpdate();
				if(result > 0) {
					System.out.println("예약이 정상적으로 등록되었습니다.");
				}
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
		}
}
