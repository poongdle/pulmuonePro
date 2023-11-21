package servlets.refund.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import servlets.refund.dto.RefundDTO;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class RefundDAOImpl implements RefundDAO {

	private Connection conn = null;
	
	@Override
	public RefundDTO selectOne(int memberNo) throws SQLException {
		
		String sql = "SELECT acct.* , (SELECT instt_name FROM refundable_instt WHERE instt_code = acct.instt_code) AS instt_name "
				+ " FROM refund_acct acct "
				+ "	WHERE member_no = ? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		RefundDTO dto = null;
		
		String insttCode;
		String acctOwner;
		String acctNum;
		String insttName;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, memberNo);	

			rs = pstmt.executeQuery();

			if (rs.next()) {

				do {
					memberNo = rs.getInt("member_no");
					insttCode = rs.getString("instt_code");
					acctOwner = rs.getString("acct_owner");
					acctNum = rs.getString("acct_num");
					insttName = rs.getString("instt_name");

					dto = RefundDTO.builder().memberNo(memberNo)
											.insttCode(insttCode)
											.acctOwner(acctOwner)
											.acctNum(acctNum)
											.insttName(insttName)
											.build();
				} while (rs.next());
				
			} else {
				System.err.println("[Warn] RefundDAOImpl_selectOne : Invaild memberNo");
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
	public int insert(RefundDTO dto) throws SQLException {
		int rowCount = 0;

		String sql = "INSERT INTO REFUND_ACCT "
				+ " VALUES ( ?, ?, ?, ? ) ";
		PreparedStatement pstmt = null;

		try {
			pstmt = this.conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getMemberNo());
			pstmt.setString(2, dto.getInsttCode());
			pstmt.setString(3, dto.getAcctOwner());
			pstmt.setString(4, dto.getAcctNum());


			rowCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("RefundDAOImpl_insert : Exception");
			e.printStackTrace();
		} finally {
			pstmt.close();
		}

		return rowCount;
	}

	@Override
	public int update(RefundDTO dto) throws SQLException {
		int rowCount = 0;

		String sql = "UPDATE REFUND_ACCT "
				+ " SET instt_code = ?, acct_owner = ?, acct_num = ? "
				+ " WHERE member_no = ? ";
		PreparedStatement pstmt = null;

		try {
			pstmt = this.conn.prepareStatement(sql);

			pstmt.setString(1, dto.getInsttCode());
			pstmt.setString(2, dto.getAcctOwner());
			pstmt.setString(3, dto.getAcctNum());
			pstmt.setInt(4, dto.getMemberNo());


			rowCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("RefundDAOImpl_update : Exception");
			e.printStackTrace();
		} finally {
			pstmt.close();
		}

		return rowCount;
	}

	@Override
	public int delete(int memberNo) throws SQLException {
		int rowCount = 0;

		String sql = "DELETE FROM REFUND_ACCT "
					+ " WHERE member_no = ? ";
		PreparedStatement pstmt = null;

		try {
			pstmt = this.conn.prepareStatement(sql);

			pstmt.setInt(1, memberNo);

			rowCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("RefundDAOImpl_delete : Exception");
			e.printStackTrace();
		} finally {
			pstmt.close();
		}

		return rowCount;
	}

	



}
