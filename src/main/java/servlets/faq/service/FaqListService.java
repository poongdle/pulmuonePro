package servlets.faq.service;

import java.sql.Connection;
import java.util.ArrayList;

import jdbc.connection.ConnectionProvider;
import servlets.faq.dao.FaqDAO;
import servlets.faq.dao.FaqDAOImpl;
import servlets.faq.model.FaqDTO;

public class FaqListService {
	private FaqDAO faqDAO = new FaqDAOImpl();
	
	public ArrayList<FaqDTO> getFaqList(int pageNo, int category, int numberPerPage) {
		
		ArrayList<FaqDTO> list = null;
		
		try (Connection conn = ConnectionProvider.getConnection() ) {
			//int total = faqDAO.selectCount(conn, category);
			list = faqDAO.select(conn, category, pageNo, numberPerPage);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int getFaqTotalPage (int numberPerPage, int category) {
		int totalPage = 0;
		try (Connection conn = ConnectionProvider.getConnection() ) {
			totalPage = faqDAO.getTotalPages(conn, numberPerPage, category);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalPage;
	}
}
