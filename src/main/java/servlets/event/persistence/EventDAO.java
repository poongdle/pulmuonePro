package servlets.event.persistence;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import servlets.event.domain.EventDTO;
import servlets.event.domain.EventThumbnailDTO;

public class EventDAO implements IEvent{
	private Connection conn;

	public EventDAO(Connection conn) {
		this.conn = conn;
	}

	@Override
	public void createEvent(EventDTO event) throws SQLException {
		String sql = "INSERT INTO event (event_no, event_name, event_start, event_end, event_notice) VALUES (?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, event.getEvent_no());
		pstmt.setString(2, event.getEvent_name());
		pstmt.setDate(3, event.getEvent_start());
		pstmt.setDate(4, event.getEvent_end());
		pstmt.setString(5, event.getEvent_notice());
		pstmt.executeUpdate();
	}

	@Override
	public EventDTO viewEvent(int event_no) throws SQLException {
		String sql = "SELECT * FROM even WHERE event_no = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, event_no);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			EventDTO event = new EventDTO(
					rs.getInt("event_no"),
					rs.getString("event_name"),
					rs.getDate("event_start"),
					rs.getDate("event_end"),
					rs.getString("event_notice"),
					null
					);
			return event;
		} else {
			return null;
		}
	}

	@Override
	public void updateEvent(EventDTO event) throws SQLException {
		String sql = "UPDATE event SET event_name = ?, event_start = ?, event_end = ?, event_notice = ? WHERE event_no = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, event.getEvent_name());
		pstmt.setDate(2, event.getEvent_start());
		pstmt.setDate(3, event.getEvent_end());
		pstmt.setString(4, event.getEvent_notice());
		pstmt.setInt(5, event.getEvent_no());
		pstmt.executeUpdate();
	}

	@Override
	public void deleteEvent(int event_no) throws SQLException {
		String sql = "DELETE FROM event WHERE event_no = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, event_no);
		pstmt.executeUpdate();
	}

	@Override
	public HashMap<String, ArrayList<EventDTO>> select(int currentPage, int numberPerPage, boolean BEvent) throws SQLException {
	    int begin = (currentPage-1)*numberPerPage+1 ;
	    int end = begin+numberPerPage-1;

	    String sql = null;
	    if (BEvent) { // 진행중
	        sql = "SELECT * "
	                + "FROM ( "
	                + "        SELECT ROWNUM no, t.* "
	                + "        FROM ("
	                + "                SELECT e.event_no, e.event_name, e.event_start, e.event_end, e.event_notice, "
	                + "       				et.img_no, et.system_name, et.origin_name, et.img_size, et.img_type, et.img_path "
					+ "                FROM event e LEFT JOIN event_thumbnail et ON e.event_no = et.event_no "
					+ "                WHERE e.event_end >= SYSDATE "
					+ "                ORDER BY e.event_no DESC "
	                + "        ) t"
	                + ") "
	                + "WHERE no BETWEEN ? AND ?";
	    } else { // 종료된 이벤트
	        sql = "SELECT * "
	                + "FROM ( "
	                + "        SELECT ROWNUM no, t.* "
	                + "        FROM ("
	                + "                SELECT e.event_no, e.event_name, e.event_start, e.event_end, e.event_notice, "
	                + "              		et.img_no, et.system_name, et.origin_name, et.img_size, et.img_type, et.img_path "
	                + "				   FROM event e LEFT JOIN event_thumbnail et ON e.event_no = et.event_no "
	                + "				   WHERE event_end < SYSDATE "
	                + "                ORDER BY e.event_no DESC "
	                + "        ) t"
	                + ") "
	                + "WHERE no BETWEEN ? AND ?";
	    }

	    ResultSet rs = null;
	    PreparedStatement pstmt = null;
	    ArrayList<EventDTO> onEvent = new ArrayList<>();
	    ArrayList<EventDTO> endEvent = new ArrayList<>();
	    HashMap<String, ArrayList<EventDTO>> eventMap = new HashMap<>();
	    EventDTO event = null;

	    int eventNo;
	    String eventName;
	    Date eventStart;
	    Date eventEnd;
	    String eventNotice;

	    int offset = (currentPage - 1) * numberPerPage;

	    try {
	        pstmt = conn.prepareStatement(sql); 
	        pstmt.setInt(1, begin);
	        pstmt.setInt(2, end);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            do { 
	                eventNo = rs.getInt("event_no");
	                eventName = rs.getString("event_name");
	                eventStart = rs.getDate("event_start");
	                eventEnd = rs.getDate("event_end");
	                eventNotice = rs.getString("event_notice");
	                
	                EventThumbnailDTO thumbnail = EventThumbnailDTO.builder()
	                        .img_no(rs.getInt("img_no"))
	                        .event_no(rs.getInt("event_no"))
	                        .system_name(rs.getString("system_name"))
	                        .origin_name(rs.getString("origin_name"))
	                        .img_size(rs.getString("img_size"))
	                        .img_type(rs.getString("img_type"))
	                        .img_path(rs.getString("img_path"))
	                        .build();

	                event = EventDTO.builder()
	                        .event_no(eventNo)
	                        .event_name(eventName)
	                        .event_start(eventStart)
	                        .event_end(eventEnd)
	                        .event_notice(eventNotice)
	                        .thumbnail(thumbnail)
	                        .build();
	                        
	                // 이벤트가 진행 중인지 확인
	                if (!event.getEvent_end().toLocalDate().isBefore(LocalDate.now())) {
	                    onEvent.add(event);  // 진행 중인 이벤트 추가
	                } else {
	                    endEvent.add(event);  // 종료된 이벤트 추가
	                }
	            } while (rs.next());
	        } 
	        

	    } catch (SQLException e) { 
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();            
	        } catch (SQLException e) { 
	            e.printStackTrace();
	        }
	    } 

	    // 두 리스트를 맵에 추가
	    eventMap.put("onEvent", onEvent);
	    eventMap.put("endEvent", endEvent);

	    return eventMap;
	}

	@Override
	public int getTotalRecords() throws SQLException {
		
		int totalRecords = 0;

		String sql = "SELECT COUNT(*) FROM event ";
		PreparedStatement pstmt = this.conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) totalRecords = rs.getInt(1);

		rs.close();
		pstmt.close();
		return totalRecords;
		
	}

	@Override
	public int getTotalPages(int numberPerPage, boolean BEvent) throws SQLException {
	    int totalPages = 0;
	    String sql = null;
	    if (BEvent) {
	        sql = "SELECT CEIL(COUNT(*)/?) FROM event WHERE event_end >= SYSDATE";
	    } else {
	        sql = "SELECT CEIL(COUNT(*)/?) FROM event WHERE event_end < SYSDATE";
	    }

	    PreparedStatement pstmt = this.conn.prepareStatement(sql);
	    pstmt.setInt(1, numberPerPage);
	    ResultSet rs = pstmt.executeQuery();
	    if(rs.next()) totalPages = rs.getInt(1);
	    rs.close();
	    pstmt.close();

	    return totalPages;
	}
}

