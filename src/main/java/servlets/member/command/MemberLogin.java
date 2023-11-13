package servlets.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.command.CommandHandler;
import servlets.member.dto.MemberDTO;
import servlets.member.service.MemberLoginService;

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
			
			String memberId = request.getParameter("memberId");
			String pwd = request.getParameter("pwd");
			System.out.println(memberId + " " + pwd);
			MemberLoginService loginService = new MemberLoginService();
			
			MemberDTO dto = loginService.login(memberId, pwd);
			
			HttpSession session = request.getSession();
			
			
			
			if (dto != null) {
				request.setAttribute("memberNo", dto.getMemberNo());
				request.setAttribute("name", dto.getName());
				
				String location = "/WEB-INF/views/member/login_ok.jsp";
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
