package servlets.curation.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.curation.domain.CurationDTO;
import servlets.curation.domain.KidsDTO;
import servlets.curation.service.KidService;
import servlets.curation.service.ProgramService;

public class Program implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
			System.out.println("> Programs select start..");
			ProgramService pg = ProgramService.getInstance();
			List<CurationDTO> list = pg.select();
			
			request.setAttribute("list", list);
		
			return "/WEB-INF/views/curation/result/programs.jsp";
	}
}
