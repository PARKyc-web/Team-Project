package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.dao.MemberDAO;
import com.dev.vo.MemberVO;

public class MemberRealSearchPwdController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String email = req.getParameter("email");
		String id = req.getParameter("member_id");
		
		System.out.println("================================");
		System.out.println(email);
		System.out.println("================================");
		
		
		MemberVO vo = dao.searchPwd(id,email);
		
		req.setAttribute("vo", vo);
		
		Utils.forward(req, resp, "member/memberSearchPwdResult.tiles");
	}

}
