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
	public List<ProductsDTO> select(String path, String cal){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ProductsDAO dao = ProductsDAO.getInstance();
			List<ProductsDTO> list = null;			
			int count = path.indexOf("daily");			
			if(count!=-1) {			
				path = "daily";
			list = dao.select(con,path,cal);		
			}else {
				path = "box";
			list = dao.select(con,path,cal);
			}
			return list;
		} catch (NamingException | SQLException e) { 
			//e.printStackTrace();  syso("ListService.select() 에러 : ")
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}   
	public List<ProductsDTO> bestselect(String path, String cal){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ProductsDAO dao = ProductsDAO.getInstance();
			List<ProductsDTO> bestlist = null;			
			int count = path.indexOf("daily");			
			if(count!=-1) {			
				path = "daily";
				bestlist =	dao.selectbest(con,path,cal);		
			}else {
				path = "box";
				bestlist =	dao.selectbest(con,path,cal);
			}
			return bestlist;
		} catch (NamingException | SQLException e) { 
			//e.printStackTrace();  syso("ListService.select() 에러 : ")
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	public List<ProductsDTO> search(String path, String tags, String num, String cal){
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
			searchlist =	dao.search(con,path,tags,num,cal);			
			return searchlist;
		} catch (NamingException | SQLException e) { 
			//e.printStackTrace();  syso("ListService.select() 에러 : ")
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}  
	public List<ProductsDTO> searchcount(String path, String tags, String cal){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ProductsDAO dao = ProductsDAO.getInstance();
			List<ProductsDTO> searchcountlist = null;					
			int count = path.indexOf("daily");	
			if(count != -1) {
				path = "daily";
			}else {
				path = "box";
			}
			searchcountlist =	dao.searchcount(con,path,tags,cal);			
			return searchcountlist;
		} catch (NamingException | SQLException e) { 
			//e.printStackTrace();  syso("ListService.select() 에러 : ")
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	public List<ProductsDTO> mainbestselect(){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ProductsDAO dao = ProductsDAO.getInstance();
			List<ProductsDTO> mainbestlist = null;															
				mainbestlist =	dao.selectmainbest(con);					
			return mainbestlist;
		} catch (NamingException | SQLException e) { 
			//e.printStackTrace();  syso("ListService.select() 에러 : ")
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	public List<ProductsDTO> selectwish(String user_id){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ProductsDAO dao = ProductsDAO.getInstance();
			List<ProductsDTO> wishlist = null;															
			wishlist =	dao.selectwish(con,user_id);					
			return wishlist;
		} catch (NamingException | SQLException e) { 
			//e.printStackTrace();  syso("ListService.select() 에러 : ")
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	public List<ProductsDTO> selectreview(int memberNo){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ProductsDAO dao = ProductsDAO.getInstance();
			List<ProductsDTO> reviewlist = null;															
			reviewlist =	dao.selectreview(con,memberNo);					
			return reviewlist;
		} catch (NamingException | SQLException e) { 
			//e.printStackTrace();  syso("ListService.select() 에러 : ")
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	public List<ProductsDTO> selectmyreview(int memberNo){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ProductsDAO dao = ProductsDAO.getInstance();
			List<ProductsDTO> reviewlist = null;															
			reviewlist =	dao.selectmyreview(con,memberNo);					
			return reviewlist;
		} catch (NamingException | SQLException e) { 
			//e.printStackTrace();  syso("ListService.select() 에러 : ")
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

}
