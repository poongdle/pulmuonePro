package servlets.refund.command;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class RefundWrite implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		if (method.equals("GET")) {


		} else {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
//			request.setAttribute("acctNum", request.getParameter("acctNum"));
		}
		
		String path = "/WEB-INF/views/mypage/personal/refund/write.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
		return null;
	}

}
