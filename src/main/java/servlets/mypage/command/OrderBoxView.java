package servlets.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.mypage.dto.BoxOrderListDTO;
import servlets.mypage.service.MypageService;

public class OrderBoxView implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderBox.java : MY녹즙 택배배송 주문내역 상세보기 페이지");
		
		// > service 객체 생성
		MypageService service = new MypageService();
		
		// > 주문번호 가져오기
		int orderNo = Integer.parseInt(request.getParameter("boxOrderNo"));
		
		// 1. 주문일 조회
		BoxOrderListDTO boxOrder = service.selectBoxOrder(orderNo);
		request.setAttribute("boxOrder", boxOrder);
		
		// 2. 상품 타입, 상품명, 상품 용량, 주문수량, 주문상태, 상품가격, trackingNo
		// 3. 배송지 정보(이름, 연락처, 우편번호, 주소, 상세주소, 메모)
		// 4. 결제정보(판매가, 할인판매가, 쿠폰할인금액, 배송비, 결제수단, 최종결제금액)
		// 5. 사용된 쿠폰(이름, 혜택(금액/율)
		
		/*
		// 1. 총 택배배송 주문 건수
		int boxOrderCnt = service.boxOrderCnt(memberNo);
		request.setAttribute("boxOrderCnt", boxOrderCnt);
		*/
		
		return "/WEB-INF/views/mypage/order/box/orderBoxView.jsp";
	}

}
