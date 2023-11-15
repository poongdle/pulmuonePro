package servlets.utils;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class CountDTO {
	private int currentPage = 1;
	private int numberPerPage = 10;
	private int numberOfPageBlock = 10;
	private int totalPages;
	private int start;
	private int end;
	private boolean prev;
	private boolean next;
	
	public CountDTO(int totalPages) {
		super();	
		this.totalPages = totalPages;	
	}
	
}
