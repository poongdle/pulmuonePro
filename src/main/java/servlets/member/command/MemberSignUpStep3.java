package servlets.member.command;

import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.member.dto.MemberDTO;
import servlets.member.service.MemberService;

public class MemberSignUpStep3 implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		String requestUri = request.getRequestURI();
		
		if (method.equals("GET")) {
			
			response.sendRedirect("/member/regist/step1.do");
			return null;
		} else { // POST
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			String name = request.getParameter("name");
			String tel = request.getParameter("tel");
			String rrnBirthDate = request.getParameter("rrnBirthDate");
			String rrnGenderCode = request.getParameter("rrnGenderCode");
			
			String memberId = request.getParameter("memberId");
			String pwd = request.getParameter("memberPwd");
			String email = request.getParameter("email");
			int adApproval = ( request.getParameter("agree3").equals("Y") ? 1 : 0 );
			int marketingApproval = ( request.getParameter("agree4").equals("Y") ? 1 : 0 );
			
			
			request.setAttribute("name", name);
			request.setAttribute("tel", tel);
			request.setAttribute("rrnBirthDate", rrnBirthDate);
			request.setAttribute("rrnGenderCode", rrnGenderCode);
			request.setAttribute("memberId", memberId);
			request.setAttribute("pwd", pwd);
			request.setAttribute("email", email);
			request.setAttribute("adApproval", adApproval);
			request.setAttribute("marketingApproval", marketingApproval);
			
			
			String path = "/WEB-INF/views/member/regist/step3.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		}
		return null;
	}

}
