package servlets.cart.command;



import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.cart.domain.CartDTO;
import servlets.cart.service.CartService;


public class CartDaily implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
			System.out.println("> Cart start..");
		
//			int num = Integer.parseInt( request.getParameter("num") );
			int products_tag = Integer.parseInt(request.getParameter("products_tag"));
			CartService cartService = CartService.getInstance();
			
			
//			System.out.println(num);
			ArrayList<CartDTO> list = cartService.cartList(products_tag);
			
			request.setAttribute("list", list);
			
			
			return "/WEB-INF/views/cart/cartdaily.jsp";
	}

}
