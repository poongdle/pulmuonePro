package product.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jdbc.JdbcUtil;
import product.domain.ProductsDTO;

public class ProductsDAO implements IProducts {
	// 1. 싱글톤
	   private ProductsDAO() {}
	   private static ProductsDAO instance = new ProductsDAO();
	   public static ProductsDAO getInstance() {
	      return instance;
	   }
	@Override
	public List<ProductsDTO> selectList(Connection con) throws SQLException {
	      String sql =
	              " select products_no, category_no, products_name, products_sub_name, products_type, content, price, event_price"
	              + ", products_size, delivery_type, tag_no1, tag_no2, tag_no3, tag_no4, tag_no5, products_tag, reg_date "	              
	              + " from products ";	              
	        
	        ArrayList<ProductsDTO> list = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        
	        try {
	           pstmt = con.prepareStatement(sql);
	           rs = pstmt.executeQuery();
	           if ( rs.next() ) {
	              list = new ArrayList<ProductsDTO>();
	              ProductsDTO dto = null;
	              do {
	                 dto =  new ProductsDTO();
	                 	dto.setProducts_no(rs.getString("products_no"));
	                 	dto.setCategory_no(rs.getString("category_no"));
	                 	dto.setProducts_name(rs.getString("products_name"));
	                 	dto.setProducts_sub_name(rs.getString("products_sub_name"));
	                 	dto.setProducts_type(rs.getString("products_type"));
	                 	dto.setContent(rs.getString("content"));
	                 	dto.setPrice(rs.getInt("price"));
	                 	dto.setEvent_price(rs.getInt("event_price"));
	                 	dto.setProducts_size(rs.getString("products_size"));	                 	
	                 	dto.setDelivery_type(rs.getString("delivery_type"));	                 	
	                 	dto.setTag_no1(rs.getInt("tag_no1"));
	                 	dto.setTag_no2(rs.getInt("tag_no2"));
	                 	dto.setTag_no3(rs.getInt("tag_no3"));
	                 	dto.setTag_no4(rs.getInt("tag_no4"));
	                 	dto.setTag_no5(rs.getInt("tag_no5"));
	                 	dto.setReg_date(rs.getDate("reg_date"));	                 
	                 list.add(dto);
	              } while ( rs.next() );
	           } // 
	        } finally {
	           JdbcUtil.close(pstmt);
	           JdbcUtil.close(rs);         
	        } // finally

	        return list;
	}
	@Override
	public ProductsDTO selectOne(Connection con, int num) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
}
