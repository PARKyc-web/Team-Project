package com.dev.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.HotelService;
import com.dev.vo.Criteria;
import com.dev.vo.HotelPicVO;
import com.dev.vo.HotelVO;
import com.dev.vo.Page;

public class SearchHotelController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String word = req.getParameter("search_word");		
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int amount = Integer.parseInt(req.getParameter("amount"));
		
		System.out.println("=== IN CONTROLLER ===");
		System.out.println("amount : " + amount);
		System.out.println("pageNum : " + pageNum);
		
		Criteria cri = new Criteria();
		cri.setPageNum(pageNum);
		cri.setAmount(amount);		
				
		List<HotelVO> list = HotelService.getInstance().getSearchedHotelInfo(word, cri);
		List<List<HotelPicVO>> picList = HotelService.getInstance().getMainHotelPic(list);

		int totalCount = HotelService.getInstance().getSearchedHotelCount(word);
				
		req.setAttribute("word", word);
		req.setAttribute("hotelList", list);
		req.setAttribute("hotelPicList", picList);
		req.setAttribute("count", list.size());
		req.setAttribute("page", new Page(cri, totalCount));		
		
		Utils.forward(req, resp, "main/search.tiles");
	}
	
}
