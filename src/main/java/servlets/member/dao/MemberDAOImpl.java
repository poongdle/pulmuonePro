package servlets.member.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import servlets.member.dto.MemberDTO;


@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class MemberDAOImpl implements MemberDAO {

	private Connection conn = null;
	
	
	@Override
	public MemberDTO selectOne(String memberId, String pwd) throws SQLException {
		
		String sql = "SELECT * " 
				+ " FROM member "
				+ " WHERE member_id = ? AND pwd = ? ";
		
		System.out.println(sql);
		System.out.println(memberId);
		System.out.println(pwd);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;


		MemberDTO dto = null;

		int memberNo;
//		String memberId;
//		String pwd;
		String name;
//		String tel;
//		String email;
//		Date birthdate;
//		String invCode;
//		int interestCode1;
//		int interestCode2;
//		int interestCode3;
//		String naverToken;
//		String kakaoToken;
//		int adApproval;
//		int marketingApproval;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, memberId);	
			pstmt.setString(2, pwd);
		
			rs = pstmt.executeQuery();

			if (rs.next()) {

				do {
					memberNo = rs.getInt("member_no");
					name = rs.getString("name");
					
					
					dto = MemberDTO.builder().memberNo(memberNo).name(name).build();
				} while (rs.next());
				
			} else {
				System.out.println("MemberDAOImpl_selectOne : Invaild memberId / pwd");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		
		return dto;
	}

	@Override
	public int insert(MemberDTO dto) throws SQLException {
		int rowCount = 0;

		String sql = "INSERT INTO member "
				+ " VALUES ( seq_member.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = this.conn.prepareStatement(sql);

			pstmt.setString(1, dto.getMemberId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setDate(6, dto.getBirthdate());
			pstmt.setString(7, dto.getInvCode());
			pstmt.setInt(8, dto.getInterestCode1());
			pstmt.setInt(9, dto.getInterestCode2());
			pstmt.setInt(10, dto.getInterestCode3());
			pstmt.setString(11, dto.getNaverToken());
			pstmt.setString(12, dto.getKakaoToken());
			pstmt.setInt(13, dto.getAdApproval());
			pstmt.setInt(14, dto.getMarketingApproval());

			rowCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmt.close();
		}

		return rowCount;


	}
	
	@Override
	public int delete(MemberDTO dto) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
