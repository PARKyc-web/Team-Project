package com.dev.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		int type = Integer.parseInt(req.getParameter("member_type"));
		String able = req.getParameter("member_able");
		System.out.println("run3");
		String name = req.getParameter("member_name");
		int age = Integer.parseInt( req.getParameter("member_age"));
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");

		
		MemberVO vo = new MemberVO();		
		vo.setMemberId(id);
		vo.setMemberPassword(pw);
		vo.setMemberType(type);
		vo.setMemberAble(able);
		
		vo.setMemberName(name);
		System.out.println(age);
		vo.setMemberAge(age);
		vo.setPhone(phone);
		vo.setEmail(email);
		vo.setMemberPic("user_image/default_pro.jpg");
		
		service.addMember(vo);
		System.out.println(vo);
		req.setAttribute("member", vo);
		
		HttpSession session = req.getSession();
		session.setAttribute("member", vo);

		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		out.println("<script language='javascript'>");
		out.println("window.location.href ='http://localhost:8088/teamProject/main.do'");
		out.println("alert('회원가입이 완료되었습니다.')");
		out.println("</script>");

		out.flush();
		
		
//		Utils.forward(req, resp, "member/memberSignUpSuccess.tiles");
	}
}
