package com.dev.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.HotelService;
import com.dev.service.ReservationService;
import com.dev.service.ReviewService;
import com.dev.service.WishListService;
import com.dev.vo.MemberVO;

public class SelectHotelController implements Controller{
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		String memberId;
		try {
			memberId = vo.getMemberId();
		} catch(Exception e) {
			memberId = null;
		}
		req.setAttribute("memberId", memberId);
		
		int hotelId = Integer.parseInt(req.getParameter("hotelId"));
//		int hotelId = 113;
						
		HotelService hotelService = HotelService.getInstance();
		req.setAttribute("hotelInfo", hotelService.getHotelInfo(hotelId));
		req.setAttribute("picList", hotelService.getSelectedHotelImage(hotelId));
		req.setAttribute("hostName", hotelService.getHostName(hotelId));
		
		ReviewService reviewService = ReviewService.getInstance();
		req.setAttribute("reviewList", reviewService.selectHotelReview(hotelId));
		req.setAttribute("countReview", reviewService.countHotelReview(hotelId));
		req.setAttribute("avgStar", reviewService.avgHotelReview(hotelId));
		
		ReservationService rvService = ReservationService.getInstance();
		req.setAttribute("invalidDate", rvService.invalidDate(hotelId));
		
		WishListService wlService = WishListService.getInstance();
		req.setAttribute("heartColor", wlService.heartColor(memberId, hotelId));
		
		Utils.forward(req, resp, "hotel/selectHotel.tiles");	
	}
}
