package servlets.order.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderCouponDTO {
	
	private int couponNo;
	private String couponName;
	private double discount;
	private int duplication;
	private int minPrice;
	private int maxDiscount;
	
}
