package com.dev.service;

import java.util.ArrayList;
import java.util.List;

import com.dev.dao.HotelDAO;
import com.dev.vo.HotelVO;

public class HotelService {

	private static HotelService service = null;
	private HotelDAO dao = new HotelDAO();
	private HotelService() {}
	
	public static HotelService getInstance() {
		if(service == null) {
			service = new HotelService();
		}
		
		return service;
	}
	
	public HotelVO getHotelInfo(int hotelId) {
		return dao.getHotelInfo(hotelId);
	}
	
	public List<HotelVO> getRandomTenHotel(){
		
		List<HotelVO> list = new ArrayList<>();
		
		
		return list;
	}
	
}
