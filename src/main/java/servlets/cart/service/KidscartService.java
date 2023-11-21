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

public class KidscartService {
	
	 // 1. 싱글톤
	   private KidscartService() {}      
	   private static KidscartService instance = null;  
	   public static KidscartService getInstance() {   
	      if(   instance == null  ) {
	         instance = new KidscartService();
	      }
	      return instance;
	   }

		
		
}//class
