package servlets.order.persistence;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import servlets.order.domain.BoxOrderInfoDTO;
import servlets.order.domain.BoxOrderProductDTO;
import servlets.order.domain.BoxPayDTO;
import servlets.order.domain.BoxShipDTO;
import servlets.order.domain.OrderAddrBookDTO;
import servlets.order.domain.OrderCouponDTO;
import servlets.order.domain.OrderMemberInfoDTO;

public interface BoxOrderDAO {
	
	// 주문서 작성
	// 1. 상품 정보 조회
	ArrayList<BoxOrderProductDTO> selectProducts(Connection conn, String [] productsNo) throws SQLException;
	// 2. 사용자 이름, 전화번호 조회
	OrderMemberInfoDTO getNameAndTel(Connection conn, int memberNo) throws SQLException;
	// 3. 선택한 상품 가격 조회
	int getProductsPrice(Connection conn, String[] productsNo) throws SQLException;
	// 4. 사용 가능한 쿠폰 보유 리스트 조회
	ArrayList<OrderCouponDTO> selectCoupon(Connection conn, int memberNo, int priductsPrice) throws SQLException;
	
	// 5. 주문, 주문 상품 정보, 배송지 정보 추가
	int insertBoxOrder(Connection conn, int memberNo, int boxOrderStatus) throws SQLException;
	int insertBoxOrderedProducts(Connection conn, int boxOrderNo, String productsNo, int productsCnt) throws SQLException;
	int insertBoxShip(Connection conn, BoxShipDTO dto) throws SQLException;
	
	// 6. 주소록 추가
	int insertAddrBook(Connection conn, OrderAddrBookDTO dto) throws SQLException;
	
	// 결제 후
	// 7. 결제 정보 추가
	int insertPay(Connection conn, BoxPayDTO dto) throws SQLException;
	// 8. 쿠폰 사용 처리
	int updateHaveCoupon(Connection conn, int boxPayNo, int memberNo, int couponNo) throws SQLException;
	
	// 주문 후 주문서 확인 창
	// 9. 주문한 상품 리스트 조회
	ArrayList<BoxOrderProductDTO> selectOrderProductList(Connection conn, int boxOrderNo) throws SQLException;
	// 10. 배송지 정보(우편번호, 주소, 상세주소, 배송메모), 결제 정보 조회(상품판매가, 상품할인판매가, 쿠폰할인금액, 배송비, 결제수단, 최종결제금액) 
	BoxOrderInfoDTO selectBoxOrderInfo(Connection conn, int boxOrderNo) throws SQLException;
	
}