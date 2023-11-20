package servlets.order.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DrkHistoryDTO {
	
	private int drkHistoryNo;
	private int drkScheduleNo;
	private int drkOrderNo;
	private int productsNo;
	private int productsCnt;
	private String drkDate;
	private int drkDay;
	private int drkComplete;
	
}
