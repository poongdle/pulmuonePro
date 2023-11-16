package servlets.domain.order.gift;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GiftOrderDTO {
	
	private int giftOrderNo;
	private String memberNo;
	private String giftReceiver;
	private String giftReceiverTel;
	private int giftWay;
	private int giftStatus;
	private String giftOrderDate;
	private int giftCardNo;
	private String giftMessage;
	private int giftNo;
	
}
