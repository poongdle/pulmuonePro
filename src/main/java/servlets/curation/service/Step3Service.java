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

public class Step3Service {
	
// 1. 싱글톤
	   private Step3Service() {}      
	   private static Step3Service instance = null;  
	   public static Step3Service getInstance() {   
	      if(   instance == null  ) {
	         instance = new Step3Service();
	      }
	      return instance;
	   }		   


}//class
