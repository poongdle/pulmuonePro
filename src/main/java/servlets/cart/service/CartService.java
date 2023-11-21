package servlets.cart.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import servlets.cart.domain.CartDTO;
import servlets.cart.persistence.CartImpl;

public class CartService {
	
	 // 1. 싱글톤
	   private CartService() {}      
	   private static CartService instance = null;  
	   public static CartService getInstance() {   
	      if(   instance == null  ) {
	         instance = new CartService();
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

		public ArrayList<CartDTO> cartList(int num){
			Connection con = null;
			try {
				con = ConnectionProvider.getConnection();
				CartImpl dao = CartImpl.getInstance();
				ArrayList<CartDTO> list = null;
				list = dao.cartList(con, num);
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
