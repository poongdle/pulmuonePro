package servlets.order.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DrkOrderDTO {
	
	private int drkOrderNo;
	private int memberNo;
	private String drkOrderName;
	private String drkStartDate;
	private int drkOrderType;
	private String drkOrderDate;
	private int franchiseNo;
	private int drkStatus;
	
}
