package servlets.refund.dao;

import java.sql.SQLException;

import servlets.refund.dto.RefundDTO;

public interface RefundDAO {
	
	// 1. 회원의 환불계좌 찾기
	RefundDTO selectOne(int memberNo) throws SQLException;
	
	// 2. 환불계좌 삽입
	int insert(RefundDTO dto) throws SQLException;
	
	// 3. 환불계좌 변경
	int update(RefundDTO dto) throws SQLException; 
	
	// 4. 환불계좌 삭제
	int delete(int memberNo) throws SQLException; 
}
