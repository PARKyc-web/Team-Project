package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.MemberService;
import com.dev.vo.HotelVO;

public class MyHotelListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hotId = req.getParameter("hotelId");
		String hotName = req.getParameter("hotelName");
		int hotPrice = Integer.parseInt(req.getParameter("hotelPrice"));
//		String reserInDate = req.getParameter("inDate");
//		String reserOutDate = req.getParameter("outDate");
//		
		HotelVO vo = new HotelVO();
		//ReservationVO rvo = new ReservationVO();
		vo.setHotelId(Integer.parseInt(hotId));
		vo.setHotelName(hotName);
		vo.setHotelPrice(hotPrice);
//		rvo.setInDate(reserInDate);
//		rvo.setOutDate(reserOutDate);
//	
		MemberService service = MemberService.getInstance();
		
		//
		
		req.setAttribute("hotel", vo);
		
		Utils.forward(req, resp, "myPage/myPage.tiles");
	}
	

}
