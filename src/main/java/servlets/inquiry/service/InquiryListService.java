package servlets.inquiry.service;

import java.sql.Connection;
import java.util.ArrayList;

import jdbc.connection.ConnectionProvider;
import servlets.inquiry.dao.InquiryDAO;
import servlets.inquiry.dao.InquiryDAOImpl;
import servlets.inquiry.model.InquiryDTO;

public class InquiryListService {
	private InquiryDAO dao = new InquiryDAOImpl();
	
	public ArrayList<InquiryDTO> select(String cate) {
		ArrayList<InquiryDTO> list = null;
		try (Connection conn = ConnectionProvider.getConnection() ) {
			list = dao.select(conn, cate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
