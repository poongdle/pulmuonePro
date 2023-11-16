package servlets.curation.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import servlets.curation.domain.KidsDTO;
import servlets.curation.persistence.CurationDAO;

public class Start {
	
// 1. 싱글톤
	   private Start() {}      
	   private static Start instance = null;  
	   public static Start getInstance() {   
	      if(   instance == null  ) {
	         instance = new Start();
	      }
	      return instance;
	   }

	   

}//class
