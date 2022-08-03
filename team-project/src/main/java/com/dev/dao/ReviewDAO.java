package com.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dev.common.DAO;
import com.dev.vo.ReviewVO;

public class ReviewDAO extends DAO {
	// 특정 호텔의 리뷰 조회하기
	public List<ReviewVO> selectHotelReview(int hotelId) {
		List<ReviewVO> reviewList = new ArrayList<>();

		String sql = "select * from review where hotel_id = ?";
		connect();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hotelId);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReviewVO vo = new ReviewVO();
				vo.setReviewId(rs.getInt("review_id"));
				vo.setMemberId(rs.getString("member_id"));
				vo.setHotelId(rs.getInt("hotel_id"));
				vo.setReviewContents(rs.getString("review_contents"));
				vo.setReviewDate(rs.getDate("review_date"));
				vo.setReviewRate(rs.getFloat("review_rate"));

				reviewList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return reviewList;
	}

	// 특정 호텔의 총 리뷰 개수를 반환하는 함수입니다.
	public int countHotelReview(int hotelId) {
		int result = 0;

		String sql = "select count(*) from review where hotel_id = ?";
		connect();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hotelId);
			
			rs = pstmt.executeQuery();
			if(rs.next())
				result = rs.getInt("count(*)");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		System.out.println(result);
		return result;
	}
}
