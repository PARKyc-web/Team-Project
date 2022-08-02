package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.MemberService;
import com.dev.vo.MemberVO;

public class MyPageModiController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String memberId = req.getParameter("id");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String memberPic = req.getParameter("pic");

		MemberVO vo = new MemberVO();
		vo.setMemberId(memberId);
		vo.setPhone(phone);
		vo.setEmail(email);
		vo.setMemberPic(memberPic);

		MemberService service = MemberService.getInstance();
		service.modifyMember(vo);

		// 공유
		req.setAttribute("memberInfo", vo);
		
	
		Utils.forward(req, resp, "myPage/myPageModi.tiles");
	}
}
