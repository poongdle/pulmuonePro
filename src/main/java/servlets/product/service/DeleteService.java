package servlets.product.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import servlets.product.domain.ProductsDTO;
import servlets.product.persistence.ProductsDAO;
import jdbc.JdbcUtil;

public class DeleteService {

	// 1. 싱글톤
	private DeleteService() {}      
	private static DeleteService instance = null;  
	public static DeleteService getInstance() {   
		if(   instance == null  ) {
			instance = new DeleteService();
		}
		return instance;
	}
	
}
