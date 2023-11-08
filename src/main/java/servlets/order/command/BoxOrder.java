package servlets.order.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import mvc.command.CommandHandler;

public class BoxOrder implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("> BoxOrder.process..");
		return "/WEB-INF/views/order/box/step1.jsp";
	}

}
