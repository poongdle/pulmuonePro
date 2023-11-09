package servlets.faq.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.faq.model.FaqDTO;
import servlets.faq.model.PageDTO;
import servlets.faq.service.FaqListService;

public class FaqList implements CommandHandler {
	
	private FaqListService listService = new FaqListService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("> FaqList.process..");
		
		String pcategory = request.getParameter("category");
		String ppageNo = request.getParameter("pageNo");
		int category = 1;
		int pageNo = 1;
		int numberPerPage = 5; // 페이지당 글 수
		int totalPages = 0; // 총 페이지수
		int numberOfPageBlock = 5;
		
		servlets.faq.model.PageDTO paging = null;
		
		if( pcategory != null ) {
			category = Integer.parseInt(pcategory);
		}
		if( ppageNo != null ) {
			pageNo = Integer.parseInt(ppageNo);
		}
		
		ArrayList<FaqDTO> faqList =  listService.getFaqList(pageNo, category, numberPerPage);
		totalPages = listService.getFaqTotalPage(numberPerPage, category);
		paging = new PageDTO(pageNo, numberPerPage, numberOfPageBlock, totalPages);
		
		request.setAttribute("list", faqList);
		request.setAttribute("paging", paging);
		
		return "/WEB-INF/views/faq/list.jsp";
	}

}
