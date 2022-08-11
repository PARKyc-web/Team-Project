package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.ReviewService;

public class DeleteReviewController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 int reviewId = Integer.parseInt(req.getParameter("reviewId"));
		 
		 ReviewService rvService = ReviewService.getInstance();
		 rvService.deleteReview(reviewId);
		
		Utils.forward(req, resp, "myPage/deleteReview.tiles");		
	}
	
}