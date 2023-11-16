package servlets.event.command;

import java.sql.Connection;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.connection.ConnectionProvider;
import mvc.command.CommandHandler;
import servlets.event.domain.EventCommentDTO;
import servlets.event.persistence.EventCommentDAO;

public class EventComment implements CommandHandler{

    private EventCommentDAO commentDAO = new EventCommentDAO();

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String method = request.getMethod();

        Connection conn = ConnectionProvider.getConnection();
        
        if (method.equalsIgnoreCase("GET")) {
        	
            int event_no = Integer.parseInt(request.getParameter("event_no"));
            List<EventCommentDTO> comments = commentDAO.selectList(conn, event_no);
            request.setAttribute("comments", comments);
            return "/WEB-INF/views/layouts/event/comment_area.jsp"; // 댓글 목록을 보여주는 페이지로 이동
            
        } else if (method.equalsIgnoreCase("POST")) {
        	
            HttpSession session = request.getSession();
            int member_no = Integer.parseInt(session.getAttribute("member_no").toString()); // 세션에서 회원 번호 가져오기
            int event_no = Integer.parseInt(request.getParameter("event_no"));
            String content = request.getParameter("content");
            EventCommentDTO comment = new EventCommentDTO();
            comment.setEvent_no(event_no);
            comment.setMember_no(member_no);
            comment.setWrite_date(new Date(System.currentTimeMillis()));
            comment.setContent(content);
            commentDAO.insert(conn, comment); // Connection 객체 전달
            return "/WEB-INF/views/layouts/event/comment_area.jsp"; // 댓글 목록을 보여주는 페이지로 이동
            
        } else {
            return null;
        }
    }
}