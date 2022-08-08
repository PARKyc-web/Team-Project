package com.dev.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		
    resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
    
		String id = req.getParameter("member_id");
		String pw = req.getParameter("member_password");
		
		System.out.println(id);
		System.out.println(pw);

			
		MemberVO vvo = service.searchMember(id);		
		MemberVO vo = service.infoMember(id);
		vo.setMemberPassword(pw);
		vo.setMemberType(vvo.getMemberType());	
	
		if(vvo == null || !pw.equals(vo.getMemberPassword())) {
			out.println("<script language='javascript'>");
			out.println("window.location.href ='http://localhost:8088/teamProject/memberSignInForm.do'");
			out.println("alert('로그인 실패.')");
			out.println("</script>");
			out.flush();
		} else {
			session.setAttribute("member", vo);

			out.println("<script language='javascript'>");
			out.println("window.location.href ='http://localhost:8088/teamProject/main.do'");
			out.println("alert('로그인 성공했습니다.')");
			out.println("</script>");
			
			out.flush();
		}
	}

}
