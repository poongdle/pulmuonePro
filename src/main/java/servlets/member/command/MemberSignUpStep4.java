package servlets.member.command;

import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.member.dto.MemberDTO;
import servlets.member.service.MemberService;

public class MemberSignUpStep4 implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		
		if (method.equals("GET")) {
			
			return "/WEB-INF/views/member/regist/step4.jsp";
		} else { // POST
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			String name = request.getParameter("name");
			String tel = request.getParameter("tel");
			String rrnBirthDate = request.getParameter("rrnBirthDate");
			String rrnGenderCode = request.getParameter("rrnGenderCode");
			Date birthDate = new MemberService().getBirthDate(rrnBirthDate, rrnGenderCode);
			
			String memberId = request.getParameter("memberId");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			int adApproval = Integer.parseInt(request.getParameter("adApproval"));
			int marketingApproval = Integer.parseInt(request.getParameter("marketingApproval"));
			
			String invCode = request.getParameter("friendCode");
			String invMemberId = request.getParameter("friendId");
			
			MemberDTO dto = MemberDTO.builder()
										.memberId(memberId)
										.pwd(pwd)
										.name(name)
										.tel(tel)
										.email(email)
										.birthDate(birthDate)
										.adApproval(adApproval)
										.marketingApproval(marketingApproval) 
										.build();
									
//			request.setAttribute("dto", dto);
			
			MemberService memberService = new MemberService();
			int rowCount = memberService.signup(dto);

			
			request.setAttribute("memberId", memberId);
			request.setAttribute("pwd", pwd);
			
			String path = "/WEB-INF/views/member/regist/step4.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		}
		return null;
	}

}
