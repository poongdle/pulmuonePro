package servlets.event.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EventImageDTO {

	private String img_no;
    private String system_name;
    private String origin_name;
    private String img_size;
    private String img_type;
    private String img_path;
    private String img_link;
	
}
