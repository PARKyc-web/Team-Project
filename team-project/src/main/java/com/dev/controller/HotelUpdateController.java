package com.dev.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dev.common.Controller;
import com.dev.service.HotelService;
import com.dev.vo.HotelPicVO;
import com.dev.vo.HotelVO;

public class HotelUpdateController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String charset = "UTF-8";
		String root = req.getSession().getServletContext().getRealPath("/");
		
		Map<String, String> parameter = new HashMap<>();
		req.setCharacterEncoding(charset);
		
		File file = new File(root + "\\hotel_image"); // root + 위치
		int max_size = 1024 * 1024 * 1024; // 1024KB >> 1MB >> 10MB, 1024를 한번 더 곱하면 100MB

		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		fileItemFactory.setRepository(file);
		fileItemFactory.setSizeThreshold(max_size);

		ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
				
		File uploadFolder = null;
		String fileName = "";
		String separator = File.separator;
		
		HotelVO hvo = new HotelVO();
		HotelPicVO pvo = new HotelPicVO();
		
		try {
			List<FileItem> items = fileUpload.parseRequest(req);
			
			for(FileItem it : items) {
				if (it.isFormField()) {
					parameter.put(it.getFieldName(), it.getString(charset));

				}else {
					
					if (it.getSize() > 0) {						
						int index = it.getName().lastIndexOf(separator);
						fileName = getCurrentTime() + it.getName().substring(index + 1);
						uploadFolder = new File(file + separator + parameter.get("hotel_name") + parameter.get("hotel_id"));
						System.out.println(fileName);						
											
						it.write(new File(uploadFolder + separator + fileName));
						pvo.setHotelId(Integer.parseInt(parameter.get("hotel_id")));
						pvo.setPath("hotel_image/" + parameter.get("hotel_name") + parameter.get("hotel_id"));
						pvo.setName("/" + fileName.replace(separator, "/"));
						
						System.out.println(pvo.getPath());
						System.out.println(pvo.getName());
						
					}else {
						
					}					
				}
			}			
			hvo.setHotelId(Integer.parseInt(parameter.get("hotel_id")));
			hvo.setHotelPrice(Integer.parseInt(parameter.get("hotel_price")));
			hvo.setMaxP(Integer.parseInt(parameter.get("maxP")));
			hvo.setHotelDesc(parameter.get("hotel_desc"));
			hvo.setHotelType(parameter.get("hotel_type"));			
			hvo.setHotelName(parameter.get("hotel_name"));
			hvo.setHotelLocation(parameter.get("hotel_location"));
			
			hvo.setHotelOptionKitchen(Integer.parseInt(parameter.getOrDefault("hotel_option_kitchen", "0")));
			hvo.setHotelOptionParking(Integer.parseInt(parameter.getOrDefault("hotel_option_parking", "0")));
			hvo.setHotelOptionSwim(Integer.parseInt(parameter.getOrDefault("hotel_option_swim", "0")));
			hvo.setHotelOptionWifi(Integer.parseInt(parameter.getOrDefault("hotel_option_WIFI", "0")));
			hvo.setHotelOptionWpet(Integer.parseInt(parameter.getOrDefault("hotel_option_wPet", "0")));			
			
			HotelService.getInstance().hotelUpdate(hvo);
			if(pvo.getHotelId() != 0) {
				System.out.println("사진등록!");
				HotelService.getInstance().hotelPicUpdate(pvo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		out.println("<script language='javascript'>");
		out.println("window.location.href ='http://localhost:8088/teamProject/main.do'");
		out.println("alert('성공적으로 정보를 수정하였습니다.')");
		out.println("</script>");
		out.flush();		
	}
	
	private String getCurrentTime() {
		LocalDateTime now = LocalDateTime.now();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss"); 
		String formatedNow = now.format(formatter);
		
		return formatedNow;		
	}
}
