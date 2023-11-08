package product.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import product.domain.ProductsDTO;
import product.persistence.ProductsDAO;
import jdbc.JdbcUtil;

public class ListService {

	// 1. 싱글톤
	private ListService() {}      
	private static ListService instance = null;  
	public static ListService getInstance() {   
		if(   instance == null  ) {
			instance = new ListService();
		}
		return instance;
	}
	public List<ProductsDTO> select(){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ProductsDAO dao = ProductsDAO.getInstance();
			List<ProductsDTO> list = null;
			list = dao.selectList(con);
			return list;
		} catch (NamingException | SQLException e) { 
			//e.printStackTrace();  syso("ListService.select() 에러 : ")
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}   	
}
