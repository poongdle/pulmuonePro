package servlets.refund.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.AuthInfo;
import mvc.command.CommandHandler;
import servlets.refund.dto.RefundDTO;
import servlets.refund.service.RefundService;

public class DeleteRefundAcct implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("DeleteRefundAcct.java : 환불계좌 삭제 ajax 처리");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession(false);
		AuthInfo auth = (AuthInfo) session.getAttribute("auth");		
		
		int memberNo = auth.getMemberNo();
		
		int rowCount = 0;

		RefundService refundService = new RefundService();
		rowCount = refundService.deleteRefundAcct(memberNo);
		
		
		String jsonResult = String.format("{ \"rowCount\": %d }", rowCount);
		
//		JSONObject jsonResult = new JSONObject();
//		jsonResult.put("memberNo" , dto.getMemberNo());
		
		return jsonResult;
	}

}
