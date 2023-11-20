package servlets.event.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@Builder
@NoArgsConstructor
public class EventDTO {

	private int event_no;
	private String event_name;
	private Date event_start;
	private Date event_end;
	private String event_notice;
	private int event_cmt;
	
	private EventThumbnailDTO thumbnail;
	
}
