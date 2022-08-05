package com.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dev.common.DAO;
import com.dev.vo.MemberVO;
import com.dev.vo.ReviewVO;

public class MemberDAO extends DAO {

	// 수정.
	// 마이페이지 - 개인정보수정 : yj
	public void updateMember(MemberVO vo) {
		System.out.println("run updateMember");

		String sql = "UPDATE member_info SET phone = ?, email = ?, member_pic = ? "
				   + "WHERE member_id = ?"; 

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

	//회원탈퇴 (member_able만 1로수정)
	public void deleteMember(String id) {
		System.out.println("run deleteMember");
		String sql = "UPDATE member_login SET member_able=1 WHERE member_id = ?"; 

		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			int r = pstmt.executeUpdate();
			System.out.println(r + "님이 탈퇴되었습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	//탈퇴회원 로그인 제한 
	public void searchDeleteMember(String id) {
		System.out.println("run deleteMember");
		String sql = "select * from member_login where member_able=1"; 

		connect();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				
			}
			
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
			if (rs.next()) {
				System.out.println(vo.getMemberId()+ "님의 정보가 수정되었습니다.");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

	
	//마이페이지 정보 전체조회 : yj
		public MemberVO searchMember(String memberId) {
			String sql = "select * from member_info where member_id = ? ";
			connect();
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					MemberVO vo = new MemberVO();
					vo.setMemberId(rs.getString("member_id"));
					vo.setMemberName(rs.getString("member_name"));
					vo.setMemberAge(rs.getInt("member_age"));
					vo.setPhone(rs.getString("phone"));
					vo.setEmail(rs.getString("email"));
					vo.setMemberType(rs.getString("member_type"));
					vo.setSignInDate(rs.getString("sign_in_date"));
					vo.setMemberPic(rs.getString("member_pic"));

					return vo;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return null;

		}

		//멤버 등록(하영)
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
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
		}

		//멤버 세부정보 등록(하영)
		public void insertInfo(MemberVO vo) {
			String sql = "insert into member_info values(?, ?, ?, ?, ?, sysdate,'DEFAULT- AFERT MUSET CHANGE TO DEFAULT PIC PATH')";
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
		
		//멤버 검색(하영)
		public MemberVO searchLoginMember(String id) {
			String sql = "select * from member_login where member_id = '" + id + "'";
			connect();
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()) {
					MemberVO vo = new MemberVO();
					vo.setMemberId(rs.getString("member_id"));
					vo.setMemberPassword(rs.getString("member_password"));
					return vo;
				}	
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return null;
		}
		
		//아이디 중복체크 ,,보류
		public int checkId(String id) {
			String sql = "select * from member_login where member_id=?";
			int result = 0;
			connect();
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					result = 1;
				}
		
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return result;
		}
	
		
}
