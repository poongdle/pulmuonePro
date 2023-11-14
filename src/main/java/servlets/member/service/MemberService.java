package servlets.member.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Arrays;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import servlets.member.dao.MemberDAOImpl;
import servlets.member.dto.MemberDTO;

public class MemberService {
	
	// 1. 로그인 처리를 위한 MemberDTO 리턴
	public MemberDTO login(String memberId, String pwd) throws SQLException {
				
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
		} finally {
			conn.close();
		}
		
		return dto;
		
	}
	
	
	// 2. 아이디 찾기
	public MemberDTO findId(String name, String tel, String rrnBirthDate, String rrnGenderCode) throws SQLException {
		Connection conn = null;
		MemberDTO dto = null;
		MemberDAOImpl dao = null;
		
		Date birthDate = getBirthDate(rrnBirthDate, rrnGenderCode);
		
		try {
			conn = ConnectionProvider.getConnection();
			dao = new MemberDAOImpl(conn);
			dto = dao.selectOne(name, tel, birthDate);
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		
		return dto;
		
		
	}


	private Date getBirthDate(String rrnBirthDate, String rrnGenderCode) {
		Date birthDate = null;

//		String[] birthIn1800s = {"9","0"};
		String[] birthIn1900s = {"1","2","5","6"};
		String[] birthIn2000s = {"3","4","7","8"};
		
		String birthYear;
		
		if (Arrays.asList(birthIn1900s).contains(rrnGenderCode)) {
			birthYear = "19" + rrnBirthDate.substring(0, 1); 
		} else if (Arrays.asList(birthIn2000s).contains(rrnGenderCode)) {
			birthYear = "20" + rrnBirthDate.substring(0, 1);
		} else {
			birthYear = "18" + rrnBirthDate.substring(0, 1);			
		}		
		
		String birthMonth = rrnBirthDate.substring(2, 3); 
		String birthDay = rrnBirthDate.substring(4, 5);
		
		
		birthDate = Date.valueOf(String.format("\s-\s-\s", birthYear, birthMonth, birthDay));
		
		return birthDate;
	}
	
}
