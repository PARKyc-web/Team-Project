package com.dev.service;

import java.util.List;

import com.dev.dao.ReviewDAO;
import com.dev.vo.ReviewVO;

public class ReviewService {
	private static ReviewService service = null;
	private ReviewDAO dao = new ReviewDAO();
	private ReviewService() {}
	
	public static ReviewService getInstance() {
		if(service == null)
			service = new ReviewService();
		
		return service;
	}
	
	public List<ReviewVO> selectHotelReview(int hotelId) {
		return dao.selectHotelReview(hotelId);
	}
	
	public int countHotelReview(int hotelId) {
		return dao.countHotelReview(hotelId);
	}
}
