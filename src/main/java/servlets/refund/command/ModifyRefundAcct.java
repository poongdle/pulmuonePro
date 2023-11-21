package servlets.refund.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.AuthInfo;
import mvc.command.CommandHandler;
import servlets.member.service.MemberService;
import servlets.refund.dto.RefundDTO;
import servlets.refund.service.RefundService;

public class ModifyRefundAcct implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ModifyRefundAcct.java : 환불계좌 변경 ajax 처리");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession(false);
		AuthInfo auth = (AuthInfo) session.getAttribute("auth");		
		
		int memberNo = auth.getMemberNo();
		String insttCode = request.getParameter("insttCode");
		String acctOwner = request.getParameter("accountHolder");
		String acctNum = request.getParameter("bankAccount");
		
		int rowCount = 0;
		RefundDTO dto = RefundDTO.builder().memberNo(memberNo)
											.insttCode(insttCode)
											.acctOwner(acctOwner)
											.acctNum(acctNum)
											.build();
		
		RefundService refundService = new RefundService();
		
		rowCount = refundService.modifyRefundAcct(dto);
		
		
		String jsonResult = String.format("{ \"rowCount\": %d }", rowCount);
		
//		JSONObject jsonResult = new JSONObject();
//		jsonResult.put("memberNo" , dto.getMemberNo());
		
		return jsonResult;
	}

}
