package servlets.curation.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.curation.domain.CurationDTO;
import servlets.curation.service.ProgramService;

public class Program implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		if (method.equals("GET")) {
			
		
		System.out.println("> Program start..");
		ProgramService pg = ProgramService.getInstance();
		List<CurationDTO> list = pg.select();
			
		request.setAttribute("list", list);
		
			return "/WEB-INF/views/curation/result/programs.jsp";
			
		}else {
				System.out.println("> Step3 startpost");
				request.setCharacterEncoding("UTF-8");
				String no =request.getParameter("program_no");
				
				CurationDTO dto = new CurationDTO();
				dto.setProgram_name("program_no");
				
				String num = request.getParameter("num");
				if (num == null) {
					dto.setProgram_no(0);;
				}  

				ProgramService pg = ProgramService.getInstance();
				List<CurationDTO> rowcount = pg.select();
				if (rowcount != null) {
					String location = "/customer/product/result/programs.do?"; 
					response.sendRedirect(location);
				}
				
			}
			return null;
	}
}
