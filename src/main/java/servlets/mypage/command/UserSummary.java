package servlets.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class UserSummary implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("UserSummary.java : MY녹즙 기본 페이지");
		
		
		return "/WEB-INF/views/mypage/userSummary.jsp";
	}

}
