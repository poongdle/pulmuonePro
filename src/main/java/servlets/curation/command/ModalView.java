package servlets.curation.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.curation.domain.KidsDTO;
import servlets.curation.service.KidService;

public class ModalView implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
			System.out.println("> Test start..");
			KidService kid = KidService.getInstance();
			int num = Integer.parseInt( request.getParameter("num") );
//			String num = request.getParameter("num");
			System.out.println(num);

			List<KidsDTO> list2 = kid.select(num);
									
//			request.setAttribute("list", list);
			request.setAttribute("list2", list2);
		
			return "/WEB-INF/views/curation/result/modalview.jsp";
	}
}