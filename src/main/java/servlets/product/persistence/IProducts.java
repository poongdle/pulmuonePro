package servlets.product.persistence;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import servlets.product.domain.ProductsDTO;

public interface IProducts {
	
	   // 1. 매일배송 상품 목록
//	   List<ProductsDTO> selectdaily(Connection con,String path, int num) throws SQLException;
	   List<ProductsDTO> select(Connection con,String path, String cal) throws SQLException;
	   List<ProductsDTO> selectbest(Connection con,String path, String cal) throws SQLException;
//	   List<ProductsDTO> selectdailybest(Connection con) throws SQLException;	   
	   // 2. 택배배송 상품 목록
//	   List<ProductsDTO> selectbox(Connection con) throws SQLException;	 	   
//	   List<ProductsDTO> selectboxbest(Connection con) throws SQLException;
	   // 3. 공용 상품 조회	   
	   List<ProductsDTO> search(Connection con,String path, String tags, String num, String cal) throws SQLException;
	   List<ProductsDTO> searchcount(Connection con,String path, String tags, String cal) throws SQLException;	   
	   
	   // 5. 공용 상품 상세보기
	   ProductsDTO view(Connection con, int tag) throws Exception;
	   List<ProductsDTO> viewlist(Connection con, int tag) throws SQLException, Exception;
}
