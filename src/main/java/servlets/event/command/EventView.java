package servlets.event.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.event.domain.EventViewDTO;
import servlets.event.service.ViewService;

public class EventView implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int event_no = Integer.parseInt(request.getParameter("event_no"));

		ViewService viewService = ViewService.getInstance();
		EventViewDTO dto = viewService.selectEvent(event_no);

		request.setAttribute("eventView", dto);

		return "/WEB-INF/views/event/view.jsp";
	}

}