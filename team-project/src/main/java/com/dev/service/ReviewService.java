package com.dev.service;

import java.util.List;

import com.dev.dao.ReviewDAO;
import com.dev.vo.ReviewVO;
import com.dev.vo.ReviewJoinReservationJoinHotelVO;

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
	
	public float avgHotelReview(int hotelId) {
		return dao.avgHotelReview(hotelId);
	}

	
	public List<ReviewJoinReservationJoinHotelVO> ReviewList(String memberId) {
		return dao.getReviewList(memberId);

	}
}
