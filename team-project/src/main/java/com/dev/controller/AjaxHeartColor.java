package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.WishListService;

public class AjaxHeartColor implements Controller{
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberId = "testuser";
		int hotelId = Integer.parseInt(req.getParameter("hotelId"));
		int heartColor  = Integer.parseInt(req.getParameter("onOff"));
		
		WishListService wlService = WishListService.getInstance();
		req.setAttribute("heartColor", wlService.changeOnOff(memberId, hotelId, heartColor));
		
		Utils.forward(req, resp, "hotel/selectHotel.tiles");
	}
	
}
