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

		public List<CurationDTO> cartdaily(int num) {
			
			Connection con = null;
			try {	

				con  = ConnectionProvider.getConnection();
				DAOImpl dao = DAOImpl.getInstance();
				List<CurationDTO> dto = null;
				dto= dao.cartdaily(con, num);
				return dto;
				
			 } catch (NamingException | SQLException e) { 
		         //e.printStackTrace();  syso("ListService.select() 에러 : ")
		         throw new RuntimeException(e);
		      } finally {
		         JdbcUtil.close(con);
		      }
	   }

}//class
