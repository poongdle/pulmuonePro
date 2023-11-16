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
	
	private int boxOrderNo;			// 주문 번호
	private int memberNo;			// 회원 번호
	private int boxOrderStatus;		// 주문 상태
	private String boxOrderDate;	// 주문일
	private int produtsNo;			// 상품 번호
	private int produtsCnt;			// 상품 수량
	private String produtsName;		// 상품명
	private String produtsType;		// 상품 보관 타입
	private String price;			// 상품 가격
	private String imgPath;			// 상품 이미지
	
}
