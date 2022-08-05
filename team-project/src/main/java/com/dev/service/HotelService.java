package com.dev.service;

import java.util.ArrayList;
import java.util.List;

import com.dev.dao.HotelDAO;
import com.dev.dao.HotelPicDAO;
import com.dev.vo.Criteria;
import com.dev.vo.HotelPicVO;
import com.dev.vo.HotelVO;

public class HotelService {

	private static HotelService service = null;
	private HotelDAO dao = new HotelDAO();
	private HotelPicDAO picDAO = new HotelPicDAO();
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
		int size = dao.getHotelTableSize();
		long rand = (long) ((Math.random()*100)%size)+101;
		
		for(int i=0; i<8; i++) {	
			list.add(dao.getHotelInfo((rand+i)%(size)+101));
		}
		
		return list;
	}
	
	public List<List<HotelPicVO>> getMainHotelPic(List<HotelVO> inList){		
		List<List<HotelPicVO>> outList = new ArrayList<>();
		
		for(int i=0; i<inList.size(); i++) {
			outList.add(picDAO.getAllHotelPicPath(inList.get(i).getHotelId()));
		}
		
		return outList;
	}
	
	public List<HotelVO> getSearchedHotelInfo(String keyword, Criteria cri){
		return dao.getSearchHotelInfo(keyword, cri);
	}
	
	public int getSearchedHotelCount(String keyword) {
		return dao.getSearchHotelCount(keyword);
	}

	public List<HotelPicVO> getSelectedHotelImage(int hotelId){
		return picDAO.getAllHotelPicPath(hotelId);
	}
	
	public String getHostName(int hotelId) {
		return dao.getHostName(hotelId);
	}
}
