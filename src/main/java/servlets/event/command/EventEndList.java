package servlets.event.command;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import event.domain.EventDTO;
import event.domain.PageDTO;
import event.persistence.EventDAO;
import jdbc.connection.ConnectionProvider;
import mvc.command.CommandHandler;

public class EventEndList implements CommandHandler {

	@Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

        int currentPage = 1; // 현재 페이지 번호
        int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
        int numberOfPageBlock = 10;
        int totalPages = 0; // 총 페이지 수

        try {           
            currentPage =  Integer.parseInt( request.getParameter("currentpage") );
        } catch (Exception e) {
            // 예외 처리
        }

        HashMap<String, ArrayList<EventDTO>> eventMap = null;

        try {
            Connection conn = ConnectionProvider.getConnection();
            EventDAO dao = new EventDAO(conn);
            eventMap = dao.select(currentPage, numberPerPage, false);
            totalPages = dao.getTotalPages(numberPerPage, false);
            PageDTO pDto = new PageDTO(currentPage, numberPerPage, numberOfPageBlock, totalPages);
            
            // 진행 중인 이벤트 리스트를 가져옵니다.
            ArrayList<EventDTO> endEvent = eventMap.get("endEvent");

            // 1. 포워딩 전 데이터 저장
            request.setAttribute("endEvent", endEvent);
            request.setAttribute("pDto", pDto);
            // 2. 포워딩
            String path = "/WEB-INF/views/event/end/EndList.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(path);
            dispatcher.forward(request, response);

            return null;

        } catch (SQLException | NamingException e) {
            System.out.println("> List.doGet() Exception");
            e.printStackTrace();
        }
        return null;
    }
	
}
