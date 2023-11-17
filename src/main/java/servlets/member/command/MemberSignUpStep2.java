package servlets.member.command;

import java.sql.Date;

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
			
//			return "/WEB-INF/views/member/regist/step2.jsp";
		} else { // POST
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			String name = "사공보경";
			String tel = "010-2374-1546";
			String rrnBirthDate = "930205";
			String rrnGenderCode = "2";
			Date birthDate = new MemberService().getBirthDate(rrnBirthDate, rrnGenderCode);
			
//			String name = request.getParameter("name");
//			String tel = request.getParameter("tel");
			
			request.setAttribute("name", name);
			request.setAttribute("tel", tel);
			request.setAttribute("rrnBirthDate", rrnBirthDate);
			request.setAttribute("rrnGenderCode", rrnGenderCode);

//			MemberDTO dto = MemberDTO.builder().name(name).tel(tel).birthDate(birthDate).build();
//			request.setAttribute("dto", dto);

			String path = "/WEB-INF/views/member/regist/step2.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		}
		
		return null;
		
		
	}

}
