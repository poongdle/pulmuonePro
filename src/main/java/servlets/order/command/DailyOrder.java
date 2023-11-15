package servlets.order.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import mvc.command.CommandHandler;

public class DailyOrder implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("> DailyOrder.process..");
		return "/WEB-INF/views/order/daily/step1.jsp";
	}

}
