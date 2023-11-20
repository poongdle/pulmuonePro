package servlets.order.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoxOrderInfoDTO {

	private String zipCode;
	private String addr;
	private String addrDetail;
	private String memo;
	private int price;
	private int salePrice;
	private int discountPrice;
	private int shippingFee;
	private int finalPrice;
	private int payMethod;
	
}
