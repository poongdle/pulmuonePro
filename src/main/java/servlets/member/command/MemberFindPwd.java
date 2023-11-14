package servlets.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class MemberFindPwd implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberFindPwd.java : 비밀번호 찾기");
		
		return "/WEB-INF/views/member/find/findPwd.jsp";
	}

}
