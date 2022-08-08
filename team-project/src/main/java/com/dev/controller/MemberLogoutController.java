package com.dev.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Controller;
import com.dev.common.Utils;

public class MemberLogoutController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.invalidate();
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();

		out.println("<script language='javascript'>");
		out.println("alert('로그아웃 완료되었습니다.')");
		out.println("window.location.href ='http://localhost:8088/teamProject/main.do'");
		out.println("</script>");

		out.flush();
		
		
//		Utils.forward(req, resp, "member/memberLogout.tiles");
		
	}

}
