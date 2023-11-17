package servlets.curation.command;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.curation.domain.CurationDTO;
import servlets.curation.service.ProductService;
import servlets.curation.service.ProgramService;

public class Product implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("> Products select start..");
		String path = request.getRequestURI();
		ProductService pd = ProductService.getInstance();
		ProgramService pg = ProgramService.getInstance();
		int num = (int)(Math.random()*8)+1; 

		List<CurationDTO> list = pd.selectPD(path, num);
		
		request.setAttribute("list", list);
		
			return "/WEB-INF/views/curation/result/products.jsp";
		
	}
}
