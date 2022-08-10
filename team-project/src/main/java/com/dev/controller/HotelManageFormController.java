package com.dev.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.HotelService;
import com.dev.vo.Criteria;
import com.dev.vo.HotelPicVO;
import com.dev.vo.HotelVO;
import com.dev.vo.MemberVO;
import com.dev.vo.Page;

public class HotelManageFormController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
	
		HttpSession session = req.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
				
		Criteria cri = new Criteria();		
		if(pageNum == null || amount == null) {
			cri.setPageNum(1);
			cri.setAmount(12);
			
		}else {
			cri.setAmount(Integer.parseInt(amount));
			cri.setPageNum(Integer.parseInt(pageNum));
		}
		
		List<HotelVO> list = HotelService.getInstance().getOwnHotel(mvo.getMemberId(), cri);
		List<List<HotelPicVO>> picList = HotelService.getInstance().getMainHotelPic(list);
		
		int total = HotelService.getInstance().totalOwnHotelCount(mvo.getMemberId());
		
		req.setAttribute("list", list);
		req.setAttribute("picList", picList);
		req.setAttribute("count", list.size());
		req.setAttribute("page", new Page(cri, total));		
		
		Utils.forward(req, resp, "main/hotelManageForm.tiles");		
	}
	
}
