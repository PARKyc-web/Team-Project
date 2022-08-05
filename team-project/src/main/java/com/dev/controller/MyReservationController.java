package com.dev.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.ReservationService;
import com.dev.vo.MemberVO;
import com.dev.vo.ReservationJoinHotelVO;

public class MyReservationController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라메터		
		HttpSession session = req.getSession();	
		MemberVO mvo = (MemberVO) session.getAttribute("member"); //Id password
		
		// DB에 접근해서 정보를 가져오는 부분이 있어야함.
		List<ReservationJoinHotelVO> reservation = ReservationService.getInstance().ReservationList(mvo.getMemberId());						

		// 공유
		req.setAttribute("reservation", reservation);

		Utils.forward(req, resp, "myPage/myReservation.tiles");
	}
//		System.out.println("Controller RUN!!");
//		//입력값
////		String hotelName = req.getParameter("hotelName");
////		Date inDate = Date.valueOf(req.getParameter("inDate"));
////		Date outDate = Date.valueOf(req.getParameter("outDate"));
////		int totalPrice = Integer.parseInt(req.getParameter("totalPrice"));
//		String memberId = req.getParameter("memberId");
//		
//		ReservationJoinHotelVO rhvo = new ReservationJoinHotelVO();
//		
//		System.out.println("make JOIN HOTEl VO");
//		
////		rhvo.setHotelName(hotelName);
////		rhvo.setInDate(inDate);
////		rhvo.setInDate(outDate);
////		rhvo.setTotalPrice(totalPrice);
//		rhvo.setMemberId(memberId);
//		
//		System.out.println("CALL SERVICE");
//		
//		ReservationService service = ReservationService.getInstance();
//		List<ReservationJoinHotelVO> list = service.ReservationList(rhvo);
//		
//		System.out.println("AFTER CALL SERVICE");
//		
////		List<HotelVO> hlist = new ArrayList<>();
////		for (int i = 0; i < list.size(); i++) {
////			String Hid = list.get(i).getHotelId();
////
////			HotelVO hnvo = new HotelVO();
////			hnvo.setHotelName(service.searchHotelName(hotelId));
////			// 호텔아이디를이용해서 호텔정보를가져와 서 == 호텔이름가져오기
////
////			hlist.add(hnvo);
////		}
//		for(ReservationJoinHotelVO reservVO : list) {
//			System.out.println(reservVO);
//		}
//		req.setAttribute("reservation", list);
//		
//		Utils.forward(req, resp, "myPage/myReservation.tiles");
//	}
}
