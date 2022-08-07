package com.dev.controller;

import java.io.File;
import java.io.IOException;
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

public class HotelUploadController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Hotel-Upload RUN");
		String charset = "UTF-8";
		String root = req.getSession().getServletContext().getRealPath("/");
		Map<String, String> parameter = new HashMap<>();

		req.setCharacterEncoding(charset);

		// Expect Result
		// D:\dev\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\team-project
		File file = new File("D:\\dev\\pic_test"); // root + 위치
		int max_size = 1024 * 1024; // 1024KB >> 1MB , 1024를 한번 더 곱하면 10MB

		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		fileItemFactory.setRepository(file);
		fileItemFactory.setSizeThreshold(max_size);

		ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);

		try {
			List<FileItem> items = fileUpload.parseRequest(req);

			for (FileItem it : items) {

				if (it.isFormField()) {
					// 이미지가 아닌 다른 부분이 들어오면 이 부분이 실행된다.!
					// 즉, 텍스트로 된 파라미터들
					System.out.println("Parameter Name : " + it.getFieldName());
					System.out.println("Parameter Value : " + it.getString(charset));

					parameter.put(it.getFieldName(), it.getString());

				} else {
					System.out.println("ELSE PART!!"); // Image가 들어오면 이 부분이 실행된다!
					System.out.println("Parameter Name : " + it.getFieldName());
					System.out.println("File name : " + it.getName());
					System.out.println("File size : " + it.getSize());

					if (it.getSize() > 0) {
						String separator = File.separator;
						int index = it.getName().lastIndexOf(separator);

						String fileName = it.getName().substring(index + 1);

						System.out.println(fileName);

						File uploadFile = new File(file + separator + fileName);

						System.out.println(uploadFile);
						it.write(uploadFile);

					} else { // 만약 사진을 넣지 않는다면!
						// 기본사진으로 세팅한다

					}
				}
				// 여기서 VO를 만들어줘야함.
				// VO는 2개 HotelVO, HotelPicVO

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
