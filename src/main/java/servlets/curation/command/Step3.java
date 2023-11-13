package servlets.curation.command;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.connection.ConnectionProvider;
import mvc.command.CommandHandler;
import servlets.curation.domain.CurationDTO;
import servlets.curation.persistence.DAOImpl;
import servlets.curation.service.ProductService;
import servlets.curation.service.ProgramService;

public class Step3 implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("> Step3 start get");
			return "/WEB-INF/views/curation/step3.jsp";
		
	}

}

