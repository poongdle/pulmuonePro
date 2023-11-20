package servlets.refund.dao;

import java.sql.SQLException;

import servlets.refund.dto.RefundDTO;

public interface RefundDAO {
	
	// 1. 회원의 환불계좌 찾기
	RefundDTO selectOne(int memberNo) throws SQLException;
	
}
