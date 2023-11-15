package servlets.faq.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.connection.ConnectionProvider;
import servlets.faq.dao.FaqDAO;
import servlets.faq.dao.FaqDAOImpl;

public class FaqDeleteService {
private FaqDAO faqDAO = new FaqDAOImpl();
	
	public int delete(int seq, int category) {
		int deleteRow = 0;
		
		try (Connection conn = ConnectionProvider.getConnection() ) {
			deleteRow = faqDAO.delete(conn, seq, category);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return deleteRow;
	}
}
