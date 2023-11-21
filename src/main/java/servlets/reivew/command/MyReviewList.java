package servlets.reivew.command;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.AuthInfo;
import mvc.command.CommandHandler;
import servlets.product.domain.ProductsDTO;
import servlets.product.service.ListService;

public class MyReviewList implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(">ReviewList.process ");
		HttpSession session = request.getSession(false);
		AuthInfo auth = (AuthInfo) session.getAttribute("auth");
		int memberNo = auth.getMemberNo();
				
		ListService listService = ListService.getInstance();
		List<ProductsDTO> myreviewlist = listService.selectmyreview(memberNo);
		//1.  포워딩 전 데이터 저장
		request.setAttribute("myreviewlist", myreviewlist);

		return "/WEB-INF/views/review/writelist.jsp";
		
		
	}

}
