package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.HotelService;
import com.dev.service.ReviewService;

public class DoReservationController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int hotelId = 113;
		HotelService hotelService = HotelService.getInstance();
		req.setAttribute("hotelInfo", hotelService.getHotelInfo(hotelId));
		
		ReviewService rvService = ReviewService.getInstance();
		req.setAttribute("countReview", rvService.countHotelReview(hotelId));
		req.setAttribute("avgStar", rvService.avgHotelReview(hotelId));
		
		String checkInOut = req.getParameter("datefilter");
		String guestNum = req.getParameter("guestNum");
		req.setAttribute("checkInOut", checkInOut);
		req.setAttribute("guestNum", guestNum);
		
		Utils.forward(req, resp, "reservation/doReservation.tiles");
	}

}
