package servlets.member.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import servlets.member.dto.MemberDTO;

public interface MemberDAO {
	
	// 1. 회원 로그인 처리
	MemberDTO selectOne(String memberId, String pwd) throws SQLException;
	
	// 2. 회원 가입
	int insert(MemberDTO dto) throws SQLException;
	
	// 3. 회원 탈퇴
	int delete(MemberDTO dto) throws SQLException;
	
	
	// 4. 임시 회원 생성?
	
}
