package servlets.event.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@Data
@Builder
@NoArgsConstructor
public class EventViewDTO {

	private List<EventImageDTO> images;  // 이미지 리스트
    private EventDTO event;
	
}
