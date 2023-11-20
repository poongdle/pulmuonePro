package servlets.member.command;

import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.member.dto.MemberDTO;
import servlets.member.service.MemberService;

public class MemberFindId implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberFindId.java : 아이디 찾기");
		
		String method = request.getMethod();
		
		if (method.equals("GET")) {
			
			return "/WEB-INF/views/member/find/findId.jsp";
			
		} else { // POST
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			MemberDTO dto = null;
			
			try {
				
				String inputTel = request.getParameter("tel");
				String tel = String.format("%s-%s-%s", inputTel.substring(0, 3), inputTel.substring(3, 7), inputTel.substring(7, 11));
	
				String name = request.getParameter("name");
				String rrnBirthDate = request.getParameter("rrnBirthDate");
				String rrnGenderCode = request.getParameter("rrnGenderCode");
				
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
			
			if (dto == null) {
				
				response.sendRedirect("/member/find/id.do");
				
			} else {

				int memberIdLength = dto.getMemberId().length();
				String memberId = dto.getMemberId().substring(0, memberIdLength-2) + "**";
	
				String datePattern = "yyyy년 MM월 dd일";
				SimpleDateFormat sdf = new SimpleDateFormat(datePattern);
				String regDate = sdf.format(dto.getRegDate());
				
				request.setAttribute("memberId", memberId);
				request.setAttribute("regDate", regDate);
				
				String path = "/WEB-INF/views/member/find/findId_success.jsp";
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
				
			}
			
			return null;
		}
		

	}

}
