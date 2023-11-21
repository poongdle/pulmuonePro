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


public class Kidscart implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("> KidsCart start..");


		return "/WEB-INF/views/cart/kidscart.jsp";
	}

}
