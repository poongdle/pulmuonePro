package servlets.persistence.order;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import servlets.domain.order.box.BoxOrderDTO;
import servlets.domain.order.box.BoxOrderProductDTO;
import servlets.domain.order.box.BoxPayDTO;
import servlets.domain.order.box.BoxShipDTO;
import servlets.domain.order.box.OrderAddrBookDTO;
import servlets.domain.order.box.OrderCouponDTO;
import servlets.domain.order.box.OrderMemberInfoDTO;

public interface BoxOrderImpl {
	
	// 주문서 작성
	// 1. 상품 정보 조회
	ArrayList<BoxOrderProductDTO> selectProducts(Connection conn, String [] productsNo) throws SQLException;
	// 2. 사용자 이름, 전화번호 조회
	OrderMemberInfoDTO getNameAndTel(Connection conn, int memberNo) throws SQLException;
	// 3. 선택한 상품 가격 조회
	int getProductsPrice(Connection conn, String[] productsNo) throws SQLException;
	// 4. 사용 가능한 쿠폰 보유 리스트 조회
	ArrayList<OrderCouponDTO> selectCoupon(Connection conn, int memberNo, int priductsPrice) throws SQLException;
	
	// 2. 주문, 주문 상품 정보, 배송지 정보 추가
	int insertBoxOrder(Connection conn, BoxOrderDTO dto) throws SQLException;
	int insertBoxOrderedProducts(Connection conn, BoxOrderProductDTO dto) throws SQLException;
	int insertBoxShip(Connection conn, BoxShipDTO dto) throws SQLException;
	
	
	// 조회
	// 2. 주문내역 조회
	ArrayList<BoxOrderDTO> selectList(Connection conn, int memberNo, Date startSearchDate, Date endSearchDate, int pageNo) throws SQLException;
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