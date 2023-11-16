package servlets.event.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class EventCommentDTO {

	private int comment_no;
	private int event_no;
	private int member_no;
	private Date write_date;
	private String content;
	
}
