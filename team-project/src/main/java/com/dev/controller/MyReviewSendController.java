package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.MemberService;
import com.dev.service.ReviewService;
import com.dev.vo.ReviewVO;

public class MyReviewSendController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 디비에 진짜로 정보를 변경한 후에 보내준다
		String contents = req.getParameter("reviewContents");
		String rate = req.getParameter("reviewRate");

		ReviewVO vo = ReviewService.getInstance().reviewList2(vo.getMemberId());// infomember메소드로 id를 이용해서 개인정보 모든것 가져오기
		vo.setContents(contents);
		vo.setReviewRate(rate);// < 삽입할 2가지의 값만 담아서
		
		//리스트가 아닌 리뷰 메소드를 만들어야하는지,,??
		ReviewService.getInstance().reviewWrite(vo);// <id를 통해 얻은 모든 정보와 변경할 3가지의 값(덮어씌우기) 보내기

		Utils.forward(req, resp, "myPage/myReviewSendOutput.tiles");
	}

}
