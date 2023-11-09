package servlets.event.command.end;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class EndEventList implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("> EndEventList.process..");
		
		String category = request.getParameter("category");
		
		return "/WEB-INF/views/event/end/list.jsp";
	}
	
}
