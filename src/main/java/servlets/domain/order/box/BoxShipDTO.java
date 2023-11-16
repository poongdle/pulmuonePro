package servlets.domain.order.box;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoxShipDTO {
	
	private int boxOrderNo;
	private String boxReceiver;
	private String boxTel;
	private String boxZipCode;
	private String boxAddr;
	private String boxAddrDetail;
	private String boxMemo;
	private String trackingNo;
	
}
