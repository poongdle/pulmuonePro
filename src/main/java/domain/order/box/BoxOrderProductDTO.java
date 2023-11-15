package domain.order.box;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoxOrderProductDTO {
	
	private int productsNo;
	private int categoryNo;
	private String productsName;
	private String productsType;
	private String productsSize;
	private int price;
	private int eventPrice;
	private String imgPath;
	private String originName;
	
}
