package servlets.event.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@AllArgsConstructor
@Data
@Builder
public class EventThumbnailDTO {

	private int img_no;
	private int event_no;
	private String system_name;
	private String origin_name;
	private String img_size;
	private String img_type;
	private String img_path;
	
}
