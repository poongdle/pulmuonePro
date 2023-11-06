package servlets.faq.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import mvc.command.CommandHandler;

public class FaqList implements CommandHandler {


	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) 
			throws Exception {
		System.out.println("> FaqList.process..");
		
		return "/WEB-INF/views/faq/list.jsp";
	}

}
