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
public class EventWinnerDTO {

	private int win_board_no;
	private String win_title;
	private String win_content;
	private Date win_regdate;
	
}
