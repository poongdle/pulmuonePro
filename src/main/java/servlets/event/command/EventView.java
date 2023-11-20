package servlets.event.command;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.connection.ConnectionProvider;
import mvc.command.CommandHandler;
import servlets.event.domain.EventCommentDTO;
import servlets.event.domain.EventViewDTO;
import servlets.event.persistence.EventCommentDAO;
import servlets.event.service.ViewService;

public class EventView implements CommandHandler {
    private EventCommentDAO commentDAO = new EventCommentDAO();

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int event_no = Integer.parseInt(request.getParameter("event_no"));

        ViewService viewService = ViewService.getInstance();
        EventViewDTO dto = viewService.selectEvent(event_no);

        int currentPage = 1;  // default page number
        int numberPerPage = 10;  // number of comments per page

        // if currentPage parameter is set, parse it
        if (request.getParameter("currentPage") != null) {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }

        try (Connection conn = ConnectionProvider.getConnection()) {
            List<EventCommentDTO> comments = commentDAO.selectList(conn, event_no, currentPage, numberPerPage);
            request.setAttribute("comments", comments);
        
            // total number of comments
            int totalComments = commentDAO.selectCount(conn, event_no);
            request.setAttribute("totalComments", totalComments);

            // number of pages needed to display all comments
            int totalPages = (int) Math.ceil((double) totalComments / numberPerPage);

            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", currentPage);
        }

        request.setAttribute("eventView", dto);

        return "/WEB-INF/views/event/view.jsp";
    }
}
