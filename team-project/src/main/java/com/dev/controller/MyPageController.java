package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.vo.MyPageVO;

public class MyPageController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라메터
		String hotId = req.getParameter("hotelId");
		String reDate = req.getParameter("reviewDate");
		String reContent = req.getParameter("reviewContent");
		String hotName = req.getParameter("hotelName");
		int hotPrice = (Integer.parseInt(req.getParameter("hotelPrice")));
		String reserInDate = req.getParameter("inDate");
		String reserOutDate = req.getParameter("outDate");
		
	
		MyPageVO vo = new MyPageVO();
		vo.setHotelId(hotId);
		vo.setInDate(reDate);
		vo.setReviewContents(reContent);
		vo.setHotelName(hotName);
		vo.setHotelPrice(hotPrice);
		vo.setInDate(reserInDate);
		vo.setOutDate(reserOutDate);
	
	}
}
