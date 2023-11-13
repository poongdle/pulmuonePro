package servlets.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import servlets.member.dao.MemberDAOImpl;
import servlets.member.dto.MemberDTO;

public class MemberLoginService {
	
	// 1. 로그인 처리를 위한 MemberDTO 리턴
	public MemberDTO login(String memberId, String pwd) {
				
		Connection conn = null;
		MemberDTO dto = null;
		MemberDAOImpl dao = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			dao = new MemberDAOImpl(conn);
			dto = dao.selectOne(memberId, pwd);
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
		
	}
	
}
