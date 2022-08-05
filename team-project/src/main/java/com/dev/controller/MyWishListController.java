package com.dev.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.WishListService;
import com.dev.vo.MemberVO;
import com.dev.vo.WishListJoinHotelVO;

public class MyWishListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라메터		
		HttpSession session = req.getSession();	
		MemberVO mvo = (MemberVO) session.getAttribute("member"); //Id password
		
		// DB에 접근해서 정보를 가져오는 부분이 있어야함.
		List<WishListJoinHotelVO> wishList = WishListService.getInstance().ListWishList(mvo.getMemberId());						

		// 공유
		req.setAttribute("wishList", wishList);

		Utils.forward(req, resp, "myPage/myWishList.tiles");
	}
		
//		String hotelName = req.getParameter("hotelName");
//		String memberId = req.getParameter("memberId");
//		int onOff = Integer.parseInt(req.getParameter("onOff"));
//		
//		WishListJoinHotelVO jwhvo = new WishListJoinHotelVO();
//		
//		jwhvo.setHotelName(hotelName);
//		jwhvo.setMemberId(memberId);
//		jwhvo.setOnOff(onOff);
//		
//		WishListService service = WishListService.getInstance();
//		List<WishListJoinHotelVO>list = service.JoinWishListHotel(jwhvo);
//
//		req.setAttribute("wishList", list);
//
//		Utils.forward(req, resp, "myPage/myWishList.tiles");
//	}
}
