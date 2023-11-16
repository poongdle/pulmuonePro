package servlets.event.persistence;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import servlets.event.domain.EventDTO;

public interface IEvent {

	void createEvent(EventDTO event) throws SQLException;

	EventDTO viewEvent(int event_no) throws SQLException;

	void updateEvent(EventDTO event) throws SQLException;

	void deleteEvent(int event_no) throws SQLException;

	// 9. 페이징 처리
	HashMap<String, ArrayList<EventDTO>> select(int currentPage, int numberPerPage, boolean isOngoing) throws SQLException;

	// 8-1. 총 레코드 수
	int getTotalRecords() throws SQLException;
	// 8-2. 총 페이지 수
	int getTotalPages(int numberPerPage, boolean BEvent) throws SQLException;

}
