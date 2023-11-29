package servlets.order.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import mvc.command.CommandHandler;

public class TasteOrder implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("> TasteOrder.process..");
		return "/WEB-INF/views/order/taste/step1.jsp";
	}

}