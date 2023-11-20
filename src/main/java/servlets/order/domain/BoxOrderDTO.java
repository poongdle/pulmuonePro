package servlets.order.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoxOrderDTO {
	
	private int boxOrderNo;
	private int memberNo;
	private int boxOrderStatus;
	private String boxOrderDate;
	
}
