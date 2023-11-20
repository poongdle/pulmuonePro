package servlets.curation.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.curation.domain.CurationDTO;
import servlets.curation.service.CartService;

public class CartDaily implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
			System.out.println("> Cart start..");
			CartService cartservice = CartService.getInstance();
			int num = Integer.parseInt( request.getParameter("num") );
			CurationDTO list = cartservice.cartdaily(num);
			
			request.setAttribute("list", list);
		
			return "/WEB-INF/views/curation/cartdaily.jsp";
	}

}
