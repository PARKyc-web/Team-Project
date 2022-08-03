package com.dev.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.HotelService;

public class SelectHotelController implements Controller{
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		RequestDispatcher rd = req.getRequestDispatcher("hotel/selectHotel.tiles");		
//		rd.forward(req, resp);
		
		HotelService service = HotelService.getInstance();
		req.setAttribute("hotelInfo", service.getHotelInfo(113));
		
		Utils.forward(req, resp, "hotel/selectHotel.tiles");
	}
}
