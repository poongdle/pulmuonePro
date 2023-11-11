package servlets.order.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import domain.order.box.OrderCouponDTO;
import domain.order.box.BoxOrderProductDTO;
import mvc.command.CommandHandler;
import service.order.box.BoxOrderService;

public class BoxOrder implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("> BoxOrder.process..");
		
		String productsNo [] = request.getParameterValues("productsNo");
		HttpSession session = request.getSession(false);
		int memberNo = Integer.parseInt((String) session.getAttribute("auth"));
		
		BoxOrderService service = BoxOrderService.getInstanse();
		
		ArrayList<BoxOrderProductDTO> plist = service.selectProducts(productsNo);
		// ArrayList<AddrBookDTO> alist = service.selectAddrBook(memberNo);
		ArrayList<OrderCouponDTO> clist = service.selectCoupon(memberNo, productsNo);
		request.setAttribute("productList", plist);
		if (clist != null) {
			request.setAttribute("couponList", clist);
		} // if
		
		return "/WEB-INF/views/order/box/step1.jsp";
	} // process()

}
