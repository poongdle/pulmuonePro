package servlets.member.command;

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

			String[] telArr = dto.getTel().split("-");
			String markedTel = String.format("%s-%s-%s", telArr[0], "*".repeat(telArr[1].length()) ,telArr[2]);
			
			request.setAttribute("memberId", memberId);
			request.setAttribute("tel", dto.getTel());
			request.setAttribute("email", dto.getEmail());
			request.setAttribute("maskedTel", markedTel); // 중간 번호가 가려진 전화번호

//			String path = "/WEB-INF/views/member/find/findPwd_success.jsp";
			String path = "/WEB-INF/views/member/find/changePassword.jsp";
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
			return null;
		}
		
	}

}
