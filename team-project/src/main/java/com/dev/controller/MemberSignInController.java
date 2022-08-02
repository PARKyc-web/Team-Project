package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.MemberService;
import com.dev.vo.MemberVO;

public class MemberSignInController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService service = MemberService.getInstance();
		
		String id = req.getParameter("member_id");
		String pw = req.getParameter("member_password");
	
		MemberVO vo = new MemberVO();
		
		vo.setMemberId(id);
		vo.setMemberPassword(pw);

		
		service.addMember(vo);
		
		
		req.setAttribute("member", vo);
		
		Utils.forward(req, resp, "member/memberSignIn.tiles");

	}

}
