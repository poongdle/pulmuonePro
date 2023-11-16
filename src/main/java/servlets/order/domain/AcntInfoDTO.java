package servlets.order.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AcntInfoDTO {
	
	private String acntInfoNo;
	private int memberNo;
	private String acntHolder;
	private String bankNo;
	private String acntNum;
	
}
