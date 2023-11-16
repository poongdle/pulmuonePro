package domain.order.drk;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DrkPayDTO {
	
	private int drkPayNo;
	private int drkOrderNo;
	private String drkPayDateTime;
	private int drkPrice;
	private int drkDiscountPrice;
	private int drkFinalPrice;
	private int drkPayMethod;	// string?
	private String payInfoNo;
	private int drkPayStatus;
	
}
