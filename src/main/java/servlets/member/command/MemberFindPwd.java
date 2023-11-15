package servlets.member.command;

import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.member.dto.MemberDTO;
import servlets.member.service.MemberService;

public class MemberFindPwd implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberFindPwd.java : 비밀번호 찾기");
		
		String method = request.getMethod();
		String requestUri = request.getRequestURI();
		
		String pwdSuccessUri = "/member/find/password-success.do";
		
		if (method.equals("GET")) {
			
			if (requestUri.equals(pwdSuccessUri)) {
				return pwdSuccessUri;
			}
			
			return "/WEB-INF/views/member/find/findPwd.jsp";
			
			
		} else { // POST
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			String memberId = request.getParameter("memberId");
			
			MemberService memberService = new MemberService();
			MemberDTO dto = memberService.isExistingId(memberId);
//			
//			request.setAttribute("memberId", memberId);
//			request.setAttribute("tel", tel);
//			request.setAttribute("email", email);
			
			String path = "/WEB-INF/views/member/find/findPwd_success.jsp";
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
			return null;
		}
		
	}

}
