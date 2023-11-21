package servlets.mypage.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.AuthInfo;
import mvc.command.CommandHandler;
import servlets.inquiry.service.InquiryListService;
import servlets.mypage.dto.BoxOrderSimpleInfoDTO;
import servlets.mypage.service.MypageService;

public class UserSummary implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("UserSummary.java : MY녹즙 기본 페이지");
		
		// > 회원 정보 가져오기
		HttpSession session = request.getSession(false);
		AuthInfo member = (AuthInfo) session.getAttribute("auth");
		int memberNo = member.getMemberNo();		
		// > service 객체 생성
		MypageService service = new MypageService();
		
		
		// > setAttribute
		// 1. 매일배송 관련
		
		
		// 2. 택배배송 관련
		// 	1) 총 택배배송 주문 건수
		int boxOrderCnt = service.boxOrderCnt(memberNo);
		request.setAttribute("boxOrderCnt", boxOrderCnt);

		// 	2) 택배배송 주문 내역
		// 		a. 결제완료 주문 건수, 배송준비중 주문 건수, 배송중 주문건수, 배송완료 주문건수
		int [] boxOrderStatus = service.boxOrderStatus(memberNo);
		request.setAttribute("boxOrderStatus", boxOrderStatus);
		
		
		// 		b. 최근 2개의 주문 내역 정보(주문번호, 상품명, 결제금액, 주문일자, 주문상태)
		ArrayList<BoxOrderSimpleInfoDTO> boxOrderSimpleInfolist = service.currBoxOrderList(memberNo);
		request.setAttribute("boxOrderSimpleInfolist", boxOrderSimpleInfolist);
		
		
		// 3. 시음선물 관련
		
		
		// 4. 쿠폰 관련
		
		
		// 5. 리뷰 관련
		
		
		// 6. 1:1 문의 관련
		String user_id = member.getMemberId();		
		int totalCount = 0;
		String category = "all";
		InquiryListService inquiryListService = new InquiryListService();
		totalCount = inquiryListService.selectCount(user_id, category);
		request.setAttribute("totalCount", totalCount);
		
		
		return "/WEB-INF/views/mypage/userSummary.jsp";
	}

}
