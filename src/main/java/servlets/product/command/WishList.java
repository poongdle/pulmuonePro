package servlets.product.command;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.AuthInfo;
import mvc.command.CommandHandler;
import servlets.product.domain.ProductsDTO;
import servlets.product.service.ListService;

public class WishList implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(">WishList.process ");
		HttpSession session = request.getSession(false);
		AuthInfo auth = (AuthInfo) session.getAttribute("auth");
		String user_id = null;
		if(auth == null) {
			user_id = null;
		}else {
			user_id = auth.getMemberId();												
		}
		ListService listService = ListService.getInstance();				
		List<ProductsDTO> wishlist = listService.selectwish(user_id);
		request.setAttribute("wishlist", wishlist);
		return "/WEB-INF/views/product/list.jsp";
		
		
	}

}
