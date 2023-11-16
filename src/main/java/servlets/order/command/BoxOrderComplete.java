package servlets.order.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.AuthInfo;
import mvc.command.CommandHandler;
import servlets.order.domain.BoxOrderProductDTO;
import servlets.order.domain.OrderAddrBookDTO;
import servlets.order.domain.OrderCouponDTO;
import servlets.order.domain.OrderMemberInfoDTO;
import servlets.order.service.BoxOrderService;

public class BoxOrderComplete implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("> BoxOrderComplete.process..");
		
		/*
		 * String productsNo [] = request.getParameterValues("productsNo"); HttpSession
		 * session = request.getSession(false);
		 * 
		 * AuthInfo member = (AuthInfo) session.getAttribute("auth"); int memberNo =
		 * member.getMemberNo();
		 * 
		 * BoxOrderService service = BoxOrderService.getInstanse();
		 * 
		 * ArrayList<BoxOrderProductDTO> plist = service.selectProducts(productsNo);
		 * OrderMemberInfoDTO miDto = service.getNameAndTel(memberNo);
		 * ArrayList<OrderCouponDTO> clist = service.selectCoupon(memberNo, productsNo);
		 * request.setAttribute("productList", plist); request.setAttribute("miDto",
		 * miDto); if (clist != null) { request.setAttribute("couponList", clist); } //
		 * if
		 */
		
		
		
		return "/WEB-INF/views/order/box/step2.jsp";
	} // process()

}
