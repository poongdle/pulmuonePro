package servlets.faq.service;

import java.sql.Connection;

import jdbc.connection.ConnectionProvider;
import servlets.faq.dao.FaqDAO;
import servlets.faq.dao.FaqDAOImpl;
import servlets.faq.model.FaqDTO;


public class FaqWriteService {
	private FaqDAO faqDAO = new FaqDAOImpl();
	
	public int write (FaqDTO vo) {
		int insertRow = 0;
		
		try (Connection conn = ConnectionProvider.getConnection() ) {
			insertRow = faqDAO.write(conn, vo);
		} catch (Exception e ) {
			e.printStackTrace();
		}
		
		return insertRow; 
	}
}
