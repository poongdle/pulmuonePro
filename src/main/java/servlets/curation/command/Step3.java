package servlets.curation.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class Step3 implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("> Step3 start");
		
		return "/WEB-INF/views/curation/step3.jsp";
	}

}
