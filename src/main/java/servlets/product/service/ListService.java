package servlets.product.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import servlets.product.domain.ProductsDTO;
import servlets.product.persistence.ProductsDAO;
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
	public List<ProductsDTO> select(String path){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ProductsDAO dao = ProductsDAO.getInstance();
			List<ProductsDTO> list = null;			
			int count = path.indexOf("daily");			
			if(count!=-1) {			
			list = dao.selectdaily(con);		
			}else {
			list = dao.selectbox(con);
			}
			return list;
		} catch (NamingException | SQLException e) { 
			//e.printStackTrace();  syso("ListService.select() 에러 : ")
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}   
	public List<ProductsDTO> bestselect(String path){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ProductsDAO dao = ProductsDAO.getInstance();
			List<ProductsDTO> dailylist = null;			
			int count = path.indexOf("daily");			
			if(count!=-1) {			
			dailylist =	dao.selectdailybest(con);		
			}else {
			dailylist =	dao.selectdailybest(con);
			}
			return dailylist;
		} catch (NamingException | SQLException e) { 
			//e.printStackTrace();  syso("ListService.select() 에러 : ")
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}   	
}
