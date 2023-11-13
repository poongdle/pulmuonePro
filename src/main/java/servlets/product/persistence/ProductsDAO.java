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
	public List<ProductsDTO> selectdaily(Connection con, int num) throws SQLException {
	      String sql =
	              " select a.products_no, category_no, products_name, products_sub_name, products_type, content, price, event_price"
	              + ", products_size, delivery_type, tag_no1, tag_no2, tag_no3, tag_no4, tag_no5, products_tag, reg_date, system_name "	              
	              + " from products a join products_img b on a.products_no = b.products_no "
	              + " where delivery_type = 'daily' "
	              + " and origin_name not like 'View%' ";
	      
	      	switch (num) {
			case 2: //제목
				sql += "and ROWNUM <=24 ";
				break;
			case 3: //제목
				sql += "and ROWNUM <=36 ";
				break;
			case 4: //제목
				sql += "and ROWNUM <=48 ";
				break;
	      	}
	        ArrayList<ProductsDTO> list = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;	        
	        try {
	           pstmt = con.prepareStatement(sql);	     
//	           System.out.println(sql);
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
	              + " where delivery_type = 'box' "
				  + " and origin_name not like 'View%' ";
	        
	        ArrayList<ProductsDTO> list = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;	        
	        try {
	           pstmt = con.prepareStatement(sql);
//	           System.out.println(sql);
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
	              + " and a.products_no in (0073405,0071928,0073080,0070680,0073019,0071654,0070776,0073344,0072840,0073184,0073271,0073325,0073327,0073274,0070800,0070445,0073156,0073155,0071664,0072652)"
	              + " and origin_name not like 'View%' ";
	        
	        ArrayList<ProductsDTO> dailylist = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;	        
	        try {
	           pstmt = con.prepareStatement(sql);	     
//	           System.out.println(sql);
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
	@Override
	public List<ProductsDTO> selectboxbest(Connection con) throws SQLException {
		String sql =
	              " select a.products_no, category_no, products_name, products_sub_name, products_type, content, price, event_price"
	              + ", products_size, delivery_type, tag_no1, tag_no2, tag_no3, tag_no4, tag_no5, products_tag, reg_date, system_name "	              
	              + " from products a join products_img b on a.products_no = b.products_no "
	              + " where delivery_type = 'box' "
	              + " and a.products_no in (0073561,0072964,0073077,0072905,0073166,0072965,0073190,0072906,0073136,0073326,0072966,0073165,0071968,0073324 )"
	              + " and origin_name not like 'View%' ";
		 		
	        ArrayList<ProductsDTO> dailylist = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;	        
	        try {
	           pstmt = con.prepareStatement(sql);	     
//	           System.out.println(sql);
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
	@Override
	public List<ProductsDTO> search(Connection con, String tags) throws SQLException {
		String sql =
	              " select a.products_no, category_no, products_name, products_sub_name, products_type, content, price, event_price"
	              + ", products_size, delivery_type, tag_no1, tag_no2, tag_no3, tag_no4, tag_no5, products_tag, reg_date, system_name "	              
	              + " from products a join products_img b on a.products_no = b.products_no "
	              + " where delivery_type = 'daily' "
	              + " and origin_name not like 'View%' "
	              + " and tag1 in (?) "	  ;          
//				  + " or tag2 in (?) "
//		  		  + " or tag3 in (?) "
//				  + " or tag4 in (?) "
//				  + " or tag5 in (?) ";				  	      
	        ArrayList<ProductsDTO> list = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        System.out.println(tags);	        	       
	        try {
	           pstmt = con.prepareStatement(sql);	           	          
	           pstmt.setString(1, tags);
//	           pstmt.setString(2, tags);
//	           pstmt.setString(3, tags);
//	           pstmt.setString(4, tags);
//	           pstmt.setString(5, tags);
	           System.out.println(sql);
	           rs = pstmt.executeQuery();	  
//	           System.out.println(rs.next());
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
//	                 	System.out.println(dto);
	                 list.add(dto);
//	                 System.out.println(list);
	              } while ( rs.next() );
	           } // 
	        } finally {
	           JdbcUtil.close(pstmt);
	           JdbcUtil.close(rs);         
	        } // finally

	        return list;
	}
	@Override
	public int count(Connection con, String path) throws SQLException {
		
		return 0;
	}
//	@Override
//	public ProductsDTO view(Connection con, int tag) throws Exception {
//		String sql = "select a.products_no, category_no, products_name, products_sub_name, products_type, content, price, event_price, products_size, delivery_type, tag_no1, tag_no2, tag_no3, tag_no4, tag_no5, products_tag, reg_date, system_name,origin_name "
//				+ " from products a join products_img b on a.products_no = b.products_no "
//				+ " where products_tag = ?";
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		pstmt = con.prepareStatement(sql);
//		pstmt.setInt(1,tag);		
//		ProductsDTO dto = null;
//		rs = pstmt.executeQuery();
//		if(rs.next()) {
//			dto = ProductsDTO.builder()
//					.products_no(rs.getString("products_no"))
//					.products_name(rs.getString("products_name"))
//					.products_sub_name(rs.getString("products_sub_name"))										
//					.price(rs.getInt("price"))
//					.products_size(rs.getString("products_size"))
//					.products_tag(tag)
//					.system_name(rs.getString("system_name"))
//					.origin_name(rs.getString("origin_name"))
//					.content(rs.getString("content")).build();
//		}
//		rs.close();
//		pstmt.close();
//		return dto;   
//		
//	}
	@Override
	public List<ProductsDTO> view(Connection con, int tag) throws Exception {
		String sql = "select a.products_no, category_no, products_name, products_sub_name, products_type, content, price, event_price, products_size, delivery_type, tag_no1, tag_no2, tag_no3, tag_no4, tag_no5, products_tag, reg_date, system_name,origin_name "
				+ " from products a join products_img b on a.products_no = b.products_no "
				+ " where products_tag = ? "
				+ " and origin_name like 'View%' ";
		ArrayList<ProductsDTO> list = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;	        
        try {
           pstmt = con.prepareStatement(sql);	           
           pstmt.setInt(1,tag);
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
                 	dto.setOrigin_name(rs.getString("origin_name"));
                 list.add(dto);
              } while ( rs.next() );
           } // 
        } finally {
           JdbcUtil.close(pstmt);
           JdbcUtil.close(rs);         
        } // finally
        return list;
		
	}

}
