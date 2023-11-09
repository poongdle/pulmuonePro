package persistence.order;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Date;
import java.util.List;

import domain.order.box.BoxOrderDTO;
import domain.order.box.BoxOrderProductsDTO;
import domain.order.box.BoxPayDTO;
import domain.order.box.BoxShipDTO;
import domain.order.box.ProductsDTO;

public interface BoxOrderImpl {
	
	// 상품 정보 조회
	List<ProductsDTO> selectProducts(Connection conn, String [] productsNo) throws SQLException;
	
	// 1. 주문, 주문 상품 정보, 배송지 정보 추가
	int insertBoxOrder(Connection conn, BoxOrderDTO dto) throws SQLException;
	int insertBoxOrderProducts(Connection conn, BoxOrderProductsDTO dto) throws SQLException;
	int insertBoxShip(Connection conn, BoxShipDTO dto) throws SQLException;
	
	
	// 조회
	// 2. 주문내역 조회
	List<BoxOrderDTO> selectList(Connection conn, int memberNo, Date startSearchDate, Date endSearchDate, int pageNo) throws SQLException;
	// int searchMonth 없어도 될 것 같아서 일단 지움
	
	// 3. 주문 내역 상세 조회
	BoxOrderDTO selectOne(Connection conn, int boxOrderNo) throws SQLException;
	
	// 4. 주문 취소
	int update(Connection conn, int boxOrderNo) throws SQLException;
	
	
	// 결제 후
	// 5. 결제 정보 추가
	int insertPay(Connection conn, BoxPayDTO dto) throws SQLException;
	// delete X
}