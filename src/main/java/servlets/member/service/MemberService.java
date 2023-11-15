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
	
	
	// 2. NICE 인증 대체용. 회원 정보 입력받아서 계정 정보 반환
	public MemberDTO authorizeNICE(String name, String tel, String rrnBirthDate, String rrnGenderCode) throws SQLException {
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
	
	// 3. 입력받은 아이디를 가진 회원 계정의 개수를 반환
	public MemberDTO isExistingId(String memberId) throws SQLException {
		Connection conn = null;
		MemberDAOImpl dao = null;
		MemberDTO dto = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			dao = new MemberDAOImpl(conn);
			dto = dao.selectOne(memberId);
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		
		return dto;
	}
	

	// 주민등록번호 형식으로 전달받은 값을  sql.Date 형식으로 변환
	private Date getBirthDate(String rrnBirthDate, String rrnGenderCode) {
		Date birthDate = null;

		System.out.println(rrnBirthDate + "-"+ rrnGenderCode);
//		String[] birthIn1800s = {"9","0"};
		String[] birthIn1900s = {"1","2","5","6"};
		String[] birthIn2000s = {"3","4","7","8"};
		
		String birthYear;
		
		if (Arrays.asList(birthIn1900s).contains(rrnGenderCode)) {
			birthYear = "19" + rrnBirthDate.substring(0, 2); 
		} else if (Arrays.asList(birthIn2000s).contains(rrnGenderCode)) {
			birthYear = "20" + rrnBirthDate.substring(0, 2);
		} else {
			birthYear = "18" + rrnBirthDate.substring(0, 2);			
		}		
		
		String birthMonth = rrnBirthDate.substring(2, 4); 
		String birthDay = rrnBirthDate.substring(4, 6);

		birthDate = Date.valueOf(String.format("%s-%s-%s", birthYear, birthMonth, birthDay));
		
		return birthDate;
	}


}
