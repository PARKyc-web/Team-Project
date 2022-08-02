package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.MemberService;
import com.dev.vo.MemberVO;

public class MemberSignUpController extends HttpServlet implements Controller {
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("run1");
		
		MemberService service = MemberService.getInstance();
		System.out.println("run2");
		String id = req.getParameter("member_id");
		String pw = req.getParameter("member_password");
		String type = req.getParameter("member_type");
		String able = req.getParameter("member_able");
		System.out.println("run3");
//		String name = req.getParameter("member_name");
//		String age = req.getParameter("member_age");
//		String phone = req.getParameter("phone");
//		String email = req.getParameter("email");
		
		MemberVO vo = new MemberVO();		
		vo.setMemberId(id);
		vo.setMemberPassword(pw);
		vo.setMemberType(type);
		vo.setMemberAble(able);
		
//		vo.setMemberName(name);
//		vo.setMemberAge(Integer.parseInt(age));
//		vo.setPhone(phone);
//		vo.setEmail(email);
		service.addMember(vo);
		
		req.setAttribute("member", vo);
		
		Utils.forward(req, resp, "member/memberSignUp.tiles");
	}
}
