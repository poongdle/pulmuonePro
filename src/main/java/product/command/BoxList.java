package product.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class BoxList implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(">BoxList.process ");
//		ListService listService = ListService.getInstance();
//	    List<ReplyBoardDTO> list = listService.select();
		
		
		//1.  포워딩 전 데이터 저장
//		request.setAttribute("list", list);
//		request.setAttribute("pageBlock", "[1] 2 3 4 5 6 7 8 9 10 >");

		return "/WEB-INF/views/product/BoxList.jsp";
		
		
	}

}
