package servlets.product.persistence;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import servlets.faq.model.FaqDTO;
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
	   
	   // Main 화면 상품 목록
	   List<ProductsDTO> selectmainbest(Connection con) throws SQLException;
	   
	   // 장바구니 상품 목록 추가
	   int cartadd(Connection con, int tag) throws SQLException;
	   
	   // 찜한 상품 목록 추가,삭제
	   int wishadd(Connection con, String user_id, int tag) throws SQLException;
	   
	   // MyPage 찜한 상품 목록 
	   List<ProductsDTO> selectwish(Connection con) throws SQLException;
	   
	   // MyPage 찜한 상품 삭제
	   int wishdelete(Connection con,String user_id, String idx) throws SQLException;
}
