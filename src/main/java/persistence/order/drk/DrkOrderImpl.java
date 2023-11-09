package persistence.order.drk;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import domain.order.drk.AcntInfoDTO;
import domain.order.drk.CardInfoDTO;
import domain.order.drk.DrkChangesDTO;
import domain.order.drk.DrkHistoryDTO;
import domain.order.drk.DrkOrderDTO;
import domain.order.drk.DrkPayDTO;
import domain.order.drk.DrkScheduleDTO;
import domain.order.drk.DrkShipDTO;

public interface DrkOrderImpl {
	
	// 1. 주문, 배송지, 결제(카드, 계좌) 정보 추가
	int insertDrkOrder(Connection conn, DrkOrderDTO dto) throws SQLException;
	int insertDrkShip(Connection conn, DrkShipDTO dto) throws SQLException;
	int insertCardInfo(Connection conn, CardInfoDTO dto) throws SQLException;
	int insertAcntInfo(Connection conn, AcntInfoDTO dto) throws SQLException;
	
	// 2. 주문 취소
	int deleteOrder(Connection conn, DrkOrderDTO oDto, DrkShipDTO sDto, CardInfoDTO cDto, AcntInfoDTO aDto) throws SQLException;
	
	
	// 가맹점 확정 후
	// 3. 음용스케줄, 음용내역 추가
	int insertDrkSchedule(Connection conn, DrkScheduleDTO dto) throws SQLException;
	int insertDrkHistory(Connection conn, DrkHistoryDTO dto) throws SQLException;
	
	
	// 음용 시작 후
	// 4. 매달 25일 - 결제 추가
	int insertPay(Connection conn, DrkPayDTO dto) throws SQLException;
	
	// 5. 음용스케줄 변경
	int updateDrkScedule(Connection conn, DrkScheduleDTO dto) throws SQLException;
	int updateDrkHistory(Connection conn, DrkHistoryDTO dto) throws SQLException;
	int updateDrkChanges(Connection conn, DrkChangesDTO dto) throws SQLException;
	
	
	// 조회
	// 6. 주문 내역 조회
	List<DrkOrderDTO> selectList(Connection conn, int memberNo);
	
}