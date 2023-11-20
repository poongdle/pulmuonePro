package servlets.mypage.command;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.AuthInfo;
import mvc.command.CommandHandler;
import servlets.mypage.dto.BoxOrderListDTO;
import servlets.mypage.service.MypageService;

public class OrderBox implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderBox.java : MY녹즙 택배배송 주문내역 페이지");
		
		// > 회원 정보 가져오기
		HttpSession session = request.getSession(false);
		AuthInfo member = (AuthInfo) session.getAttribute("auth");
		int memberNo = member.getMemberNo();
		
		// > service 객체 생성
		MypageService service = new MypageService();
		
		// 1. 총 택배배송 주문 건수
		int boxOrderCnt = service.boxOrderCnt(memberNo);
		request.setAttribute("boxOrderCnt", boxOrderCnt);
		
		// 2. 택배배송 리스트 조회
		String startSearchDate = request.getParameter("startSearchDate");
		String endSearchDate = request.getParameter("endSearchDate");
		
		if (startSearchDate == null || endSearchDate == null) {
			Date today = new Date();
			int month = today.getMonth()+1;
			endSearchDate = String.format("%d.%d.%d", today.getYear()+1900, month, today.getDate());
			Date threeMonAgo = new Date();
			threeMonAgo.setMonth(month-3);
			startSearchDate = String.format("%d.%d.%d", threeMonAgo.getYear()+1900, threeMonAgo.getMonth()+1, threeMonAgo.getDate());
		} // if
		
		ArrayList<BoxOrderListDTO> boxOrderList = service.selectBoxOrderList(memberNo, startSearchDate, endSearchDate);
		request.setAttribute("boxOrderList", boxOrderList);
		
		return "/WEB-INF/views/mypage/order/box/orderBox.jsp";
	}

}
