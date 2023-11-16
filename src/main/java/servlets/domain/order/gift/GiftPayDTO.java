package servlets.domain.order.gift;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GiftPayDTO {
	
	private int drkOrderNo;
	private String giftPayDateTime;
	private int giftPayStatus;
	private int giftFinalPrice;
	
}
