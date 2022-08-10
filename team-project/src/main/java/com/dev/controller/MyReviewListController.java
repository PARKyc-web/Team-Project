package com.dev.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.ReviewService;
import com.dev.vo.MemberVO;
import com.dev.vo.ReviewJoinReservationJoinHotelVO;
import com.dev.vo.ReviewVO;

public class MyReviewListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 파라메터
		HttpSession session = req.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member"); // Id password

		// DB에 접근해서 정보를 가져오는 부분이 있어야함.
		List<ReviewJoinReservationJoinHotelVO> list = ReviewService.getInstance().getWritredReivew(mvo.getMemberId());
		
		req.setAttribute("list", list);
		Utils.forward(req, resp, "myPage/myReview.tiles");
	}

}
