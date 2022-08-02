package com.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dev.common.DAO;
import com.dev.vo.HotelVO;
import com.dev.vo.MemberVO;
import com.dev.vo.ReviewVO;
import com.dev.vo.WishListVO;

public class MemberDAO extends DAO {

	// 수정.
	public void updateMember(MemberVO vo) {
		System.out.println("run updateMember");
		String sql = "UPDATE member-info SET phone = ?, email = ?, member_pic = ? "
				   + "WHERE id = ?"; 

		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPhone());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getMemberPic());
			pstmt.setString(4, vo.getMemberId());
			int r = pstmt.executeUpdate();
			System.out.println(r + "님의 정보가 수정되었습니다.");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}

	// 내가 쓴 리뷰 조회
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		String sql = "select hotel_id, review_date, review_content from review order by 1";
		List<ReviewVO> list = new ArrayList<>();
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo.setHotelId(rs.getString("hotelId"));
				vo.setReviewDate(rs.getString("reviewDate"));
				vo.setReviewContents(rs.getString("reviewContent"));

				list.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

	// 숙박리스트 출력
	public List<HotelVO> getHotelList(HotelVO vo) {
		String sql = "select * from reservation order by 1";
		List<HotelVO> list = new ArrayList<>();
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo.setHotelId(rs.getInt("hotelId"));				
				vo.setHotelPrice(rs.getInt("hotelPrice"));

				list.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;

	}

	// 나의 숙박위시리스트
	public List<WishListVO> getWishList(WishListVO vo) {
		String sql = "select hotel_id, hotel_name from hotel order by 1";
		List<WishListVO> list = new ArrayList<>();
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo.setHotelId(rs.getString("hotelId"));

				list.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	//멤버 등록
	public void insertMember(MemberVO vo) {
		String sql = "insert into member_login values(?,?,?,0)";
		connect();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMemberId());
			pstmt.setString(2, vo.getMemberPassword());
			pstmt.setString(3, vo.getMemberType());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건 입력");
			
			insertInfo(vo);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	//멤버 세부정보
	public void insertInfo(MemberVO vo) {
		String sql = "insert into member_info values('이거어케함','?','?','?','?',sysdate,'사진?')";
		connect();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMemberId());
			pstmt.setString(2, vo.getMemberName());
			pstmt.setInt(3, vo.getMemberAge());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getEmail());
			int r = pstmt.executeUpdate();
			System.out.println("상세정보" + r + "건 입력");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}

}
