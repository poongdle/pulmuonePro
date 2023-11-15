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
		String requestUri = request.getRequestURI();
		
		String idSuccessUri = "/member/find/id-success.do";
		
		if (method.equals("GET")) {
			
			if (requestUri.equals(idSuccessUri)) {
				return idSuccessUri;
			}
			
			return "/WEB-INF/views/member/find/findId.jsp";
			
		} else { // POST
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			String tel = "010-2374-1546";
			String name = "사공보경";
			String rrnBirthDate = "930205";
			String rrnGenderCode = "2";
					

			MemberService memberService = new MemberService();
			MemberDTO dto = memberService.findId(name, tel, rrnBirthDate, rrnGenderCode);
			
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
			
			return null;
		}
		
		
		
	}

}
