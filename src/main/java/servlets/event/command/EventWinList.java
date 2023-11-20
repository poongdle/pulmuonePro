package servlets.event.command;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.util.List;
import servlets.event.domain.EventWinnerDTO;
import servlets.event.persistence.EventWinnerDAO;
import jdbc.connection.ConnectionProvider;
import mvc.command.CommandHandler;

public class EventWinList implements CommandHandler {

    private static final int numberPerPage = 10;
    private static final int numberOfPageBlock = 10;

    private EventWinnerDAO eventWinnerDAO = new EventWinnerDAO();

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int currentPage = 1;

        try {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        } catch (Exception e) {
            // currentPage가 null이거나 숫자가 아닐 경우 그냥 1을 사용한다.
        }

        try (Connection conn = ConnectionProvider.getConnection()) {
            List<EventWinnerDTO> eventWinnersForCurrentPage = eventWinnerDAO.selectList(conn, currentPage, numberPerPage);
            int totalRecords = eventWinnerDAO.getTotalRecords(conn);
            int totalPages = (int) Math.ceil((double) totalRecords / numberPerPage);

            request.setAttribute("eventWinners", eventWinnersForCurrentPage);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("numberOfPageBlock", numberOfPageBlock);

            String path = "/WEB-INF/views/event/winList.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(path);
            dispatcher.forward(request, response);

            return null;
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

}
