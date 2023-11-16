package servlets.product.command;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.util.SystemPropertyReplacerListener;

import mvc.command.CommandHandler;
import servlets.product.domain.ProductsDTO;
import servlets.product.service.AddService;
import servlets.product.service.ListService;

public class AddDailyList implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(">AddDailyList.process ");
		AddService addService = AddService.getInstance();
		int tag = Integer.parseInt(request.getParameter("tag"));
		int insertRow = 0;
		String user_id = "aaaaaaaa";
		insertRow = addService.wishadd(user_id,tag);
		
		return "/WEB-INF/views/product/DailyList.jsp";
		
		
	}

}
