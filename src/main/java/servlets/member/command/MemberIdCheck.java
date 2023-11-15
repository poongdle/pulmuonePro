package servlets.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import net.sf.json.JSONObject;
import servlets.member.dto.MemberDTO;
import servlets.member.service.MemberService;

public class MemberIdCheck implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberIdCheck.java : 아이디 존재 여부 ajax 처리");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String memberId = request.getParameter("memberId");
		MemberService memberService = new MemberService();
		
		MemberDTO dto = null;
		dto = memberService.isExistingId(memberId);
		
		String jsonResult = String.format("{ \"memberNo\":%d }"
											, (dto != null ? dto.getMemberNo() : 0));
		
//		JSONObject jsonResult = new JSONObject();
//		jsonResult.put("memberNo" , dto.getMemberNo());
		
		return jsonResult;
	}

}
