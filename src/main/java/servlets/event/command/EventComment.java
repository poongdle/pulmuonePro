package servlets.event.command;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.connection.ConnectionProvider;
import mvc.command.CommandHandler;
import servlets.event.domain.EventCommentDTO;
import servlets.event.persistence.EventCommentDAO;

public class EventComment implements CommandHandler{

	private EventCommentDAO commentDAO = new EventCommentDAO();
	
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String method = request.getMethod(); // GET, POST

        if (method.equals("GET")) {

            return "/WEB-INF/views/event/commentList.jsp";
        } else { // POST

            int event_no = Integer.parseInt(request.getParameter("event_no"));
            int member_no = Integer.parseInt(request.getParameter("member_no")); // Assuming the member_no is provided in the request
            String content = request.getParameter("content");

            EventCommentDTO newComment = EventCommentDTO.builder()
                    .event_no(event_no)
                    .member_no(member_no)
                    .content(content)
                    .build();

            try (Connection conn = ConnectionProvider.getConnection()) {
                int result = commentDAO.insert(conn, newComment);

                if (result == 1) { // If the comment was successfully added
                    // Redirect to the comment list page
                    response.sendRedirect("/event/event/view.do?event_no=" + event_no);
                    return null;
                } else {
                    // If there was an error
                    request.setAttribute("error", "댓글 추가에 실패했습니다.");
                    return "/WEB-INF/views/error.jsp";
                }
            }
        } // if
    }
}