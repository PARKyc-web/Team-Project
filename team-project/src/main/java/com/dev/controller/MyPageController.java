package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.MemberService;
import com.dev.vo.MemberVO;

public class MyPageController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라메터
		String memberId = req.getParameter("id");
		String memberPassword = req.getParameter("password");
		String memberName = req.getParameter("name");
		int memberAge = Integer.parseInt(req.getParameter("age"));
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		
		String memberType = req.getParameter("type");
		String memberAble = req.getParameter("able");
		String signInDate = req.getParameter("signInDate");
		String memberPic = req.getParameter("pic");
		
		
		MemberVO vo = new MemberVO();
		vo.setMemberId(memberId);
		vo.setMemberPassword(memberPassword);
		vo.setMemberName(memberName);
		vo.setMemberAge(memberAge);
		vo.setPhone(phone);
		vo.setEmail(email);
		vo.setMemberType(memberType);
		vo.setMemberAble(memberAble);
		vo.setSignInDate(signInDate);
		vo.setMemberPic(memberPic);

		MemberService service = MemberService.getInstance();
		service.infoMember(memberId);

		// 공유
		req.setAttribute("memberInfo", vo);

		Utils.forward(req, resp, "myPage/myPage.tiles");
	}
}
