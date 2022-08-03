package com.dev.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.controller.MainController;
import com.dev.controller.MemberJoinController;
import com.dev.controller.MemberSignInController;
import com.dev.controller.MemberSignUpController;
import com.dev.controller.MyHotelListController;
import com.dev.controller.MyPageController;
import com.dev.controller.MyPageModiController;
import com.dev.controller.MyReviewListController;
import com.dev.controller.MyWishListController;
import com.dev.controller.SelectHotelController;

public class FrontController extends HttpServlet{

	String enc;	
	Map<String, Controller> mappings;
	
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		enc = config.getInitParameter("charset");		
		
		mappings = new HashMap<>();
		// Part of parkyc
		mappings.put("/main.do", new MainController());
		
		// Part of YJ
		mappings.put("/main.do", new MainController());	//메인
		mappings.put("/myPage.do", new MyPageController());//마이페이지
		mappings.put("/myPageModi.do", new MyPageModiController());//마이페이지 - 수정
		mappings.put("/myReview.do", new MyReviewListController());//마이페이지 - 내가쓴리뷰
		mappings.put("/myHotel.do", new MyHotelListController());//마이페이지 - 나의 숙박내역
		mappings.put("/myWish.do", new MyWishListController());//마이페이지 - 나의 위시리스트
		
		// Part of joha
		mappings.put("/memberSignUp.do", new MemberSignUpController());
		mappings.put("/memberSignIn.do", new MemberSignInController());
		mappings.put("/memberJoin.do", new MemberJoinController());
		
		// Part of YR
		mappings.put("/selectHotel.do", new SelectHotelController());
	}

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding(enc);
		
		String uri = req.getRequestURI();	
		String contextPath = req.getContextPath();
		String path = uri.substring(contextPath.length());
		System.out.println(path);
		
		Controller cntr = mappings.get(path);
		cntr.execute(req, resp);
	}
	
}
