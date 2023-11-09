package domain.order.box;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoxOrderProductsDTO {
	
	private int boxOrderNo;
	private String productsNo;
	private int productsCnt;
	
}
