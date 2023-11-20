package servlets.refund.command;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.AuthInfo;
import mvc.command.CommandHandler;
import servlets.refund.dto.RefundDTO;
import servlets.refund.service.RefundService;

public class RefundList implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(false);
		AuthInfo auth = (AuthInfo) session.getAttribute("auth");		
		
		int memberNo = auth.getMemberNo();
		
		RefundService refundService = new RefundService();
		RefundDTO dto = refundService.getRefundAcctInfo(memberNo);
		
		if (dto != null) {
			String acctNum = dto.getAcctNum();
			String maskedAcctNum = String.format("%s*****", acctNum.substring(0,acctNum.length()-5));
			
			request.setAttribute("insttName", dto.getInsttName());
			request.setAttribute("acctOwner", dto.getAcctOwner());
			request.setAttribute("maskedAcctNum", maskedAcctNum);
			
		}		
		
		String path = "/WEB-INF/views/mypage/personal/refund/list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
		return null;
		
	}

}
