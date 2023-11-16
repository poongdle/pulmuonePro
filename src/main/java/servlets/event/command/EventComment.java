package servlets.event.command;

import java.sql.Connection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbc.connection.ConnectionProvider;
import mvc.command.CommandHandler;
import servlets.event.domain.EventCommentDTO;
import servlets.event.persistence.EventCommentDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class EventComment implements CommandHandler{

    private EventCommentDAO commentDAO = new EventCommentDAO();

    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String method = request.getMethod(); // GET, POST

        if (method.equals("GET")) {

            int event_no = Integer.parseInt(request.getParameter("event_no"));
            int currentPage = request.getParameter("currentPage") != null ? Integer.parseInt(request.getParameter("currentPage")) : 1;
            int numberPerPage = 10;

            JSONObject jsonResponse = new JSONObject();
            JSONArray jsonCommentArr = new JSONArray();

            try (Connection conn = ConnectionProvider.getConnection()) {
                List<EventCommentDTO> comments = commentDAO.selectList(conn, event_no, currentPage, numberPerPage);

                for (EventCommentDTO comment : comments) {
                    JSONObject jsonComment = new JSONObject();
                    jsonComment.put("comment_no", comment.getComment_no());
                    jsonComment.put("event_no", comment.getEvent_no());
                    jsonComment.put("member_no", comment.getMember_no());
                    jsonComment.put("write_date", comment.getWrite_date().toString());
                    jsonComment.put("content", comment.getContent());

                    jsonCommentArr.add(jsonComment);
                }

                int totalComments = commentDAO.selectCount(conn, event_no);
                int totalPages = (int) Math.ceil((double) totalComments / numberPerPage);

                jsonResponse.put("comments", jsonCommentArr);
                jsonResponse.put("totalComments", totalComments);
                jsonResponse.put("totalPages", totalPages);
                jsonResponse.put("currentPage", currentPage);
            }

            response.setContentType("application/json; charset=utf-8");
            response.getWriter().write(jsonResponse.toString());

        } else { // POST

            // POST 요청 처리 로직
            // ...

        } // if

        return null; // JSON 응답을 직접 작성하므로 null을 반환
    }
}
