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

public class MyPageModiController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라메터		
		HttpSession session = req.getSession();	
		MemberVO vo = (MemberVO) session.getAttribute("member"); //Id password
						
		// DB에 접근해서 정보를 가져오는 부분이 있어야함.
		MemberVO memberModi = MemberService.getInstance().infoMember(vo.getMemberId());	
		MemberService.getInstance().modifyMember(vo);
						
		// 공유
		req.setAttribute("memberModi", memberModi);
		Utils.forward(req, resp, "myPage/myPageModi.tiles");	
	}
}
