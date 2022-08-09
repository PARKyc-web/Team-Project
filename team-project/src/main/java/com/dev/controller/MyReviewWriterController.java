package com.dev.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.MemberService;
import com.dev.vo.ReservationJoinHotelVO;
import com.dev.vo.ReservationVO;

public class MyReviewWriterController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println(req.getParameter("in"));
		System.out.println(req.getParameter("out"));
		System.out.println(req.getParameter("name"));
		System.out.println(req.getParameter("cost"));
		System.out.println(req.getParameter("hotelId"));
		System.out.println(req.getParameter("memberId"));

		// jsp
		// 파라메터
		Date in = Date.valueOf(req.getParameter("in"));
		Date out = Date.valueOf(req.getParameter("out"));
		String name = req.getParameter("name");
		int cost = Integer.parseInt(req.getParameter("cost"));
		int hotelId = Integer.parseInt(req.getParameter("hotelId"));
		String memberId = req.getParameter("memberId");

		ReservationJoinHotelVO vo = new ReservationJoinHotelVO();

		vo.setInDate(in);
		vo.setOutDate(out);
		vo.setHotelName(name);
		vo.setTotalPrice(cost);
		vo.setHotelId(hotelId);
		vo.setMemberId(memberId);

		// 공유
		req.setAttribute("reservation", vo);

//		ReviewVO vo = new ReviewVO();		
//		vo.setContents(
//		ReviewService.getInstance().reviewWrite(vo);
//		
		// 공유
		Utils.forward(req, resp, "myPage/myReviewWriter.tiles");
	}
//		//파라메터
//		HttpSession session = req.getSession();//id, password
//		MemberVO mvo = (MemberVO)session.getAttribute("member");
//		
//		// DB에 접근해서 정보를 가져오는 부분이 있어야함.
//		List<ReservationJoinHotelVO> reservation = ReservationService.getInstance().ReservationList(mvo.getMemberId());
//					
//		System.out.println(req.getParameter("in"));
//		System.out.println(req.getParameter("out"));
//		System.out.println(req.getParameter("name"));
//		System.out.println();
//		//공유
//		req.setAttribute("reservation", reservation);
////		req.setAttribute("reviewWrite", vo);
//		
//		Utils.forward(req, resp, "myPage/myReviewWriter.tiles");
//		
//		// jsp  
//		
//		ReviewVO vo = new ReviewVO();		
//		ReviewService.getInstance().reviewWrite(vo);	
//	}

}
