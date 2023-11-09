package servlets.order.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.order.box.ProductsDTO;
import mvc.command.CommandHandler;
import service.order.box.BoxOrderService;

public class BoxOrder implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("> BoxOrder.process..");
		
		String num [] = request.getParameterValues("produtsNo");
		
		BoxOrderService service = BoxOrderService.getInstanse();
		ArrayList<ProductsDTO> list = service.selectProducts(num);
		request.setAttribute("productList", list);
		return "/WEB-INF/views/order/box/step1.jsp";
	} // process()

}
