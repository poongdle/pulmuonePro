package servlets.member.command;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.member.dto.MemberDTO;
import servlets.member.service.MemberService;

public class MemberSignUpStep2 implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String method = request.getMethod();
		String requestUri = request.getRequestURI();
		
		if (method.equals("GET")) {
			
			
			response.sendRedirect("/member/regist/step1.do");
			return null;
		} else { // POST
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			String inputTel = request.getParameter("tel");
			String tel = String.format("%s-%s-%s", inputTel.substring(0, 3), inputTel.substring(3, 7), inputTel.substring(7, 11));
			
			String name = request.getParameter("name");
			String rrnBirthDate = request.getParameter("rrnBirthDate");
			String rrnGenderCode = request.getParameter("rrnGenderCode");	

			MemberDTO dto = null;
			
			try {
				
//				String tel = "01023741546";
//				String name = "사공보경";
//				String rrnBirthDate = "930205";
//				String rrnGenderCode = "2";
				
				MemberService memberService = new MemberService();
				dto = memberService.authorizeNICE(name, tel, rrnBirthDate, rrnGenderCode);				
				
			} catch (NullPointerException e) {
				System.err.println("[Warn] MemberFindId.java : tel == null");
			} catch (Exception e) {
				System.err.println("[Warn] MemberFindId.java : dto == null (고객정보 불일치)");
			}
			
			if (dto != null) {
				
				// 기존 가입 회원
				System.out.println("이미 가입된 회원임");
				response.sendRedirect("/member/logout.do");
				
			} else {
					
				request.setAttribute("name", name);
				request.setAttribute("tel", tel);
				request.setAttribute("rrnBirthDate", rrnBirthDate);
				request.setAttribute("rrnGenderCode", rrnGenderCode);
	
				
				String path = "/WEB-INF/views/member/regist/step2.jsp";
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
				
			}
			
			return null;
			
		}
		
	}

}
