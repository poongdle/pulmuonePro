package servlets.product.persistence;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import servlets.product.domain.ProductsDTO;

public interface IProducts {
	
	   // 1. 매일배송 상품 목록
	   List<ProductsDTO> selectdaily(Connection con) throws SQLException;	  
	   // 1. 택배배송 상품 목록
	   List<ProductsDTO> selectbox(Connection con) throws SQLException;	 
	   
	   List<ProductsDTO> selectdailybest(Connection con) throws SQLException;
}
