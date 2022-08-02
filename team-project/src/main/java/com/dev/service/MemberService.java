package com.dev.service;

import com.dev.dao.MemberDAO;
import com.dev.vo.HotelVO;
import com.dev.vo.MemberVO;
import com.dev.vo.ReviewVO;
import com.dev.vo.WishListVO;

public class MemberService {

	private static MemberService instance = new MemberService();
	MemberDAO dao = new MemberDAO();
	
	private MemberService() {}
	public static MemberService getInstance() {
		return instance;
	}
	//회원정보수정
	public void modifyMember(MemberVO vo) {
		dao.updateMember(vo);
		
	}
	
	//내가 쓴 리뷰 조회
	public void ReviewList(ReviewVO vo) {
		dao.getReviewList(vo);
	}
	//나의 숙박내역
	public void HotelList(HotelVO vo) {
		dao.getHotelList(vo);
	}
			
	//나의 숙박위시리스트
	public void WishList(WishListVO vo) {
		dao.getWishList(vo);
	}
	
	public void addMember(MemberVO vo) {
		dao.insertMember(vo);
	}
}
