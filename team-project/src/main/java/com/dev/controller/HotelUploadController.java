package com.dev.controller;

import java.io.File;
import java.io.IOException;
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
import com.dev.common.Utils;
import com.dev.service.HotelService;
import com.dev.vo.HotelPicVO;
import com.dev.vo.HotelVO;

public class HotelUploadController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		String charset = "UTF-8";
		String root = req.getSession().getServletContext().getRealPath("/");
		
		Map<String, String> parameter = new HashMap<>();
		req.setCharacterEncoding(charset);

		// Expect Result
		// D:\dev\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\team-project
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
		HotelService service = HotelService.getInstance();
		
		int currVal = service.getCurrentSequence();
		
		try {
			List<FileItem> items = fileUpload.parseRequest(req);

			for (FileItem it : items) {
				
				if (it.isFormField()) {
					// 이미지가 아닌 다른 부분이 들어오면 이 부분이 실행된다.!
					// 즉, 텍스트로 된 파라미터들
					parameter.put(it.getFieldName(), it.getString(charset));

				} else {
					// Image가 들어오면 이 부분이 실행된다! 마지막에 이미지가 들어올거야 아마도		
					if (it.getSize() > 0) {						
						int index = it.getName().lastIndexOf(separator);
						fileName = getCurrentTime() + it.getName().substring(index + 1);
						System.out.println(fileName);
						
						uploadFolder = new File(file + separator + parameter.get("hotel_name") + currVal);						
						if(!uploadFolder.exists()) {
							try {
								uploadFolder.mkdir();
								
							}catch(Exception e) {
								e.printStackTrace();
							}							
						}
											
						it.write(new File(uploadFolder + separator + fileName));
						
					} else { // 만약 사진을 넣지 않는다면!
							 // 기본사진으로 세팅한다
						
					}									
				}						
			}
			hvo.setHotelId(currVal);
			hvo.setHotelName(parameter.get("hotel_name"));
			hvo.setHotelLocation(parameter.get("hotel_location"));
			hvo.setHotelDesc(parameter.get("hotel_desc"));
			hvo.setHotelPrice(Integer.parseInt(parameter.get("hotel_price")));
			hvo.setMemberId(parameter.get("member_id"));
			hvo.setHotelType(parameter.get("hotel_type"));
			hvo.setHotelType(parameter.get("maxP"));
			
			hvo.setHotelOptionKitchen(Integer.parseInt(parameter.getOrDefault("hotel_option_kitchen", "0")));
			hvo.setHotelOptionParking(Integer.parseInt(parameter.getOrDefault("hotel_option_parking", "0")));
			hvo.setHotelOptionSwim(Integer.parseInt(parameter.getOrDefault("hotel_option_swim", "0")));
			hvo.setHotelOptionWifi(Integer.parseInt(parameter.getOrDefault("hotel_option_WIFI", "0")));
			hvo.setHotelOptionWpet(Integer.parseInt(parameter.getOrDefault("hotel_option_wPet", "0")));
								
			pvo.setHotelId(currVal);
			pvo.setPath("hotel_image/" + parameter.get("hotel_name") + currVal);
			pvo.setName("/" + fileName.replace(separator, "/"));
			
			System.out.println(pvo.getPath());
			System.out.println(pvo.getName());
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		HotelService.getInstance().insertNewHotel(hvo, pvo);		
		Utils.forward(req, resp, "main.do");
	}
	
	private String getCurrentTime() {
		LocalDateTime now = LocalDateTime.now();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd-HH-mm-ss"); 
		String formatedNow = now.format(formatter);
		
		return formatedNow;		
	}
	
	

}
