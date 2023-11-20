package servlets.curation.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.AuthInfo;
import mvc.command.CommandHandler;
import servlets.curation.domain.CurationDTO;
import servlets.curation.service.CartService;

public class CartDaily implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
			System.out.println("> Cart start..");
		
			return "/WEB-INF/views/curation/cartdaily.jsp";
	}

}
