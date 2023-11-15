package servlets.order.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.AuthInfo;
import domain.order.box.OrderCouponDTO;
import domain.order.box.OrderMemberInfoDTO;
import domain.order.box.BoxOrderProductDTO;
import domain.order.box.OrderAddrBookDTO;
import mvc.command.CommandHandler;
import service.order.box.BoxOrderService;

public class BoxOrder implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("> BoxOrder.process..");
		
		String productsNo [] = request.getParameterValues("productsNo");
		HttpSession session = request.getSession(false);

		AuthInfo member = (AuthInfo) session.getAttribute("auth");
		int memberNo = member.getMemberNo();
		
		BoxOrderService service = BoxOrderService.getInstanse();
		
		ArrayList<BoxOrderProductDTO> plist = service.selectProducts(productsNo);
		OrderMemberInfoDTO miDto = service.getNameAndTel(memberNo);
		ArrayList<OrderCouponDTO> clist = service.selectCoupon(memberNo, productsNo);
		request.setAttribute("productList", plist);
		request.setAttribute("miDto", miDto);
		if (clist != null) {
			request.setAttribute("couponList", clist);
		} // if
		
		 
		
		return "/WEB-INF/views/order/box/step1.jsp";
	} // process()

}
