package servlets.product.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jdbc.JdbcUtil;
import servlets.product.domain.ProductsDTO;

public class ProductsDAO implements IProducts {
	// 1. 싱글톤
	   private ProductsDAO() {}
	   private static ProductsDAO instance = new ProductsDAO();
	   public static ProductsDAO getInstance() {
	      return instance;
	   }
	@Override
	public List<ProductsDTO> selectdaily(Connection con) throws SQLException {
	      String sql =
	              " select a.products_no, category_no, products_name, products_sub_name, products_type, content, price, event_price"
	              + ", products_size, delivery_type, tag_no1, tag_no2, tag_no3, tag_no4, tag_no5, products_tag, reg_date, system_name "	              
	              + " from products a join products_img b on a.products_no = b.products_no "
	              + " where delivery_type = 'daily' ";	              
	        
	        ArrayList<ProductsDTO> list = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;	        
	        try {
	           pstmt = con.prepareStatement(sql);	     
	           System.out.println(sql);
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
	                 	dto.setProducts_tag(rs.getShort("products_tag"));
	                 	dto.setReg_date(rs.getDate("reg_date"));
	                 	dto.setSystem_name(rs.getString("system_name"));
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
	public List<ProductsDTO> selectbox(Connection con) throws SQLException {
		String sql =
	              " select a.products_no, category_no, products_name, products_sub_name, products_type, content, price, event_price"
	              + ", products_size, delivery_type, tag_no1, tag_no2, tag_no3, tag_no4, tag_no5, products_tag, reg_date, system_name "	              
	              + " from products a join products_img b on a.products_no = b.products_no "
	              + " where delivery_type = 'box' ";
	        
	        ArrayList<ProductsDTO> list = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;	        
	        try {
	           pstmt = con.prepareStatement(sql);
	           System.out.println(sql);
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
	                 	dto.setProducts_tag(rs.getShort("products_tag"));
	                 	dto.setReg_date(rs.getDate("reg_date"));
	                 	dto.setSystem_name(rs.getString("system_name"));                 
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
	public List<ProductsDTO> selectdailybest(Connection con) throws SQLException {
		String sql =
	              " select a.products_no, category_no, products_name, products_sub_name, products_type, content, price, event_price"
	              + ", products_size, delivery_type, tag_no1, tag_no2, tag_no3, tag_no4, tag_no5, products_tag, reg_date, system_name "	              
	              + " from products a join products_img b on a.products_no = b.products_no "
	              + " where delivery_type = 'daily' "
	              + " and a.products_no in (0073405,0071928,0073080,0070680,0073019,0071654,0070776,0073344,0072840,0073184,0073271,0073325,0073327,0073274,0070800,0070445,0073156,0073155,0071664,0072652)";	              	             
	        
	        ArrayList<ProductsDTO> dailylist = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;	        
	        try {
	           pstmt = con.prepareStatement(sql);	     
	           System.out.println(sql);
	           rs = pstmt.executeQuery();
	           if ( rs.next() ) {
	        	   dailylist = new ArrayList<ProductsDTO>();
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
	                 	dto.setProducts_tag(rs.getShort("products_tag"));
	                 	dto.setReg_date(rs.getDate("reg_date"));
	                 	dto.setSystem_name(rs.getString("system_name"));
	                 dailylist.add(dto);
	              } while ( rs.next() );
	           } // 
	        } finally {
	           JdbcUtil.close(pstmt);
	           JdbcUtil.close(rs);         
	        } // finally

	        return dailylist;
	}
}
