package servlets.curation.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import servlets.curation.domain.KidsDTO;
import servlets.curation.persistence.CurationDAO;
import servlets.curation.persistence.DAOImpl;

public class KidPrevService {
	
	 // 1. 싱글톤
	   private KidPrevService() {}      
	   private static KidPrevService instance = null;  
	   public static KidPrevService getInstance() {   
	      if(   instance == null  ) {
	         instance = new KidPrevService();
	      }
	      return instance;
	   }

	   public List<KidsDTO> select(){
	      //
	      Connection con = null;
	      try {
	         con = ConnectionProvider.getConnection();
	          DAOImpl dao = DAOImpl.getInstance();
	         List<KidsDTO> list = null;
	         list = dao.selectList(con);
	         return list;
	      } catch (NamingException | SQLException e) { 
	         //e.printStackTrace();  syso("ListService.select() 에러 : ")
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(con);
	      }
	      
	   }// List select
	   

}//class
