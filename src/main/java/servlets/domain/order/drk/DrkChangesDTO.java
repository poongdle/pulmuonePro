package servlets.domain.order.drk;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DrkChangesDTO {
	
	private int drkChangesNo;
	private int drkScheduleNo;
	private int drkOrderNo;
	private int changeType;
	private String changeDate;
	private String changeStartDate;
	private String changeEndDate;
	private int changePeriod;
	private String changeShipStartDate;
	private String changeShipEndDate;
	
}
