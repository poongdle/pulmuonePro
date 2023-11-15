package servlets.faq.command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.AuthInfo;
import mvc.command.CommandHandler;
import net.sf.json.JSONObject;
import servlets.faq.model.FaqDTO;
import servlets.faq.service.FaqWriteService;

public class FaqWrite implements CommandHandler {
	
	private FaqWriteService faqWriteService = new FaqWriteService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if( request.getMethod().equalsIgnoreCase("GET") ) {
			AuthInfo auth = null;
			HttpSession session = request.getSession();
			auth = (AuthInfo) session.getAttribute("auth");
			if( !auth.getName().equals("admin") ) {
				response.sendRedirect("/forum/faq/list.do");
				return null;
			}
			return "/WEB-INF/views/faq/write.jsp";
		}else {

			//response.setContentType("text/html; charset=UTF-8");
			response.setContentType("application/x-json; charset=UTF-8");
			
			int cate = Integer.parseInt( request.getParameter("cate") );
			String question = request.getParameter("question");
			String answer = request.getParameter("answer");

			FaqDTO dto = new FaqDTO(0, cate, question, answer);
			
			System.out.println(cate);
			System.out.println(question);
			System.out.println(answer);

			int insertRow = 0;
			try {
				insertRow = faqWriteService.write(dto);

			} catch (Exception e) {
				e.printStackTrace();
			}

			String location = "";

			if( insertRow == 1) {
				location = "/forum/faq/list.do?category=" + cate;
			}else {
				location = "/forum/faq/write.do?status=fail";
			}
			
			// {}
			JSONObject jsonData = new JSONObject();
			jsonData.put("result", insertRow);
			jsonData.put("url", location);

			PrintWriter out = response.getWriter();
			
			out.println(jsonData);

			return null;
		}
	}

}
