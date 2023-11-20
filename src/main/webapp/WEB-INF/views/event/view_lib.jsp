<%@page import="java.util.List"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="servlets.event.domain.EventCommentDTO"%>
<%@page import="servlets.event.persistence.EventCommentDAO"%>
<%@page import="jdbc.connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    int event_no = Integer.parseInt(request.getParameter("event_no"));
    int currentPage = request.getParameter("currentPage") != null ? Integer.parseInt(request.getParameter("currentPage")) : 1;
    int numberPerPage = 10;

    EventCommentDAO commentDAO = new EventCommentDAO();
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

%>
<%= jsonResponse %>
