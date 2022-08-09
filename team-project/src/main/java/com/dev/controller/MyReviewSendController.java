package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.ReviewService;
import com.dev.vo.ReviewVO;

public class MyReviewSendController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 디비에 진짜로 정보를 변경한 후에 보내준다
		 String contents = req.getParameter("contents");
	      Float rate = Float.valueOf((req.getParameter("rate")));
	      int hotelId = Integer.parseInt(req.getParameter("hotelId"));
	      String memberId = req.getParameter("memberId");
	      String hotelName = req.getParameter("hotelName");
	      
	      ReviewVO vo = new ReviewVO();// 
	      vo.setReviewContents(contents);
	      vo.setReviewRate(rate);// < 삽입할 4가지의 값만 담아서
	      vo.setHotelId(hotelId);
	      vo.setMemberId(memberId);
	      
	   
	      //리스트가 아닌 리뷰 메소드를 만들어야하는지,,??
	      ReviewService.getInstance().reviewWrite(vo);// 
	      
	      Utils.forward(req, resp, "myPage/myReviewSendOutput.tiles");
	}

}
