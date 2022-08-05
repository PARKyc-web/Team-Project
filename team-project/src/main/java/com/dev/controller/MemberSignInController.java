package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.MemberService;
import com.dev.vo.MemberVO;

public class MemberSignInController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService service = MemberService.getInstance();
		HttpSession session = req.getSession();
		
		String id = req.getParameter("member_id");
		String pw = req.getParameter("member_password");
		
		System.out.println(id);
		System.out.println(pw);
	
		MemberVO vo = service.searchMember(id);
		
		if(vo == null || !pw.equals(vo.getMemberPassword())) {
			Utils.forward(req, resp, "member/memberLoginFail.tiles");
		} else {
			session.setAttribute("member", vo);
			Utils.forward(req, resp, "member/memberLoginSuccess.tiles");
		}
	}

}
