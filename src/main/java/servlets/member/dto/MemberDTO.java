package servlets.member.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class MemberDTO {

	private int memberNo;
	private String memberId;
	private String pwd;
	private String name;
	private String tel;
	private String email;
	private Date birthdate;
	private String invCode;
	private int interestCode1;
	private int interestCode2;
	private int interestCode3;
	private String naverToken;
	private String kakaoToken;
	private int adApproval;
	private int marketingApproval;
	
//	"MEMBER_NO" NUMBER, 
//	"MEMBER_ID" VARCHAR2(15 BYTE), 
//	"PWD" VARCHAR2(20 BYTE), 
//	"NAME" NVARCHAR2(30), 
//	"TEL" NVARCHAR2(13), 
//	"EMAIL" VARCHAR2(100 BYTE), 
//	"BIRTHDATE" DATE, 
//	"INV_CODE" CHAR(5 BYTE), 
//	"INTEREST_CODE1" NUMBER(1,0), 
//	"INTEREST_CODE2" NUMBER(1,0), 
//	"INTEREST_CODE3" NUMBER(1,0), 
//	"NAVER_TOKEN" VARCHAR2(60 BYTE), 
//	"KAKAO_TOKEN" VARCHAR2(60 BYTE), 
//	"AD_APPROVAL" NUMBER(1,0) DEFAULT 0, 
//	"MARKETING_APPROVAL" NUMBER(1,0) DEFAULT 0
}




