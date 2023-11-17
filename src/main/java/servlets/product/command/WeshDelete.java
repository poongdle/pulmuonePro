package servlets.product.command;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.product.domain.ProductsDTO;
import servlets.product.service.DeleteService;
import servlets.product.service.ListService;

public class WeshDelete implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(">WashDelete.process ");
		DeleteService deleteService = DeleteService.getInstance();
		String [] idxs = request.getParameterValues("idx");		
		String idx = null;		
		if (idxs != null) {
			idx = String.join(", ",idxs);
		}			
		int deleteRow = 0;
		String user_id = "aaaaaaaa";
		System.out.println(idx);
		System.out.println(user_id);
		deleteRow = deleteService.wishdelete(user_id,idx);

		return "/WEB-INF/views/product/list.jsp";
		
		
	}

}
