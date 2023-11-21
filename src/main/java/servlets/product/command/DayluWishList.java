package servlets.product.command;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.util.SystemPropertyReplacerListener;

import auth.AuthInfo;
import mvc.command.CommandHandler;
import servlets.product.domain.ProductsDTO;
import servlets.product.service.AddService;
import servlets.product.service.ListService;

public class DayluWishList implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(">AddWishList.process ");
		AddService addService = AddService.getInstance();
		int tag = Integer.parseInt(request.getParameter("tag"));
		HttpSession session = request.getSession(false);
		AuthInfo auth = (AuthInfo) session.getAttribute("auth");
		String user_id = null;
		if(auth == null) {
			user_id = null;
		}else {
			user_id = auth.getMemberId();												
		}
		int insertRow = 0;		
		insertRow = addService.wishadd(user_id,tag);
		
		return "/WEB-INF/views/product/DailyList.jsp";
		
		
	}

}
