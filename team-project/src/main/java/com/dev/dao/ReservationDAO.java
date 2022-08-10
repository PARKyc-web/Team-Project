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
import com.dev.vo.ReviewVO;

public class ReservationDAO extends DAO {

	// 숙박리스트 출력 : yj

	public List<ReservationJoinHotelVO> getReservationList(String memberId) {
		String sql = "SELECT rn.reserv_id, h.hotel_id, h.hotel_name, rn.member_id, TO_CHAR(in_date, 'yyyy-MM-dd') in_date, "
			       + "TO_CHAR(out_date, 'yyyy-MM-dd') out_date, total_price, is_reserv "
			       + "FROM hotel h FULL OUTER JOIN reservation rn " 
			       + "ON (h.hotel_id = rn.hotel_id) "
			       + "WHERE rn.member_id = ? order by reserv_id desc ";
		
		List<ReservationJoinHotelVO> list = new ArrayList<>();
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
      
			while (rs.next()) {
				ReservationJoinHotelVO rhvo = new ReservationJoinHotelVO();
				// 출력값
				rhvo.setReservationId(rs.getInt("reserv_id"));
				rhvo.setHotelId(rs.getInt("hotel_id"));
				rhvo.setHotelName(rs.getString("hotel_name"));
				rhvo.setInDate(Date.valueOf(rs.getString("in_date")));
				rhvo.setOutDate(Date.valueOf(rs.getString("out_date")));
				rhvo.setTotalPrice(rs.getInt("total_price"));
				rhvo.setIsReserv(rs.getInt("is_reserv"));
				rhvo.setMemberId(rs.getString("member_id"));
				
				list.add(rhvo);
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
			System.out.println("invalidDateList: " + invalidDateList);
			return invalidDateList;
		}
		
		public int insertReservation(String memberId, int hotelId, String checkIn, String checkOut, int totalPrice) {
			String sql = "insert into reservation(reserv_id, member_id, hotel_id, in_date, out_date, total_price) values(hotel_seq.nextval, ?, ?, ?, ?, ?)";
			connect();
			
			int result = 0;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);
				pstmt.setInt(2, hotelId);
				pstmt.setString(3, checkIn);
				pstmt.setString(4, checkOut);
				pstmt.setInt(5, totalPrice);
				
				result = pstmt.executeUpdate();
				if(result > 0) {
					return result;
				}
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return result;
		}
		
		public void reviewdReservation(int reservationId) {
			
			try {
				connect();
				
				String sql = "UPDATE reservation "
						   + "SET is_reserv = 4 "
						   + "WHERE reserv_id = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, reservationId);
				
				int result = pstmt.executeUpdate();
						
				System.out.println(result + "건 리뷰를 작성하였습니다");
				
			}catch(SQLException e) {
				e.printStackTrace();
				
			}finally {
				disconnect();
			}
		}

		public ReviewVO searchReview(ReviewVO vo) {
			String str = "select * from review where hotel_id = ? and member_id = ? and review_date LIKE ?";
			connect();
			try {
				pstmt = conn.prepareStatement(str);
				pstmt.setInt(1, vo.getHotelId());
				pstmt.setString(2, vo.getMemberId());
				pstmt.setDate(3, vo.getReviewDate());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					ReviewVO rvo = new ReviewVO();
					rvo.setHotelId(rs.getInt("hotel_id"));
					rvo.setMemberId(rs.getString("member_id"));
					rvo.setReviewDate(rs.getDate("review_date"));
					rvo.setReviewId(rs.getInt("review_id"));
					return rvo;
				}
				
			} catch (SQLException e) {

				e.printStackTrace();
			}finally {
				disconnect();
			}
			return null;

		}
}
