package com.dev.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.ReservationService;
import com.dev.vo.MemberVO;
import com.dev.vo.ReservationJoinHotelVO;
import com.dev.vo.ReviewVO;

public class MyReservationController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라메터		
		HttpSession session = req.getSession();	
		
		System.out.println((MemberVO)session.getAttribute("member"));
		MemberVO mvo = (MemberVO) session.getAttribute("member"); //Id password
		
		ReviewVO vo = new ReviewVO();//<memberId 이용해
		// DB에 접근해서 정보를 가져오는 부분이 있어야함.
		List<ReservationJoinHotelVO> reservation = ReservationService.getInstance().ReservationList(mvo.getMemberId());						
		ReviewVO review = ReservationService.getInstance().getReview(vo);
		// 공유

		req.setAttribute("reservation", reservation);		

		Utils.forward(req, resp, "myPage/myReservation.tiles");
	}
}
