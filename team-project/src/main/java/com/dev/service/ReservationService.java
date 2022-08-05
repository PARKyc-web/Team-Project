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
	public List<ReservationJoinHotelVO> ReservationList(ReservationJoinHotelVO rhvo) {
		return dao.getReservationList(rhvo);
	}

	public List<Date> invalidDate(int hotelId) {
		return dao.invalidDate(hotelId);
	}
}
