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


}
