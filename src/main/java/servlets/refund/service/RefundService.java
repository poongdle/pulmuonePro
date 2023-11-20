package servlets.refund.service;

import java.sql.Connection;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import servlets.refund.dao.RefundDAOImpl;
import servlets.refund.dto.RefundDTO;

public class RefundService {
	public RefundDTO getRefundAcctInfo(int memberNo) {
		Connection conn = null;
		RefundDAOImpl dao = null;
		RefundDTO dto = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			dao = new RefundDAOImpl(conn);
			dto = dao.selectOne(memberNo);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		
		return dto;
	}
	
}
