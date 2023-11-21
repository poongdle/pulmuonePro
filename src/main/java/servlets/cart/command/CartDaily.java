package servlets.cart.command;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import servlets.cart.domain.CartDTO;
import servlets.cart.service.CartService;


public class CartDaily implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {


		System.out.println("> Cart start..");

		String jsonStr = request.getRealPath("url");
		Pattern pattern = Pattern.compile("/cart/daily.do");
		Matcher matcher = pattern.matcher(jsonStr);

		ArrayList<String> itemCodeList = new ArrayList<>();
		ArrayList<int []> dayQtyList = new ArrayList<>();

		 // list에 데이터 담기
        String itemCode, dayQtyStr;
        while (matcher.find()) {
            itemCode = matcher.group(1);
            dayQtyStr = matcher.group(2);


		// dayQtyStr 처리
		String [] dayQtyArr = dayQtyStr.split(",");
		int[] dayQty = new int[dayQtyArr.length];
		// parseInt
		for (int i = 0; i < dayQtyArr.length; i++) {
			dayQty[i] = Integer.parseInt(dayQtyArr[i].trim());
		} // for

		// 추출한 데이터 리스트에 저장
		itemCodeList.add(itemCode);
		dayQtyList.add(dayQty);

		System.out.println(itemCodeList);
      } // while
      
	
		CartService cartService = CartService.getInstance();
		ArrayList<CartDTO> list = cartService.cartList(itemCodeList);

		request.setAttribute("list", list);


		return "/WEB-INF/views/cart/cartdaily.jsp";

	}

}
