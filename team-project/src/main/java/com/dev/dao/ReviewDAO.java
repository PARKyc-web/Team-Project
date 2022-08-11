package com.dev.dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dev.common.DAO;
import com.dev.vo.ReviewVO;
import com.dev.vo.MemberVO;
import com.dev.vo.ReviewJoinReservationJoinHotelVO;

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
		
		return result;
	}
	
	// 특정 호텔(hotelId)의 별점의 평균을 구하는 함수입니다.
	// 소수점 둘째 자리에서 반올림됩니다.
	public float avgHotelReview(int hotelId) {
		float avg = 0;
		
		String sql = "select round(avg(review_rate), 2) AS star from review where hotel_id = ?";
		connect();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hotelId);
			
			rs = pstmt.executeQuery();
			if(rs.next())
				avg = rs.getFloat("star");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return avg;
	}
	
	// 내가 쓴 리뷰 조회 : yj
		public List<ReviewJoinReservationJoinHotelVO> getReviewList(String memberId) {
			String sql = "SELECT re.member_id, re.review_date, re.review_rate, re.review_contents, hr.in_date, hr.out_date, hr.hotel_name "
					+ "FROM review re JOIN (SELECT h.hotel_id, h.hotel_name, in_date, out_date "
					+ "                    FROM hotel h JOIN reservation r "
					+ "                    ON h.hotel_id = r.hotel_id) hr "
					+ "ON (hr.hotel_id = re.hotel_id) "
					+ "where member_id = ?";
			
			
			List<ReviewJoinReservationJoinHotelVO> list = new ArrayList<>();
			connect();
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					ReviewJoinReservationJoinHotelVO vo = new ReviewJoinReservationJoinHotelVO();
					
					vo.setHotelName(rs.getString("hotel_name"));
					vo.setReviewDate(rs.getDate("review_date"));
					vo.setInDate(rs.getDate("in_date"));
					vo.setOutDate(rs.getDate("out_date"));
					vo.setReviewRate(rs.getFloat("review_rate"));
					vo.setReviewContents(rs.getString("review_contents"));
					
					list.add(vo);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return list;
		}
		//호텔+예약정보
		public List<ReviewJoinReservationJoinHotelVO> hotelReservationList(String memberId) {
			List<ReviewJoinReservationJoinHotelVO> list = new ArrayList<>();

			String sql = "SELECT h.hotel_id, h.hotel_name, in_date, out_date, r.member_id "
					+ "FROM hotel h JOIN reservation r  "
					+ "ON h.hotel_id = r.hotel_id "
					+ "WHERE r.member_id = ? ";
			connect();

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);

				rs = pstmt.executeQuery();
				while (rs.next()) {
					ReviewJoinReservationJoinHotelVO vo = new ReviewJoinReservationJoinHotelVO();
					vo.setMemberId(rs.getString("member_id"));
					vo.setHotelId(rs.getInt("hotel_id"));
					vo.setHotelName(rs.getString("hotel_name"));
					vo.setInDate(rs.getDate("in_date"));
					vo.setOutDate(rs.getDate("out_date"));

					list.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return list;
		}
		
		//호텔+예약정보에다가  +할 리뷰의 내용들!
		public List<ReviewJoinReservationJoinHotelVO> reviewList(String memberId) {
			List<ReviewJoinReservationJoinHotelVO> list = new ArrayList<>();

			String sql = "SELECT * FROM review WHERE member_id = ? order by review_date desc";
			connect();

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);

				rs = pstmt.executeQuery();
				while (rs.next()) {
					ReviewJoinReservationJoinHotelVO vo = new ReviewJoinReservationJoinHotelVO();
					vo.setMemberId(rs.getString("member_id"));
					vo.setReviewRate(rs.getFloat("review_rate"));
					vo.setReviewDate(rs.getDate("review_date"));
					vo.setReviewContents(rs.getString("review_contents"));
					list.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return list;
		}

		//리뷰쓰기 : yj
		public void insertReview(ReviewVO vo) {
			String sql = "insert into review values(hotel_seq.nextval, ?, ?, ?, sysdate, ?) ";
			connect();
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getMemberId());
				pstmt.setInt(2, vo.getHotelId());
				pstmt.setString(3, vo.getReviewContents());
				pstmt.setFloat(4, vo.getReviewRate());
				
				int r = pstmt.executeUpdate();
				System.out.println(r + "건 입력됨");
			
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				disconnect();
			}
		}
		
		//리뷰써야할 숙박내역 불러오기 : yj
		public ReviewVO searchReservation(int hotelId) {
			String sql = "select * from reservation where hotel_id = ? ";
			connect();
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, hotelId);
				rs = pstmt.executeQuery();
			
					ReviewVO vo = new ReviewVO();
					vo.setHotelId(rs.getInt("hotel_id"));
					vo.setMemberId(rs.getString("member_name"));
					vo.setReviewContents(rs.getString("review_contents"));
					vo.setReviewDate(rs.getDate("review_date"));
					vo.setReviewRate(rs.getFloat("revew_rate"));

					return vo;
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return null;

		}
		
		public List<ReviewJoinReservationJoinHotelVO> getWritredReivew(String memberId) {
						
			List<ReviewJoinReservationJoinHotelVO> list = new ArrayList<>();			
			try {
				connect();
				
				String sql = "SELECT r.review_id, h.hotel_name, r.member_id, r.review_contents, "
						   + "TO_CHAR(r.review_date, 'yyyy-MM-dd') review_date, r.review_rate "
						   + "FROM review r JOIN hotel h "
						   + "ON r.hotel_id = h.hotel_id "
						   + "WHERE r.member_id = ? order by r.review_date desc ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, memberId);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ReviewJoinReservationJoinHotelVO vo = new ReviewJoinReservationJoinHotelVO();
					
					vo.setHotelName(rs.getString("hotel_name"));
					vo.setMemberId(rs.getString("member_id"));
					vo.setReviewContents(rs.getString("review_contents"));
					vo.setReviewDate(Date.valueOf(rs.getString("review_date")));
					vo.setReviewRate(rs.getFloat("review_rate"));
					vo.setReviewId(rs.getInt("review_id"));
					list.add(vo);
				}				
				
			}catch(SQLException e) {
				e.printStackTrace();
				
			}finally {
				disconnect();
			}
			
			return list;
		}
		
		public void deleteReview(int reviewId) {
			String sql = "delete from review where review_id = ?";
			connect();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, reviewId);
				
				int result = pstmt.executeUpdate();
				if(result > 0) {
					System.out.println("나의 리뷰가 " + result + "건 삭제되었습니다.");
				} else {
					System.out.println("나의 리뷰 삭제에 실패하였습니다.");
				}
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
		}
}
