package com.dev.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
					parameter.put(it.getFieldName(), it.getString(charset));
					
				}else {					
					if(it.getSize() > 0 ) {
						int index = it.getName().lastIndexOf(separator);
						fileName = it.getName().substring(index + 1);						
						
						extension = fileName.substring(fileName.lastIndexOf("."));
						
						uploadFolder = new File(file + separator + parameter.get("id") + extension);		
						
						System.out.println("uploadFolder : " + uploadFolder);
						
						it.write(uploadFolder);						
						isImage = true;
					}					
				}			
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		mvo = MemberService.getInstance().infoMember(parameter.get("id"));
		mvo.setEmail(parameter.get("mail"));
		mvo.setPhone(parameter.get("call"));
		
		if(isImage) {
			mvo.setMemberPic("user_image/" + parameter.get("id") + extension);
		}
		
		MemberService.getInstance().modifyMember(mvo);
		// 현재 세션에 있는 데이터가 있어서 멤버 사진의 경로가 안바뀌는거 같음 이거 변경해줘야함
		
		
		
		MemberVO temp = MemberService.getInstance().searchMember(parameter.get("id"));
		mvo.setMemberType(temp.getMemberType());
		
		req.getSession(true).invalidate();		
		System.out.println("세선 삭제");
		
		HttpSession session = req.getSession(false);		
		req.getSession().setAttribute("member", mvo);		
		
		System.out.println("세션 생성");
		
		Utils.forward(req, resp, "myPage/myPageModiOutput.tiles");	
	}
	
}
