package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.HotelService;
import com.dev.service.ReviewService;

public class SelectHotelController implements Controller{
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		RequestDispatcher rd = req.getRequestDispatcher("hotel/selectHotel.tiles");		
//		rd.forward(req, resp);
		
		int hotelId = Integer.parseInt(req.getParameter("hotelId"));
						
		HotelService hotelService = HotelService.getInstance();
		req.setAttribute("hotelInfo", hotelService.getHotelInfo(hotelId));
		req.setAttribute("picList", hotelService.getSelectedHotelImage(hotelId));
		
		ReviewService rvService = ReviewService.getInstance();
		req.setAttribute("reviewList", rvService.selectHotelReview(hotelId));
		req.setAttribute("countReview", rvService.countHotelReview(hotelId));
		req.setAttribute("avgStar", rvService.avgHotelReview(hotelId));
		
		
		
		Utils.forward(req, resp, "hotel/selectHotel.tiles");	
	}
}
