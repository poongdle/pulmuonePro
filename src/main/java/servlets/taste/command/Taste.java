package servlets.taste.command;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.product.domain.ProductsDTO;
import servlets.product.service.AddService;
import servlets.product.service.ListService;

public class Taste implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(">Taste.process ");
		

		return "/WEB-INF/views/taste/taste.jsp";
		
		
	}

}
