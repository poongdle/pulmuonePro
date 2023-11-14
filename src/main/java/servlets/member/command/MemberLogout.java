package servlets.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.AuthInfo;
import mvc.command.CommandHandler;

public class MemberLogout implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession(false);
		
		AuthInfo auth = null;
		auth = (AuthInfo) session.getAttribute("auth");
		
		if (auth != null) {
			session.invalidate();
			
			String location = "/index.jsp";
			response.sendRedirect(location);
		}
		
		return null;
	}

}
