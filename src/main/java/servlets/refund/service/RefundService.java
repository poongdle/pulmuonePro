package servlets.refund.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

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
	
	
	// 2. 환불계좌 등록
	public int writeRefundAcct(RefundDTO dto) {
		Connection conn = null;
		RefundDAOImpl dao = null;
		
		int rowCount = 0;
	
		
		try {
			conn = ConnectionProvider.getConnection();
			dao = new RefundDAOImpl(conn);
			rowCount = dao.insert(dto);
			
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		
		return rowCount;
	}

	// 3. 환불계좌 변경
	public int modifyRefundAcct(RefundDTO dto) {
		Connection conn = null;
		RefundDAOImpl dao = null;
		
		int rowCount = 0;
	
		
		try {
			conn = ConnectionProvider.getConnection();
			dao = new RefundDAOImpl(conn);
			rowCount = dao.update(dto);
			
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		
		return rowCount;
	}

	// 4. 환불 계좌 삭제
	public int deleteRefundAcct(int memberNo) {
		Connection conn = null;
		RefundDAOImpl dao = null;
		
		int rowCount = 0;
	
		
		try {
			conn = ConnectionProvider.getConnection();
			dao = new RefundDAOImpl(conn);
			rowCount = dao.delete(memberNo);
			
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		
		return rowCount;
	}
}
