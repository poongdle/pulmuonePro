package servlets.event.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@AllArgsConstructor
@Data
@Builder
public class EventDTO {

	private int event_no;
	private String event_name;
	private Date event_start;
	private Date event_end;
	private String event_notice;
	
	private EventThumbnailDTO thumbnail;
	
}
