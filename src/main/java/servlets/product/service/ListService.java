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
	public List<ProductsDTO> select(String path, int num){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ProductsDAO dao = ProductsDAO.getInstance();
			List<ProductsDTO> list = null;			
			int count = path.indexOf("daily");			
			if(count!=-1) {			
				path = "daily";
			list = dao.select(con,path,num);		
			}else {
				path = "box";
			list = dao.select(con,path,num);
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
			List<ProductsDTO> bestlist = null;			
			int count = path.indexOf("daily");			
			if(count!=-1) {			
				path = "daily";
				bestlist =	dao.selectbest(con,path);		
			}else {
				path = "box";
				bestlist =	dao.selectbest(con,path);
			}
			return bestlist;
		} catch (NamingException | SQLException e) { 
			//e.printStackTrace();  syso("ListService.select() 에러 : ")
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	public List<ProductsDTO> search(String path, String tags){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ProductsDAO dao = ProductsDAO.getInstance();
			List<ProductsDTO> searchlist = null;		
			int count = path.indexOf("daily");	
			if(count != -1) {
				path = "daily";
			}else {
				path = "box";
			}
			searchlist =	dao.search(con,path,tags);
			return searchlist;
		} catch (NamingException | SQLException e) { 
			//e.printStackTrace();  syso("ListService.select() 에러 : ")
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}  
}
