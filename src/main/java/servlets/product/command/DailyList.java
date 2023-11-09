package servlets.product.command;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.product.domain.ProductsDTO;
import servlets.product.service.ListService;

public class DailyList implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(">DailyList.process ");		
		String path = request.getRequestURI();		
		System.out.println(path);
		ListService listService = ListService.getInstance();
	    List<ProductsDTO> list = listService.select(path);
	    List<ProductsDTO> dailylist = listService.bestselect(path);
		
		//1.  포워딩 전 데이터 저장
		request.setAttribute("list", list);
		request.setAttribute("dailylist", dailylist);	

		return "/WEB-INF/views/product/DailyList.jsp";
		
		
	}

}
