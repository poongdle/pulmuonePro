package servlets.product.command;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.product.domain.ProductsDTO;
import servlets.product.service.ListService;

public class MainList implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(">MainList.process ");
														

		ListService listService = ListService.getInstance();	    	   
	    List<ProductsDTO> mainbestlist = listService.mainbestselect();	    
	    
	    
		//1.  포워딩 전 데이터 저장
		request.setAttribute("mainbestlist", mainbestlist);

		return "/";
		
		
	}

}
