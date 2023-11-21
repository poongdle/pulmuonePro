package servlets.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.AuthInfo;
import mvc.command.CommandHandler;
import servlets.member.dto.MemberDTO;
import servlets.member.service.MemberService;

public class InfoCheckPwd implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if (method.equals("GET")) {
			
			return "/WEB-INF/views/mypage/personal/info/checkPwd.jsp";
		} else { // POST
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			HttpSession session = request.getSession(false);
			AuthInfo auth = (AuthInfo) session.getAttribute("auth");
			
			String memberId = auth.getMemberId();
			String pwd = request.getParameter("pwd");
			
			MemberService memberService = new MemberService();
			MemberDTO dto = memberService.login(memberId, pwd);
			System.out.println(dto);
			if (dto != null) {
		
				request.setAttribute("invCode", dto.getInvCode());
				request.setAttribute("name", dto.getName());
				request.setAttribute("tel", dto.getTel());
				
				String email = dto.getEmail();
				request.setAttribute("emailId", email.split("@")[0]);
				request.setAttribute("emailHost", email.split("@")[1]);
				request.setAttribute("interestCode1", dto.getInterestCode1());
				request.setAttribute("interestCode2", dto.getInterestCode2());
				request.setAttribute("interestCode3", dto.getInterestCode3());
				request.setAttribute("kakaoToken", dto.getKakaoToken());
				request.setAttribute("naverToken", dto.getNaverToken());
				request.setAttribute("adApproval", dto.getAdApproval());
				request.setAttribute("marketingApproval", dto.getMarketingApproval());
				
				return "/WEB-INF/views/mypage/personal/info/detail.jsp";
			} else {
				
				return "/WEB-INF/views/mypage/personal/info/checkPwd.jsp";
			}
			
			
		}
		
	}

}
