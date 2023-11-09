package service.order.box;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import domain.order.box.ProductsDTO;
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
	
	public ArrayList<ProductsDTO> selectProducts(String [] productsNo) {
		try {
			conn = ConnectionProvider.getConnection();
			BoxOrderDAO dao = BoxOrderDAO.getInstance();
			ArrayList<ProductsDTO> list = null;
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
	
}
