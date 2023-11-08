package product.persistence;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import product.domain.ProductsDTO;

public interface IProducts {
	
	   // 1. 글 목록
	   List<ProductsDTO> selectList(Connection con) throws SQLException;	  

	   // 2. 글 상세 보기
	   ProductsDTO selectOne( Connection con, int num) throws SQLException;
	   
}
