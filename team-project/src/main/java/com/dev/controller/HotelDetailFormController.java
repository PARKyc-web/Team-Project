package com.dev.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.HotelService;
import com.dev.vo.HotelPicVO;
import com.dev.vo.HotelVO;

public class HotelDetailFormController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int hotelId = Integer.parseInt(req.getParameter("hotelId"));
		
		HotelVO vo = HotelService.getInstance().getHotelInfo(hotelId);
		List<HotelPicVO> pic = HotelService.getInstance().getSelectedHotelImage(hotelId);
		
		req.setAttribute("hotel", vo);
		req.setAttribute("hotelPic", pic);
		
		Utils.forward(req, resp, "main/detail.tiles");
	}	
}
