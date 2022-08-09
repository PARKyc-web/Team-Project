package com.dev.service;

import java.util.List;

import com.dev.dao.WishListDAO;
import com.dev.vo.HotelVO;
import com.dev.vo.WishListJoinHotelVO;
import com.dev.vo.WishListVO;

public class WishListService {
	
	private static WishListService instance = new WishListService();
	WishListDAO dao = new WishListDAO();
	
	private WishListService() {}
	public static WishListService getInstance() {
		return instance;
	}
	//나의 숙박위시리스트
	public List<WishListJoinHotelVO> ListWishList(String memberId) {
		return dao.getWishList(memberId);
	}
	
	// 호텔 상세 페이지 내 위시리스트(하트)의 상태를 나타내는 함수입니다.
	public int heartColor(String memberId, int hotelId) {
		return dao.heartColor(memberId, hotelId);
	}
	
	// wish_list의 onOff 값을 update합니다.
	public int changeOnOff(String memberId, int hotelId, int onOff) {
		return dao.changeOnOff(memberId, hotelId, onOff);
	}
	
	public void insertWishList(String memberId, int hotelId) {
		dao.insertWishList(memberId, hotelId);
	}


}
