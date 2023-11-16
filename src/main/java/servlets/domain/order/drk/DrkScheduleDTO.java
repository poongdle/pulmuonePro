package servlets.domain.order.drk;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DrkScheduleDTO {
	
	private int drkScheduleNo;
	private int drkOrderNo;
	private String regDate;
	private int productsNo;
	private int monCnt;
	private int tueCnt;
	private int wedCnt;
	private int thuCnt;
	private int firCnt;
	private String drkStartDate;
	private String drkEndDate;
	
}
