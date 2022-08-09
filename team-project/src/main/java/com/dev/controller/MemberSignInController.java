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

		if(vo == null || vvo == null) {
			out.println("<script language='javascript'>");
			out.println("window.location.href ='http://localhost:8088/teamProject/memberSignInForm.do'");
			out.println("alert('존재하지 않는 아이디입니다')");
			out.println("</script>");
			out.flush();
		} else if(!pw.equals(vvo.getMemberPassword())){
			out.println("<script language='javascript'>");
			out.println("window.location.href ='http://localhost:8088/teamProject/memberSignInForm.do'");
			out.println("alert('아이디와 비밀번호를 확인하세요')");
			out.println("</script>");
			out.flush();
		} else {
			vo.setMemberPassword(pw);
			vo.setMemberType(vvo.getMemberType());
			session.setAttribute("member", vo);

			out.println("<script language='javascript'>");
			out.println("window.location.href ='http://localhost:8088/teamProject/main.do'");
			out.println("alert('로그인 되었습니다.')");
			out.println("</script>");
			
			out.flush();
		}
	}

}
