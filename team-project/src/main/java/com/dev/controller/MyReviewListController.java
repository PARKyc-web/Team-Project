package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.MemberService;
import com.dev.vo.ReviewVO;

public class MyReviewListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hotId = req.getParameter("hotelId");
		String reDate = req.getParameter("reviewDate");
		String reContent = req.getParameter("reviewContent");
		
		ReviewVO vo = new ReviewVO();
//		vo.setHotelId(hotId);
//		vo.setReviewDate(reDate);
		vo.setReviewContents(reContent);
		
		MemberService service = MemberService.getInstance();
		service.ReviewList(vo);
		
		req.setAttribute("review", vo);
		
		Utils.forward(req, resp, "myPage/myPage.tiles");
	}

}
