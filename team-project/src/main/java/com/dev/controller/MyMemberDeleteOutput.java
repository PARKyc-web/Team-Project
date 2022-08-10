package com.dev.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.HotelService;
import com.dev.service.MemberService;
import com.dev.vo.HotelPicVO;
import com.dev.vo.HotelVO;
import com.dev.vo.MemberVO;

public class MyMemberDeleteOutput implements Controller {


	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService service = MemberService.getInstance();
		HttpSession session = req.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		
		String id = mvo.getMemberId();
		
		List<HotelVO> list = HotelService.getInstance().getRandomTenHotel();		
		List<List<HotelPicVO>> picList = HotelService.getInstance().getMainHotelPic(list);		
		
		req.setAttribute("pic_list", picList);
		req.setAttribute("random_list", list);
		
		Utils.forward(req, resp, "myPage/myMemberDelete.tiles");
	

	}
}
