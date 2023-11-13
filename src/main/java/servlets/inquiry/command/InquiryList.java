package servlets.inquiry.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.inquiry.model.InquiryDTO;
import servlets.inquiry.service.InquiryListService;

public class InquiryList implements CommandHandler {

	private InquiryListService inquiryListService = new InquiryListService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pcategory = request.getParameter("category");
		String category = "";
		
		if( pcategory != null || !pcategory.equals("") ) {
			category = pcategory;
		}
		ArrayList<InquiryDTO> list = null;
		list = inquiryListService.select(category);
		System.out.println(list);
		request.setAttribute("list", list);
		
		return "/WEB-INF/views/inquiry/list.jsp";
	}

}
