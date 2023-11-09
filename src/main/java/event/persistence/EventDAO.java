package event.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import event.domain.EventDTO;

public class EventDAO implements IEvent{
	private Connection conn;

	public EventDAO(Connection conn) {
		this.conn = conn;
	}

	@Override
	public void createEvent(EventDTO event) throws SQLException {
		String sql = "INSERT INTO events (event_no, event_name, event_start, event_end, event_notice) VALUES (?, ?, ?, ?, ?)";
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
		String sql = "SELECT * FROM events WHERE event_no = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, event_no);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			EventDTO event = new EventDTO(
					rs.getInt("event_no"),
					rs.getString("event_name"),
					rs.getDate("event_start"),
					rs.getDate("event_end"),
					rs.getString("event_notice")
					);
			return event;
		} else {
			return null;
		}
	}

	@Override
	public void updateEvent(EventDTO event) throws SQLException {
		String sql = "UPDATE events SET event_name = ?, event_start = ?, event_end = ?, event_notice = ? WHERE event_no = ?";
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
		String sql = "DELETE FROM events WHERE event_no = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, event_no);
		pstmt.executeUpdate();
	}
}

