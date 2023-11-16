package servlets.persistence.order;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import servlets.order.domain.AcntInfoDTO;
import servlets.order.domain.CardInfoDTO;
import servlets.order.domain.DrkChangesDTO;
import servlets.order.domain.DrkHistoryDTO;
import servlets.order.domain.DrkOrderDTO;
import servlets.order.domain.DrkPayDTO;
import servlets.order.domain.DrkScheduleDTO;
import servlets.order.domain.DrkShipDTO;

public interface DrkOrderImpl {
	
	// 1. 주문, 배송지, 결제(카드, 계좌) 정보 추가
	int insertDrkOrder(Connection conn, DrkOrderDTO dto) throws SQLException;
	int insertDrkShip(Connection conn, DrkShipDTO dto) throws SQLException;
	int insertCardInfo(Connection conn, CardInfoDTO dto) throws SQLException;
	int insertAcntInfo(Connection conn, AcntInfoDTO dto) throws SQLException;
	
	// 2. 주문 취소
	int deleteOrder(Connection conn, int drkOrderNo) throws SQLException;
	
	
	// 가맹점 확정 후
	// 3. 음용스케줄, 음용내역 추가
	int insertDrkSchedule(Connection conn, DrkScheduleDTO dto) throws SQLException;
	int insertDrkHistory(Connection conn, DrkHistoryDTO dto) throws SQLException;
	
	
	// 음용 시작 후
	// 4. 매달 25일 - 결제 추가
	int insertPay(Connection conn, DrkPayDTO dto) throws SQLException;
	
	
	// 조회
	// 5. 음용 내역 조회
	List<DrkOrderDTO> selectList(Connection conn, int memberNo, int drkStatus) throws SQLException;
	
	// 6. 음용 상세 내역 조회
	DrkOrderDTO selectOne(Connection conn, int drkOrderNo) throws SQLException;
	 
	// 7. 애칭 수정
	int updateDrkOrderName(Connection conn, String name) throws SQLException;
	
	// 8. 결제 수단 변경
	int updateDrkPay(Connection conn, CardInfoDTO cDto, AcntInfoDTO aDto) throws SQLException;

	// 9. 음용 중지 신청
	int updateDrkOrder(Connection conn, int drkOrderNo, String stopDate) throws SQLException;
	
	// 10. 음용스케줄, 음용스케줄변경내역 추가, 음용내역 변경
	int changeDrkScedule(Connection conn, DrkScheduleDTO sDto, DrkChangesDTO cDto) throws SQLException;
	// updateDrkHistory
	
	// 11. 변경 내역 조회
	List<DrkChangesDTO> selectChangesList(Connection conn, int memberNo) throws SQLException;
	
	// 12. 변경 상세 내역 조회
	DrkChangesDTO selectChangesOne(Connection conn, int drkChangesNo) throws SQLException;
	
}