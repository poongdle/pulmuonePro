package servlets.domain.order.gift;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GiftSetDTO {
	
	private int giftNo;
	private String giftName;
	private String giftDescription;
	private String monProductsNo;
	private String tueProductsNo;
	private String wedProductsNo;
	private String thuProductsNo;
	private String friProductsNo;
	private int giftOriginalPrice;
	
}
