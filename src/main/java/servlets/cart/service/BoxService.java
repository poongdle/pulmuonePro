package servlets.cart.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import servlets.cart.domain.CartDTO;
import servlets.cart.persistence.CartImpl;
import servlets.curation.domain.CurationDTO;
import servlets.curation.domain.KidsDTO;
import servlets.curation.persistence.CurationDAO;
import servlets.curation.persistence.DAOImpl;
import servlets.product.persistence.ProductsDAO;

public class BoxService {
	
	 // 1. 싱글톤
	   private BoxService() {}      
	   private static BoxService instance = null;  
	   public static BoxService getInstance() {   
	      if(   instance == null  ) {
	         instance = new BoxService();
	      }
	      return instance;
	   }

		public int dailyadd(CartDTO dto){
			Connection con =  null;
			try {	
				con = ConnectionProvider.getConnection();
				CartImpl dao = CartImpl.getInstance();
				int rowcount = dao.dailyadd(con, dto);
				return rowcount;
				
		     } catch (NamingException | SQLException e) { 
		         //e.printStackTrace();  syso("ListService.select() 에러 : ")
		         throw new RuntimeException(e);
		      } finally {
		         JdbcUtil.close(con);
		      }
		}


		public ArrayList<CartDTO> cartList(ArrayList<String> products_no){

			Connection con = null;
			try {
				con = ConnectionProvider.getConnection();
				CartImpl dao = CartImpl.getInstance();
				ArrayList<CartDTO> list = null;

				list = dao.cartList(con, products_no);

				return list;
			}catch (Exception e) {
					System.out.println("CartService 에러");
					e.printStackTrace();
					throw new RuntimeException(e);
				} finally {
					JdbcUtil.close(con);
				} // try
		}
		
}//class
