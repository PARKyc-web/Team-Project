package com.dev.service;

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

//	// hotelId -> hotelName 불러오기
//	public String searchHotelName(int hotelId) {
//		return dao.getHotelListMyPage(hotelId).getHotelName();
//	}
}
