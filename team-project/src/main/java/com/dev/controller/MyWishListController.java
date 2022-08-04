package com.dev.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.WishListService;
import com.dev.vo.WishListJoinHotelVO;

public class MyWishListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hotelName = req.getParameter("hotelName");
		String memberId = req.getParameter("memberId");
		int onOff = Integer.parseInt(req.getParameter("onOff"));
		
		WishListJoinHotelVO jwhvo = new WishListJoinHotelVO();
		
		jwhvo.setHotelName(hotelName);
		jwhvo.setMemberId(memberId);
		jwhvo.setOnOff(onOff);
		
		WishListService service = WishListService.getInstance();
		List<WishListJoinHotelVO>list = service.JoinWishListHotel(jwhvo);

		req.setAttribute("wishList", list);

		Utils.forward(req, resp, "myPage/myWishList.tiles");
	}
}
