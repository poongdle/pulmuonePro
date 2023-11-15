package service.order.box;

import java.sql.Connection;
import java.util.ArrayList;

import domain.order.box.OrderCouponDTO;
import domain.order.box.OrderMemberInfoDTO;
import domain.order.box.BoxOrderProductDTO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import persistence.order.BoxOrderDAO;

public class BoxOrderService {

	// 싱글톤
	private BoxOrderService() {}
	private static BoxOrderService instanse = null;
	public static BoxOrderService getInstanse() {
		if (instanse == null) {
			instanse = new BoxOrderService();
		} // if
		return instanse;
	} // getInstanse()
	
	
	private Connection conn = null;
	
	public ArrayList<BoxOrderProductDTO> selectProducts(String [] productsNo) {
		try {
			conn = ConnectionProvider.getConnection();
			BoxOrderDAO dao = BoxOrderDAO.getInstance();
			ArrayList<BoxOrderProductDTO> list = null;
			list = dao.selectProducts(conn, productsNo);
			return list;
		} catch (Exception e) {
			System.out.println("BoxOrderService.selectProducts() 에러");
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		} // try
	} // selectProducts()
	
	public ArrayList<OrderCouponDTO> selectCoupon(int memberNo, String [] productsNo) {
		try {
			conn = ConnectionProvider.getConnection();
			BoxOrderDAO dao = BoxOrderDAO.getInstance();
			// 상품 가격 구하기
			int priductsPrice = dao.getProductsPrice(conn, productsNo);
			// 사용 가능한 쿠폰 조회 하기
			ArrayList<OrderCouponDTO> list = null;
			list = dao.selectCoupon(conn, memberNo, priductsPrice);
			return list;
		} catch (Exception e) {
			System.out.println("BoxOrderService.selectCoupon() 에러");
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		} // try
	} // selectCoupon()
	
	public OrderMemberInfoDTO getNameAndTel(int memberNo) {
		try {
			conn = ConnectionProvider.getConnection();
			BoxOrderDAO dao = BoxOrderDAO.getInstance();
			OrderMemberInfoDTO dto = null;
			dto = dao.getNameAndTel(conn, memberNo);
			return dto;
		} catch (Exception e) {
			System.out.println("BoxOrderService.getNameAndTel() 에러");
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		} // try
	} // getNameAndTel()
}
