package com.dev.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.HotelService;
import com.dev.service.WishListService;
import com.dev.vo.HotelPicVO;
import com.dev.vo.HotelVO;
import com.dev.vo.MemberVO;
import com.dev.vo.WishListJoinHotelVO;

public class MyWishListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라메터		
		HttpSession session = req.getSession();	
		MemberVO mvo = (MemberVO) session.getAttribute("member"); //Id password
		
		// DB에 접근해서 정보를 가져오는 부분이 있어야함.
		List<WishListJoinHotelVO> wishList = WishListService.getInstance().ListWishList(mvo.getMemberId());
		List<HotelVO> list = new ArrayList<>();
		
		for(WishListJoinHotelVO vo : wishList) {
			HotelVO temp = new HotelVO();
			temp.setHotelId(vo.getHotelId());
			list.add(temp);
		}
		
		List<List<HotelPicVO>> picList = HotelService.getInstance().getMainHotelPic(list);
		// 공유
		req.setAttribute("wishList", wishList);
		req.setAttribute("picList", picList);
		req.setAttribute("size", wishList.size());
		
		Utils.forward(req, resp, "myPage/myWishList.tiles");
	}
}
