package domain.order.gift;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GiftShipDTO {
	
	private int giftOrderNo;
	private int drkOrderNo;
	private String receiver;
	private String receiverTel;
	private String giftZipCode;
	private String giftAddr;
	private String giftAddrDetail;
	private String giftMemo;
	private String entranceInfo;
	private int shipLoc;
	private String giftStartDate;
	private String franchiseNo;
	
}
