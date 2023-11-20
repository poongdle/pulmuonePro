package servlets.curation.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import servlets.curation.domain.CurationDTO;
import servlets.curation.domain.KidsDTO;
import servlets.curation.persistence.CurationDAO;
import servlets.curation.persistence.DAOImpl;
import servlets.product.persistence.ProductsDAO;

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

		public CurationDTO cartdaily(int num) {
			CurationDTO insertRow = null ;
			try (Connection con = ConnectionProvider.getConnection() ) {			
				DAOImpl dao = DAOImpl.getInstance();
				insertRow = dao.cartdaily(con, num);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return insertRow;
		}

}//class
