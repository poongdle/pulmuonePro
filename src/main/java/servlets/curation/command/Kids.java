package servlets.curation.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.curation.domain.KidsDTO;
import servlets.curation.service.KidService;

public class Kids implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
			System.out.println("> Kids start..");
			KidService kid = KidService.getInstance();
			List<KidsDTO> list = kid.select();
			
			request.setAttribute("list", list);
		
			return "/WEB-INF/views/curation/result/kids.jsp";
	}
}
