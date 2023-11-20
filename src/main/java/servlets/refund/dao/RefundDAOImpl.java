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

}
