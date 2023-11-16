package servlets.domain.order.drk;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DrkShipDTO {
	
	private int drkOrderNo;
	private String drkReceiver;
	private String drkTel;
	private String drkZipCode;
	private String drkAddr;
	private String drkAddrDetail;
	private String drkMemo;
	private int drkShipLoc;
	
}
