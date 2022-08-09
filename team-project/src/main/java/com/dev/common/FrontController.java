package com.dev.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.controller.AjaxHeartColor;
import com.dev.controller.DoReservationController;
import com.dev.controller.HotelManageFormController;
import com.dev.controller.HotelUploadController;
import com.dev.controller.HotelUploadFormController;
import com.dev.controller.MainController;
import com.dev.controller.MemberJoinController;
import com.dev.controller.MemberLogoutController;
import com.dev.controller.MemberSignInController;
import com.dev.controller.MemberSignInFormController;
import com.dev.controller.MemberSignUpController;
import com.dev.controller.MemberSignUpFormController;
import com.dev.controller.MyMemberDeleteController;
import com.dev.controller.MyMemberDeleteOutput;
import com.dev.controller.MyPageController;
import com.dev.controller.MyPageMainController;
import com.dev.controller.MyPageModiController;
import com.dev.controller.MyPageModiInfoContoller;
import com.dev.controller.MyReservationController;
import com.dev.controller.MyReviewListController;
import com.dev.controller.MyReviewWriterController;
import com.dev.controller.MyWishListController;
import com.dev.controller.SearchHotelController;
import com.dev.controller.SelectHotelController;
import com.dev.controller.Test;

public class FrontController extends HttpServlet{

	String enc;	
	Map<String, Controller> mappings;
	
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		enc = config.getInitParameter("charset");		
		
		mappings = new HashMap<>();
		// Part of parkyc
		mappings.put("/main.do", new MainController());
		mappings.put("/searchHotel.do", new SearchHotelController());		
		mappings.put("/hotelUploadForm.do", new HotelUploadFormController());
		mappings.put("/hotelUpload.do", new HotelUploadController());
		mappings.put("/hotelManageForm.do", new HotelManageFormController());
		
		
		// Part of YJ
		mappings.put("/myPageMain.do", new MyPageMainController());//마이페이지 메인! 
		mappings.put("/myPage.do", new MyPageController());		   //마이페이지 - 내정보
		mappings.put("/myPageModi.do", new MyPageModiController());//마이페이지 - 내정보 - 수정화면으로 넘기기
		mappings.put("/myPageInfoModify.do", new MyPageModiInfoContoller());//마이페이지- 내정보- 수정받은 정보 DB에 보내기
		mappings.put("/myReview.do", new MyReviewListController());//마이페이지 - 내가쓴리뷰
		mappings.put("/myReservation.do", new MyReservationController());//마이페이지 - 나의숙박내역
		mappings.put("/myReviveWriter.do", new MyReviewWriterController());	//마이페이지 - 나의 숙박내역 -> outdate지난애들 리뷰쓰기가능! -> 내가쓴리뷰로 이동
		mappings.put("/myWishList.do", new MyWishListController());//마이페이지 - 나의 위시리스트
		mappings.put("/myMemberDeleteOutput.do", new MyMemberDeleteOutput());//회원탈퇴
		mappings.put("/myMemberDelete.do", new MyMemberDeleteController());

		
		// Part of joha
		mappings.put("/memberJoin.do", new MemberJoinController()); //로그인.회원가입 선택
		mappings.put("/memberSignIn.do", new MemberSignInController()); //로그인
		mappings.put("/memberSignInForm.do", new MemberSignInFormController()); //로그인 폼
		mappings.put("/memberLogout.do", new MemberLogoutController()); //로그아웃
		mappings.put("/memberSignUp.do", new MemberSignUpController()); //회원가입
		mappings.put("/memberSignUpForm.do", new MemberSignUpFormController()); // 회원가입 폼
		mappings.put("/idCheck.do", new Test());
				
		// Part of YR
		mappings.put("/selectHotel.do", new SelectHotelController()); // 호텔 상세 페이지
		// selectHotel.do에서 예약하기를 누른 후 이동하는 페이지
		mappings.put("/doReservation.do", new DoReservationController());
		mappings.put("/ajaxHeartColor.do", new AjaxHeartColor());
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
