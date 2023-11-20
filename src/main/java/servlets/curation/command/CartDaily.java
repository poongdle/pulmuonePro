package servlets.curation.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.curation.domain.CurationDTO;
import servlets.curation.service.CartService;

public class CartDaily implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("Cart start");

		request.setCharacterEncoding("UTF-8");
		int cart_no =Integer.parseInt( request.getParameter("cart_no") ); 
		int member_no =Integer.parseInt( request.getParameter("member_no") );
		String products_no = request.getParameter("products_no");
		int mon_cnt =Integer.parseInt( request.getParameter("mon_cnt") );
		int tue_cnt =Integer.parseInt( request.getParameter("tue_cnt") );
		int wed_cnt =Integer.parseInt( request.getParameter("wed_cnt") );
		int thu_cnt =Integer.parseInt( request.getParameter("thu_cnt") );
		int fir_cnt =Integer.parseInt( request.getParameter("fir_cnt") );
		String reg_date = request.getParameter("reg_date");

		CurationDTO dto = new CurationDTO();
		dto.setCart_no(cart_no);
		dto.setMember_no(member_no);
		dto.setProducts_no(products_no);
		dto.setMon_cnt(mon_cnt);
		dto.setTue_cnt(tue_cnt);
		dto.setWed_cnt(wed_cnt);
		dto.setWed_cnt(wed_cnt);
		dto.setFir_cnt(fir_cnt);
		dto.setReg_date(reg_date);

		CartService cartService = CartService.getInstance();
		int list = cartService.insert(dto);
		
		request.setAttribute("list", list);

	return "/WEB-INF/views/curation/cartdaily.jsp";

}

}
