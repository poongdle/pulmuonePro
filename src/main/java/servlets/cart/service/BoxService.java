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

		
}//class
