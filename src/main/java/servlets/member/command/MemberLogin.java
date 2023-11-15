package servlets.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.AuthInfo;
import mvc.command.CommandHandler;
import servlets.member.dto.MemberDTO;
import servlets.member.service.MemberService;

public class MemberLogin implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String method = request.getMethod();
		
		if (method.equals("GET")) {
			// 로그인 화면으로 이동

			return "/WEB-INF/views/member/login.jsp";

		} else {
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			String memberId = request.getParameter("memberId").trim();
			String pwd = request.getParameter("pwd").trim();
			
			System.out.println(memberId + " " + pwd);
			
			MemberService memberService = new MemberService();
			MemberDTO dto = memberService.login(memberId, pwd);
			
			
			if (dto != null) {
				HttpSession session = request.getSession(false);
				
				// 인증 처리를 객체
				AuthInfo auth = new AuthInfo(dto.getMemberNo(), memberId, dto.getName());
				session.setAttribute("auth", auth);

				// 로그인 필터 거치기 전 경로가 있으면, 그 경로로 리다이렉트
				String location = "/index.jsp";
				String referer = (String) session.getAttribute("referer");

				if (referer != null) {
					location = referer;
					session.removeAttribute("referer");
				}
				
				response.sendRedirect(location);
				
			} else {

//				response.sendError(499, "아이디 또는 비밀번호를 확인해 주세요.");
				String location = "/member/login.do";
				response.sendRedirect(location);
				
			}
						
			return null;
		}
		
	}

}
