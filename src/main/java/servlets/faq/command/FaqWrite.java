package servlets.faq.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.faq.model.FaqDTO;
import servlets.faq.service.FaqWriteService;
import servlets.notice.model.NoticeDTO;

public class FaqWrite implements CommandHandler {
	
	private FaqWriteService faqWriteService = new FaqWriteService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if( request.getMethod().equalsIgnoreCase("GET") ) {

			return "/WEB-INF/views/faq/write.jsp";
		}else {

			response.setContentType("text/html; charset=UTF-8");
			
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
				location = "/forum/faq/list.do?status=success";
			}else {
				location = "/forum/faq/write.do?status=fail";
			}

			request.setAttribute("writed", insertRow);

			response.sendRedirect(location);
			return null;
		}
	}

}
