package servlets.curation.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.curation.domain.CurationDTO;
import servlets.curation.domain.KidsDTO;
import servlets.curation.service.KidService;
import servlets.curation.service.ProdustService;

public class Product implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
			System.out.println("> Products select start..");
			ProdustService pd = ProdustService.getInstance();
			List<CurationDTO> list = pd.select();
			
			request.setAttribute("list", list);
		
			return "/WEB-INF/views/curation/result/products.jsp";
	}
}
