package servlets.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import net.sf.json.JSONObject;
import servlets.member.dto.MemberDTO;
import servlets.member.service.MemberService;

public class MemberInvCodeCheck implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberInvCodeCheck.java : 초대코드 확인 ajax 처리");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String invCode = request.getParameter("invCode");
		MemberService memberService = new MemberService();
		
		MemberDTO dto = null;
		dto = memberService.isExistingInvCode(invCode);
		
		JSONObject json = new JSONObject();
		int memberNo = 0;
		String memberId = null;
		String name = null;
		
		if (dto != null) {
			memberNo = dto.getMemberNo();
			memberId = dto.getMemberId();
			name = dto.getName();
		}
		
		json.put("memberNo" , memberNo);
		json.put("memberId" , memberId);
		json.put("name" , name);
		
		String jsonResult = json.toString();
		return jsonResult;
	}

}
