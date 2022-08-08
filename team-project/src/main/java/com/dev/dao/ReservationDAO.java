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

public class ReservationDAO extends DAO {

	// 숙박리스트 출력 : yj
	public List<ReservationJoinHotelVO> getReservationList(String memberId) {
		String sql = "select * from hotel h FULL OUTER JOIN reservation rn "
				+ "ON (h.hotel_id = rn.hotel_id) where rn.member_id = ? order by in_date desc";
		List<ReservationJoinHotelVO> list = new ArrayList<>();
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				System.out.println("rs.next RUN!!");
				ReservationJoinHotelVO rhvo = new ReservationJoinHotelVO();
				// 출력값
				rhvo.setHotelName(rs.getString("hotel_name"));
				rhvo.setHotelId(rs.getInt("hotel_id"));
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

//	// 숙박리스트 출력 -1.호텔이름가져오기 : yj
//	public List<ReservationJoinHotelVO> getHotelName(String memberId) {
//		String sql = "select * from hotel where member_id = ? ";
//		List<ReservationJoinHotelVO> list = new ArrayList<>();
//		connect();
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, memberId);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//
//				ReservationJoinHotelVO vo = new ReservationJoinHotelVO();
//				// 출력값
//				vo.setHotelName(rs.getString("hotel_name"));
//
//				list.add(vo);
//			}
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			disconnect();
//		}
//
//		return list;
//
//	}
//
//	// 숙박리스트 출력 -2.예약내가져오기: yj
//	public List<ReservationJoinHotelVO> getReserList(String memberId) {
//		String sql = "select * from reservation where member_id = ? ";
//		List<ReservationJoinHotelVO> list = new ArrayList<>();
//		connect();
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, memberId);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				ReservationJoinHotelVO vo = new ReservationJoinHotelVO();
//				// 출력값
//				vo.setInDate(rs.getDate("in_date"));
//				vo.setOutDate(rs.getDate("out_date"));
//				vo.setTotalPrice(rs.getInt("total_price"));
//				vo.setMemberId(rs.getString("member_id"));
//
//				list.add(vo);
//
//			}
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			disconnect();
//		}
//
//		return list;
//	}

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

			while (rs.next()) {
				startDate = rs.getDate("in_date");
				day = rs.getInt("day");

				invalidDateList.add(startDate);
				Calendar cal = Calendar.getInstance();
				cal.setTime(startDate);
				for (int i = 0; i < day; i++) {
					cal.add(Calendar.DATE, 1);

					DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					invalidDateList.add(Date.valueOf(df.format(cal.getTime())));
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return invalidDateList;
	}
}
