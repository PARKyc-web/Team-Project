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

public class MyMemberDeleteController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService service = MemberService.getInstance();
		HttpSession session = req.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		
		String id = mvo.getMemberId();
		
		service.deleteMember(id);
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();


		out.println("<script language='javascript'>");
		out.println("alert('정상적으로 탈퇴되었습니다')");
		out.println("window.location.href ='http://localhost:8088/teamProject/main.do'");
		out.println("</script>");

		out.flush();
		
		session.invalidate();
		
//		Utils.forward(req, resp, "main/main.tiles");

	}
}

