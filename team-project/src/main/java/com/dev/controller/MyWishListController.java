package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.MemberService;
import com.dev.vo.WishListVO;

public class MyWishListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hotId = req.getParameter("hotelId");
		
		WishListVO vo = new WishListVO();
		vo.getHotelId();
		
		MemberService service = MemberService.getInstance();
		service.WishList(vo);

		req.setAttribute("wishList", vo);

		Utils.forward(req, resp, "myPage/myPage.tiles");
	}
}
