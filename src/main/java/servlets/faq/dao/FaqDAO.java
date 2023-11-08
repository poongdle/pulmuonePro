package servlets.faq.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import servlets.faq.model.FaqDTO;

public interface FaqDAO {
	// 1. 목록 조회
//	ArrayList<FaqDTO> select(Connection conn, int category, int being, int end, int total) throws SQLException;
	ArrayList<FaqDTO> select(Connection conn, int category, int pageNo, int numberPerPage) throws SQLException;
	
	// faq 유형의 총 갯수
	int selectCount(Connection conn, int category) throws SQLException;
	
	// faq 유형의 페이지수
	int getTotalPages(Connection conn, int numberPerPage, int category) throws SQLException;
}
