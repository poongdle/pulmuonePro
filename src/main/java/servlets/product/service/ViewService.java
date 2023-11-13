package servlets.product.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import servlets.product.domain.ProductsDTO;
import servlets.product.persistence.ProductsDAO;
import jdbc.JdbcUtil;

public class ViewService {

	// 1. 싱글톤
	private ViewService() {}      
	private static ViewService instance = null;  
	public static ViewService getInstance() {   
		if(   instance == null  ) {
			instance = new ViewService();
		}
		return instance;
	}
//	public ProductsDTO view(int tag){
//		//
//		Connection con = null;
//		try {
//			con = ConnectionProvider.getConnection();
//			ProductsDAO dao = ProductsDAO.getInstance();
//			ProductsDTO dto = null;														
//			try {
//				dto = dao.view(con,tag);
//			} catch (Exception e) {
//				System.out.println("VIEW VIEW VIEW VIEW VIEW ERROR");
//				e.printStackTrace();
//			}					
//			return dto;
//		} catch (NamingException | SQLException e) { 
//			throw new RuntimeException(e);
//		} finally {
//			JdbcUtil.close(con);
//		}
//	}
	public List<ProductsDTO> view(int tag){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ProductsDAO dao = ProductsDAO.getInstance();
			List<ProductsDTO> list = null;				
			try {
				list = dao.view(con,tag);
			} catch (Exception e) {				
				e.printStackTrace();
			}		
			return list;
		} catch (NamingException | SQLException e) { 
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
}
