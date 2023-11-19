package servlets.product.command;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.product.domain.ProductsDTO;
import servlets.product.service.ListService;

public class WeshList implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(">WishList.process ");
		ListService listService = ListService.getInstance();				
		List<ProductsDTO> wishlist = listService.selectwish();
		request.setAttribute("wishlist", wishlist);
		return "/WEB-INF/views/product/list.jsp";
		
		
	}

}
