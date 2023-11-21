package servlets.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.AuthInfo;
import mvc.command.CommandHandler;
import servlets.member.service.MemberService;

public class MemberQuit implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		
		if (method.equals("GET")) {
			
			return "/WEB-INF/views/member/quit.jsp";
		} else {
			System.out.println("MemberQuit.java : 회원 탈퇴 ajax 처리");
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			HttpSession session = request.getSession(false);
			AuthInfo auth = (AuthInfo) session.getAttribute("auth");
			
			int memberNo = auth.getMemberNo();
			int rowCount = 0;

			MemberService memberService = new MemberService();
			rowCount = memberService.quit(memberNo);
			
			System.out.println(rowCount);
			
			String jsonResult = String.format("{ \"rowCount\": %d }", rowCount);
			
//			JSONObject jsonResult = new JSONObject();
//			jsonResult.put("memberNo" , dto.getMemberNo());
			
			return jsonResult;
		}
	}

}
