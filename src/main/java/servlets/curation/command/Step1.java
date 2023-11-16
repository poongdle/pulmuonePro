package servlets.curation.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.curation.domain.CurationDTO;
import servlets.curation.domain.KidsDTO;
import servlets.curation.service.KidService;
import servlets.curation.service.Step1Service;

public class Step1 implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("> Step1 start");


		return "/WEB-INF/views/curation/step1.jsp";
	}

}
