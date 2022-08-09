package com.dev.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.MemberService;
import com.dev.vo.MemberVO;

public class MyPageModiInfoContoller implements Controller{
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//디비에 진짜로 정보를 변경한 후에 보내준다
		String id = req.getParameter("id");
		String call = req.getParameter("call");
		String mail = req.getParameter("mail");
		String pic = req.getParameter("pic");
		
		MemberVO vo = MemberService.getInstance().infoMember(id);//infomember메소드로 id를 이용해서 개인정보 모든것 가져오기
		vo.setEmail(mail);
		vo.setMemberPic(pic);
		vo.setPhone(call);	//< 변경할 3가지의 값만 담아서
		
		MemberService.getInstance().modifyMember(vo);//<id를 통해 얻은 모든 정보와 변경할 3가지의 값(덮어씌우기) 보내기
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		out.println("<script language='javascript'>");
		out.println("window.location.href ='http://localhost:8088/teamProject/myPage.do'");
		out.println("alert('정보 수정이 완료되었습니다.')");
		out.println("</script>");

		out.flush();
		
		//Utils.forward(req, resp, "myPage/myPageModiOutput.tiles");		
	}
	
}
