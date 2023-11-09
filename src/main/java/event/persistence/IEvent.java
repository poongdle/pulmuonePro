package event.persistence;

import java.sql.SQLException;

import event.domain.EventDTO;

public interface IEvent {
	
    void createEvent(EventDTO event) throws SQLException;
    
    EventDTO viewEvent(int event_no) throws SQLException;
    
    void updateEvent(EventDTO event) throws SQLException;
    
    void deleteEvent(int event_no) throws SQLException;
	
}
