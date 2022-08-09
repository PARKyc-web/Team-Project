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

public class MyPageController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 파라메터
		HttpSession session = req.getSession(true);//false면 은행(정보담긴공간)을 만들어서라도 진행시킴 true면 없으면 걍돌아오기때문에 if-else로 없을때 어케할지를 지정해줌!
		if (session == null) {
			System.out.println("세션이 없습니다. 확인해주세요!");
			Utils.forward(req, resp, "member/memberSignInForm.tiles");

		} else {
			MemberVO vo = (MemberVO) session.getAttribute("member"); // Id password
			
			// DB에 접근해서 정보를 가져오는 부분이 있어야함.
			MemberVO memberInfo = MemberService.getInstance().infoMember(vo.getMemberId());

			// 공유
			req.setAttribute("memberInfo", memberInfo);
			Utils.forward(req, resp, "myPage/myPage.tiles");
		}
	}
}
