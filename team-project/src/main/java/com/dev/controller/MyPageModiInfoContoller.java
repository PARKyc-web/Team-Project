package com.dev.controller;

import java.io.File;
import java.io.IOException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.MemberService;
import com.dev.vo.MemberVO;

public class MyPageModiInfoContoller implements Controller{
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
				
		int max_size = 1024 * 1024 * 1024;
		String charset = "UTF-8";
		String root = req.getSession().getServletContext().getRealPath("/");
		
		req.setCharacterEncoding(charset);
		
		Map<String, String> parameter = new HashMap<>();
		
		String separator = File.separator;		
		File file = new File(root + separator + "user_image");
		
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		fileItemFactory.setRepository(file);
		fileItemFactory.setSizeThreshold(max_size);
		
		ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
		
		File uploadFolder = null;	
		String fileName = "";
		String extension = "";
		boolean isImage = false;
		
		MemberVO mvo = new MemberVO();
				
		try {
			List<FileItem> items = fileUpload.parseRequest(req);
			
			for(FileItem it : items) {
				
				if(it.isFormField()) {
					
					System.out.println(it.getFieldName());
					System.out.println(it.getString());
					
					parameter.put(it.getFieldName(), it.getString(charset));
					
				}else {
					if(it.getSize() > 0 ) {
						int index = it.getName().lastIndexOf(separator);
						fileName = it.getName().substring(index + 1);						
						
						extension = fileName.substring(fileName.lastIndexOf("."));
						
						uploadFolder = new File(file + separator + vo.getMemberId() + extension);		
						
						System.out.println("uploadFolder : " + uploadFolder);
						
						it.write(uploadFolder);						
						isImage = true;
					}					
				}			
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		mvo = MemberService.getInstance().infoMember(vo.getMemberId());
		mvo.setEmail(parameter.get("mail"));
		mvo.setPhone(parameter.get("call"));
		
		if(isImage) {
			mvo.setMemberPic("user_image/" + vo.getMemberId() + extension);
		}
		
		MemberService.getInstance().modifyMember(mvo);
		// ?????? ????????? ?????? ???????????? ????????? ?????? ????????? ????????? ??????????????? ?????? ?????? ??????????????????
		
		MemberVO temp = MemberService.getInstance().searchMember(vo.getMemberId());
		mvo.setMemberType(temp.getMemberType());
		
		req.getSession(true).invalidate();		
		System.out.println("?????? ??????");
		
		session = req.getSession(false);		
		req.getSession().setAttribute("member", mvo);		
		
		System.out.println("?????? ??????");

		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		out.println("<script language='javascript'>");
		out.println("window.location.href ='http://localhost:8088/teamProject/myPage.do'");
		out.println("alert('?????? ????????? ?????????????????????.')");
		out.println("</script>");

		out.flush();
		
//		Utils.forward(req, resp, "myPage/myPageModiOutput.tiles");
	}
	
}
