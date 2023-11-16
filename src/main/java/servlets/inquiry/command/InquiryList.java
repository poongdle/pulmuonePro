package servlets.inquiry.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.AuthInfo;
import mvc.command.CommandHandler;
import servlets.inquiry.model.InquiryDTO;
import servlets.inquiry.service.InquiryListService;

public class InquiryList implements CommandHandler {

	private InquiryListService inquiryListService = new InquiryListService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pcategory = request.getParameter("category");
		String category = "all";
		int totalCount = 0;
		
		HttpSession session = request.getSession(false);
		AuthInfo auth = (AuthInfo) session.getAttribute("auth");
		String user_id = auth.getMemberId();
		
		if( pcategory != null && pcategory != "" ) {
			category = pcategory;
		}
		
		ArrayList<InquiryDTO> list = null;
		
		list = inquiryListService.select(user_id, category);
		totalCount = inquiryListService.selectCount(user_id, category);
		
		request.setAttribute("list", list);
		request.setAttribute("totalCount", totalCount);
		
		return "/WEB-INF/views/inquiry/list.jsp";
	}

}
