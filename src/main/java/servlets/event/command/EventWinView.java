package servlets.event.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.event.domain.EventWinnerDTO;
import servlets.event.service.WinViewService;

public class EventWinView implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int win_board_no = Integer.parseInt(request.getParameter("win_board_no"));

        WinViewService winViewService = WinViewService.getInstance();
        EventWinnerDTO dto = winViewService.selectWinner(win_board_no);

        request.setAttribute("winnerView", dto);

        return "/WEB-INF/views/event/winnerView.jsp";
    }

}
