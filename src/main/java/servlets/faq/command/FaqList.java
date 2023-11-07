package servlets.faq.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import mvc.command.CommandHandler;

public class FaqList implements CommandHandler {


	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("> FaqList.process..");
		
		String category = request.getParameter("category");
		
		return "/WEB-INF/views/faq/list.jsp";
	}

}
