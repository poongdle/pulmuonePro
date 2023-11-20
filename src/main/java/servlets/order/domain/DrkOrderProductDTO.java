package servlets.order.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DrkOrderProductDTO {
	
	private String productsNo;
	private String productsName;
	private String productsSize;
	private int price;
	private String imgPath;
	private String systemName;
	
}
