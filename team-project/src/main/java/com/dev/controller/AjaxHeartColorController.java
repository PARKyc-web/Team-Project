package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.WishListService;
import com.dev.vo.MemberVO;

public class AjaxHeartColorController implements Controller{
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		String memberId;
		try {
			memberId = vo.getMemberId();
		} catch(Exception e) {
			memberId = null;
		}
		
		int hotelId = Integer.parseInt(req.getParameter("hotelId"));
		int heartColor  = Integer.parseInt(req.getParameter("heartColor"));
		
		WishListService wlService = WishListService.getInstance();

		if(heartColor == 0) {
			// Update red heart to white heart
			wlService.changeOnOff(memberId, hotelId, 1);
//			req.setAttribute("heartColor", wlService.changeOnOff(memberId, hotelId, 1));			
		} else if(heartColor == 1) {
			// Update white heart to red heart
			wlService.changeOnOff(memberId, hotelId, 0);
//			req.setAttribute("heartColor", wlService.changeOnOff(memberId, hotelId, 0));	
		} else {
			// Insert white heart to red heart
			wlService.insertWishList(memberId, hotelId);
		}
		
		req.setAttribute("heartColor", heartColor);
		Utils.forward(req, resp, "wishList/heartColor.tiles");
	}
	
}
