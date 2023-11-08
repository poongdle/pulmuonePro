package product.persistence;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import product.domain.ProductsDTO;

public interface IProducts {
	
	   // 1. 매일배송 글 목록
	   List<ProductsDTO> selectdaily(Connection con) throws SQLException;	  
	   // 1. 택배배송 글 목록
	   List<ProductsDTO> selectbox(Connection con) throws SQLException;	 
	   
}
