package servlets.curation.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import servlets.curation.domain.CurationDTO;
import servlets.curation.persistence.DAOImpl;

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

		public int insert(CurationDTO dto ){
			//
			Connection con = null;
			int rowCount = 0;
			try {
				con = ConnectionProvider.getConnection();
				DAOImpl dao = DAOImpl.getInstance();

				con.setAutoCommit(false);  

				// 금액 != 0 -> 상품 갯수 증가?
				if (dto.getPrice() != 0) {
					dao.insert(con, dto);
				}//if

				rowCount = dao.insert(con, dto);

				con.commit();
			} catch (NamingException | SQLException e) {
				JdbcUtil.rollback(con);
				throw new RuntimeException(e);
			} finally {
				JdbcUtil.close(con);
			}
			return rowCount;
		}
		
		

}//class
