package com.dev.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.HotelService;
import com.dev.vo.HotelPicVO;
import com.dev.vo.HotelVO;

public class SearchHotelController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String word = req.getParameter("search_word");
		System.out.println(word);
		
		List<HotelVO> list = HotelService.getInstance().getSearchedHotelInfo(word);
		List<List<HotelPicVO>> picList = HotelService.getInstance().getMainHotelPic(list);
		
		req.setAttribute("word", word);
		req.setAttribute("hotelList", list);
		req.setAttribute("hotelPicList", picList);
		req.setAttribute("count", HotelService.getInstance().getSearchedHotelCount(word));
		
		Utils.forward(req, resp, "main/search.tiles");
	}
	
}
