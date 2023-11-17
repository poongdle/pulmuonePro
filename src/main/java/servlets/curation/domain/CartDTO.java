package servlets.curation.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class CartDTO {

	private String products_name;
	private int price;
	private int products_tag;
	private String system_name;
	private String products_no;
	
}

