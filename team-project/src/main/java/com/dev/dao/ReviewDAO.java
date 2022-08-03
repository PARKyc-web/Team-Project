package com.dev.dao;

import java.util.ArrayList;
import java.util.List;

import com.dev.common.DAO;
import com.dev.vo.ReviewVO;

public class ReviewDAO extends DAO{
	// 특정 호텔의 리뷰 조회하기
	public ReviewVO selectHotelReview(int hotelId) {
		ReviewVO vo = new ReviewVO();
		
		String sql = "select * from review where hotel_id = ?";
		connect();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hotelId);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
//				vo.setReviewId(sql);
//				vo.setMemberId(sql);
//				vo.setHotelId(rs.getString("hotel_id"));
//				vo.setReviewContents(sql);
//				vo.setReviewDate(rs.getDate(""));
//				vo.setReviewRate(rs.getFloat(""));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return vo;
	}
}
