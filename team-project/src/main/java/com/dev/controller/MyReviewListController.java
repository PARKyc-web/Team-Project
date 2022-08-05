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
import com.dev.vo.ReviewVO;

public class MyReviewListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberId = req.getParameter("memberId");

		ReviewVO vo = new ReviewVO();

		ReviewJoinReservationJoinHotelVO rrhvo = new ReviewJoinReservationJoinHotelVO();
		rrhvo.setMemberId(memberId);
		
		ReviewService service = ReviewService.getInstance();
		List<ReviewJoinReservationJoinHotelVO>list = service.ReviewList(rrhvo);
		
		req.setAttribute("review", list);
		Utils.forward(req, resp, "myPage/myReview.tiles");
	}

}
