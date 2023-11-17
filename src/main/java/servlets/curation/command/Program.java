package servlets.curation.command;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.curation.domain.CurationDTO;
import servlets.curation.service.ProductService;
import servlets.curation.service.ProgramService;

public class Program implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("> Program start..");
		
		String path = request.getRequestURI();
		ProductService pd = ProductService.getInstance();
		ProgramService pg = ProgramService.getInstance();
		int num = (int)(Math.random()*8)+1; 

		List<CurationDTO> list = pg.selectPG(path, num);
		
		request.setAttribute("list", list);
		
		
			return "/WEB-INF/views/curation/result/programs.jsp";
	}
}
