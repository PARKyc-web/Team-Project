package com.dev.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
	
	public int getHotelTableSize() {
		return dao.getHotelTableSize();
	}
	
	public List<HotelVO> getRandomTenHotel(){
		
		Set<HotelVO> set = new HashSet();
		List<HotelVO> list = new ArrayList<>();
		int size = dao.getHotelTableSize();		
		
		while(set.size() < 8) {
			long rand = (long) ((Math.random()*1000)%size)+101;
			HotelVO vo = dao.getHotelInfo(rand);
						
			if(vo == null ||set.contains(vo)) {
				continue;
			}			
			set.add(vo);
			list.add(vo);
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
	
	
	public void insertNewHotel(HotelVO hvo, HotelPicVO pvo) {
		dao.insertNewHotel(hvo);
		picDAO.insertNewHotelPic(pvo);
	}
	
	public int getCurrentSequence() {
		return dao.sequenceCurval();
	}
}
