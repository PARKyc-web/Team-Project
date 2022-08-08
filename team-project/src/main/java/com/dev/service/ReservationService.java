package com.dev.service;

import java.sql.Date;
import java.util.List;

import com.dev.dao.ReservationDAO;
import com.dev.vo.ReservationJoinHotelVO;

public class ReservationService {

	private static ReservationService instance = new ReservationService();
	ReservationDAO dao = new ReservationDAO();

	private ReservationService() {
	}

	public static ReservationService getInstance() {
		return instance;
	}

	// 나의 숙박내역
	public List<ReservationJoinHotelVO> ReservationList(String memberId) {
		return dao.getReservationList(memberId);
	}

	//예약내역
//	public List<ReservationJoinHotelVO> ReservationList1(String memberId){
//		return dao.getHotelName(memberId);
//	}
//	public List<ReservationJoinHotelVO> ReservationList2(String memberId){
//		return dao.getReserList(memberId);
//	}
	public List<Date> invalidDate(int hotelId) {
		return dao.invalidDate(hotelId);
	}
	
	public int insertReservation(String memberId, int hotelId, String checkIn, String checkOut, int totalPrice) {
		return dao.insertReservation(memberId, hotelId, checkIn, checkOut, totalPrice);
	}
	
}
