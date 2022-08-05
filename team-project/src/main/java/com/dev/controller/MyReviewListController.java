package com.dev.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.ReviewService;
import com.dev.vo.ReviewJoinReservationJoinHotelVO;

public class MyReviewListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String hotelName = req.getParameter("hotelName");
//		Date reviewDate  = Date.valueOf(req.getParameter("reviewDate"));
//		float reviewRate = Float.valueOf(req.getParameter("reviewRate"));
//		Date inDate = Date.valueOf(req.getParameter("inDate"));
//		Date outDate = Date.valueOf(req.getParameter("outDate"));
//		String reviewContents = req.getParameter("reviewContents");
		String memberId = req.getParameter("memberId");
		
<<<<<<< HEAD
		ReviewVO vo = new ReviewVO();
//		vo.setHotelId(hotId);
//		vo.setReviewDate(reDate);
		vo.setReviewContents(reContent);
=======
		ReviewJoinReservationJoinHotelVO rrhvo = new ReviewJoinReservationJoinHotelVO();
//		rrhvo.setHotelName(hotelName);
//		rrhvo.setReviewDate(reviewDate);
//		rrhvo.setReviewRate(reviewRate);
//		rrhvo.setInDate(inDate);
//		rrhvo.setOutDate(outDate);
//		rrhvo.setReviewContents(reviewContents);
		rrhvo.setMemberId(memberId);
>>>>>>> refs/remotes/origin/main
		
		
		ReviewService service = ReviewService.getInstance();
		List<ReviewJoinReservationJoinHotelVO>list = service.ReviewList(rrhvo);
		
		
//		for(ReviewJoinReservationJoinHotelVO v1o : list) {
//			System.out.println(v1o);
//		}
		
		req.setAttribute("review", list);
		Utils.forward(req, resp, "myPage/myReview.tiles");
	}

}
