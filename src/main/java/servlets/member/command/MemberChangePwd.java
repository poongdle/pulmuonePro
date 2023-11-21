package servlets.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.member.service.MemberService;

public class MemberChangePwd implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberChangePwd.java : 비밀번호 변경 ajax 처리");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		
		String memberId = request.getParameter("memberId");
		String pwd = request.getParameter("nowMemberPwd");
		String newPwd = request.getParameter("memberPwd");
		
		MemberService memberService = new MemberService();
		
		int rowCount = 0;
		rowCount = memberService.changePwd(memberId, pwd, newPwd);
		
		String jsonResult = String.format("{ \"rowCount\": %d }", rowCount);
		
//		JSONObject jsonResult = new JSONObject();
//		jsonResult.put("memberNo" , dto.getMemberNo());
		
		return jsonResult;
	}

}
