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

		// 파라메터
		Date in = Date.valueOf(req.getParameter("in"));
		Date out = Date.valueOf(req.getParameter("out"));
		String name = req.getParameter("name");
		int cost = Integer.parseInt(req.getParameter("cost"));
		int hotelId = Integer.parseInt(req.getParameter("hotelId"));
		String memberId = req.getParameter("memberId");
		int reservationId = Integer.parseInt(req.getParameter("reservationId"));
		
		ReservationJoinHotelVO vo = new ReservationJoinHotelVO();
		
		System.out.println("MyReviewWriterController======================");
		System.out.println(memberId);
		
		vo.setReservationId(reservationId);
		vo.setInDate(in);
		vo.setOutDate(out);
		vo.setHotelName(name);
		vo.setTotalPrice(cost);
		vo.setHotelId(hotelId);
		vo.setMemberId(memberId);

		// 공유
		req.setAttribute("reservation", vo);
	
		// 공유
		Utils.forward(req, resp, "myPage/myReviewWriter.tiles");
	}
}
