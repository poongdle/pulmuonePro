package servlets.faq.command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import net.sf.json.JSONObject;
import servlets.faq.service.FaqDeleteService;

public class FaqDelete implements CommandHandler {
	private FaqDeleteService faqDeleteService = new FaqDeleteService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//response.setContentType("text/html; charset=UTF-8");
		response.setContentType("application/x-json; charset=UTF-8");

		String pseq = request.getParameter("seq");
		int category = Integer.parseInt( request.getParameter("category") );

		int seq = 0;
		if( pseq != null || pseq != "" ) {
			seq = Integer.parseInt(pseq);
		}
		String location = "/forum/faq/list.do?seq=" +seq; 

		System.out.println(seq);

		int deleteRow = faqDeleteService.delete(seq, category);

		if( deleteRow == 1 ) {
			location += "&status=success";
		}else {
			location += "&status=fail";
		}

		// {}
		JSONObject jsonData = new JSONObject();
		jsonData.put("result", deleteRow);
		jsonData.put("url", location);
		
		PrintWriter out = response.getWriter();

		out.println(jsonData); //response
		
		return null;
	}

}
