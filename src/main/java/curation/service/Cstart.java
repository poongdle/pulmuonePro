package curation.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import curation.domain.KidsDTO;
import curation.persistence.CurationDAO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class Cstart {
	
// 1. 싱글톤
	   private Cstart() {}      
	   private static Cstart instance = null;  
	   public static Cstart getInstance() {   
	      if(   instance == null  ) {
	         instance = new Cstart();
	      }
	      return instance;
	   }

	   

}//class
