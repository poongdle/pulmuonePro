package servlets.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class MemberType implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberType.java : 회원가입 유형 선택 페이지로 이동 ");
		
		return "/WEB-INF/views/member/regist/type.jsp";
	}

}
