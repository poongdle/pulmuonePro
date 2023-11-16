package servlets.domain.order.drk;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CardInfoDTO {
	
	private String cardInfoNo;
	private int memberNo;
	private String cardNum;
	private String expiryDate;
	private String birthDate;
	
}
