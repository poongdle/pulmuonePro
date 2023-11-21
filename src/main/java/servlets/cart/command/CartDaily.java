package servlets.cart.command;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.cart.domain.CartDTO;
import servlets.cart.service.CartService;


public class CartDaily implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("> Cart start..");	

		String itemCodeLists = request.getParameter("products_no");
		String itemCodeList = null;				
		if (itemCodeLists != null) {
			itemCodeList = String.join(", ",itemCodeLists);
		}
		System.out.println(itemCodeList);      
      	
		CartService cartService = CartService.getInstance();
		ArrayList<CartDTO> list = cartService.cartList(itemCodeList);

		request.setAttribute("list", list);


		return "/WEB-INF/views/cart/cartdaily.jsp";

	}

}
