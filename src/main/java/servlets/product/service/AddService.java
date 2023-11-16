package servlets.product.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import servlets.product.domain.ProductsDTO;
import servlets.product.persistence.ProductsDAO;
import jdbc.JdbcUtil;

public class AddService {

	// 1. 싱글톤
	private AddService() {}      
	private static AddService instance = null;  
	public static AddService getInstance() {   
		if(   instance == null  ) {
			instance = new AddService();
		}
		return instance;
	}
	public int wishadd(int tag) {
		int insertRow = 0;
		try (Connection con = ConnectionProvider.getConnection() ) {			
			ProductsDAO dao = ProductsDAO.getInstance();
			insertRow = dao.wishadd(con, tag);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return insertRow;
	}
	
}
