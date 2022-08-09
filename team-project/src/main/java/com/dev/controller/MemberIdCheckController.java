package com.dev.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.dao.MemberDAO;
import com.dev.service.MemberService;
import com.dev.vo.MemberVO;

public class MemberIdCheckController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService service = MemberService.getInstance();

		String idCheck = req.getParameter("id");
		System.out.println(idCheck+"+가져와지는지");
		MemberVO vo = service.searchMember(idCheck);
		PrintWriter out = resp.getWriter();
		if(vo==null) {
			//조회한 id가 업음(사용가능)
			out.print("ok");
		} else {
			//조회한 아이디가 있음(사용불가)
			out.print("no");
		}
		
	}
}