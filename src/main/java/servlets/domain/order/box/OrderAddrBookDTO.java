package servlets.domain.order.box;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderAddrBookDTO {
	
	private int addrNo;
	private int memberNo;
	private String addrName;
	private String name;
	private String tel;
	private int dest;
	private String zipCode;
	private String addr;
	private String addrDetail;
	private String memo;
	private int defaultAddr;
	
}
