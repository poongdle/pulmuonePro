package curation.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import curation.domain.KidsDTO;
import curation.persistence.CurationDAO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class Cstep1 {
	
// 1. 싱글톤
	   private Cstep1() {}      
	   private static Cstep1 instance = null;  
	   public static Cstep1 getInstance() {   
	      if(   instance == null  ) {
	         instance = new Cstep1();
	      }
	      return instance;
	   }

	   

}//class
