package servlets.curation.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.curation.domain.CartDTO;
import servlets.curation.domain.CurationDTO;
import servlets.curation.domain.KidsDTO;
import servlets.curation.service.CartService;
import servlets.curation.service.KidService;
import servlets.curation.service.ProductService;
import servlets.product.domain.ProductsDTO;
import servlets.product.service.ListService;

public class CartDaily implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
			System.out.println("> Cart start..");

			int num =1;
			
			CartService cartService = CartService.getInstance();
			List<CartDTO> list = cartService.cartdaily(num);
			request.setAttribute("list", list);
		
			return "/WEB-INF/views/curation/cartdaily.jsp";
	}

}
