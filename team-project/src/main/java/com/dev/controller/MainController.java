package com.dev.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.HotelService;
import com.dev.vo.HotelPicVO;
import com.dev.vo.HotelVO;

public class MainController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		
		List<HotelVO> list = HotelService.getInstance().getRandomTenHotel();		
		List<List<HotelPicVO>> picList = HotelService.getInstance().getMainHotelPic(list);		

		req.setAttribute("pic_list", picList);
		req.setAttribute("random_list", list);		
		
		/*for(List<HotelPicVO> outerList : picList) {
			System.out.println(outerList);
			for(HotelPicVO vo : outerList) {
				System.out.println("inner value : " + vo);
			}						
		}*/
		
		Utils.forward(req, resp, "main/main.tiles");
//		RequestDispatcher rd = req.getRequestDispatcher("main/main.tiles");
//		rd.forward(req, resp);		
	}	
}
