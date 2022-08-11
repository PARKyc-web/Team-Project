package com.dev.service;

import com.dev.dao.HotelDAO;
import com.dev.dao.MemberDAO;
import com.dev.vo.MemberVO;

public class MemberService {

	private static MemberService instance = new MemberService();
	MemberDAO dao = new MemberDAO();
	HotelDAO hdao = new HotelDAO();
	
	private MemberService() {}
	public static MemberService getInstance() {
		return instance;
	}
	
	//회원정보수정
	public void modifyMember(MemberVO vo) {
		dao.updateMember(vo);		
	}
	
	//개인정보전체보기
	public MemberVO infoMember(String memberId) {
		return dao.searchMember(memberId);
	}
	
	//회원가입(하영)
	public void addMember(MemberVO vo) {
		dao.insertMember(vo);
		dao.insertInfo(vo);
	}
	
	//회원조회-로그인(하영)
	public MemberVO searchMember(String id) {
		return dao.searchLoginMember(id);
	}
	
	//회원탈퇴(하영)
	public void deleteMember(String id) {
		dao.deleteMember(id);
		hdao.disabledHotel(id);		
	}
	
	//아이디중복체크(하영)
	public void checkId(String id, MemberVO vo) {
		if(dao.checkId(id) != 1) {
			addMember(vo);
		}else{
			System.out.println("중복아이디");
		};
	}

	
}
