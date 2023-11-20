package servlets.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class MemberSignUpStep1 implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if (method.equals("GET")) {
			
			return "/WEB-INF/views/member/regist/step1.jsp";
		} else { // POST
			

			
			return null;
		}
	}

}
