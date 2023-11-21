package servlets.member.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Random;

import javax.naming.NamingException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import servlets.member.dao.MemberDAOImpl;
import servlets.member.dto.MemberDTO;
import servlets.refund.dao.RefundDAOImpl;

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
			JdbcUtil.close(conn);
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
			JdbcUtil.close(conn);
		}
		
		return dto;		
	}
	
	// 3. 입력받은 아이디를 가진 회원 계정 정보 반환
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
			JdbcUtil.close(conn);
		}
		
		return dto;
	}

	// 4. 비밀번호 변경
	public int changePwd(String memberId, String pwd, String newPwd) throws SQLException {
		Connection conn = null;
		MemberDAOImpl dao = null;
		MemberDTO dto = null;
		
		int rowCount = 0;
		
		try {
			conn = ConnectionProvider.getConnection();
			dao = new MemberDAOImpl(conn);
			dto = dao.selectOne(memberId, pwd);
			
			if (dto != null) {
				int memberNo = dto.getMemberNo();
				rowCount = dao.updatePwd(memberNo, newPwd);
				
			} else {
				System.out.println("회원번호와 비밀번호가 일치하지 않습니다.");
			}
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		
		return rowCount;
	}

	// 5. 회원가입
	public int signup(MemberDTO dto) throws SQLException {
		Connection conn = null;
		MemberDAOImpl dao = null;
		
		int rowCount = 0;
		
		String invCode = getRandomInvCode();
		dto.setInvCode(invCode);
		
		try {
			conn = ConnectionProvider.getConnection();
			dao = new MemberDAOImpl(conn);
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
	
	
	// 6. 회원 탈퇴
	public int quit(int memberNo) {
		Connection conn = null;
		MemberDAOImpl dao = null;
		
		int rowCount = 0;
		
		try {
			conn = ConnectionProvider.getConnection();
			dao = new MemberDAOImpl(conn);
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
	
	// 7. 환불계좌 등록
	public int writeRefundAcct(int memberNo, String insttCode, String acctOwner, String acctNum) {
		Connection conn = null;
		RefundDAOImpl dao = null;
		
		int rowCount = 0;
		
		String invCode = getRandomInvCode();
//		dto.setInvCode(invCode);
		
		try {
			conn = ConnectionProvider.getConnection();
			dao = new RefundDAOImpl(conn);
//			rowCount = dao.insert(dto);
			
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		
		return rowCount;
	}
	
	
	
	private String getRandomInvCode() {
		String charRange = "abcdefgehijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		int charRangeLength = charRange.length();
		int invCodeLength = 5;
		int randomIndex;
		
		StringBuilder invCodeBuilder = new StringBuilder(invCodeLength);
		for (int i = 0; i < invCodeLength; i++) {
			randomIndex = (int) ( Math.random() * (charRangeLength + 1) );
			invCodeBuilder.append(charRange.charAt(randomIndex));
		}
		
		String invCode = invCodeBuilder.toString();
		
		return invCode;
	}


	// 주민등록번호 형식으로 전달받은 값을  sql.Date 형식으로 변환
	public Date getBirthDate(String rrnBirthDate, String rrnGenderCode) {
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


	public MemberDTO isExistingInvCode(String invCode) throws SQLException {
		Connection conn = null;
		MemberDAOImpl dao = null;
		MemberDTO dto = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			dao = new MemberDAOImpl(conn);
			dto = dao.selectOneWithInvCode(invCode);
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		
		return dto;
	}











}
