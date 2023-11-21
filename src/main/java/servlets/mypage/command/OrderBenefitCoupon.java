package servlets.mypage.command;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.AuthInfo;
import mvc.command.CommandHandler;
import servlets.mypage.dto.BoxOrderListDTO;
import servlets.mypage.service.MypageService;

public class OrderBenefitCoupon implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		return "/WEB-INF/views/mypage/order/benefit/coupon.jsp";
	}

}
