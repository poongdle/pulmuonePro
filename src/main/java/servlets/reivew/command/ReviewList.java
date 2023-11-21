package servlets.reivew.command;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.product.domain.ProductsDTO;
import servlets.product.service.ListService;

public class ReviewList implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(">ReviewList.process ");
		
		ListService listService = ListService.getInstance();
	  
		//1.  포워딩 전 데이터 저장
	

		return "/WEB-INF/views/review/list.jsp";
		
		
	}

}
