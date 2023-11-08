package servlets.faq.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.JdbcUtil;
import servlets.faq.model.FaqDTO;

public class FaqDAOImpl implements FaqDAO {
	
	@Override
	public ArrayList<FaqDTO> select(Connection conn, int category, int pageNo, int numberPerPage) throws SQLException {
		int begin = (pageNo-1) * numberPerPage + 1;
		int end = begin + numberPerPage - 1;
		
		String sql = " SELECT * "
				+ "    FROM ("
				+ "			SELECT ROWNUM no, t.* "
				+ "            FROM (  "
				+ "			           SELECT q_no, faq_no, question, answer "
				+ "			            FROM faq "
				+ "                        WHERE faq_no = ? "
				+ "                        ORDER BY q_no DESC  "
				+ "			) t  "
				+ "    )  b "
				+ "WHERE b.no BETWEEN ? AND ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<FaqDTO> list = null;
		FaqDTO vo = null;
		
		int q_no;
		int faq_no;
		String question;
		String answer;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, category);
			pstmt.setInt(2, begin);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			
			if (rs.next() ) {
				list = new ArrayList<>();
				do {
					q_no = rs.getInt(2);
					faq_no = rs.getInt(3);
					question = rs.getString(4);
					answer = rs.getString(5);
					vo = new FaqDTO(q_no, faq_no, question, answer);
					list.add(vo);
				} while (rs.next());
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return list;
	}
	
	/*
	@Override
	public ArrayList<FaqDTO> select(Connection conn, int category) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT * "
				+ " FROM faq "
				+ " WHERE faq_no = ? ";

		ArrayList<FaqDTO> list = null;
		FaqDTO vo = null;

		int q_no;
		int faq_no;
		String question;
		String answer;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, category);
			rs = pstmt.executeQuery();
			if (rs.next() ) {
				list = new ArrayList<>();
				do {
					q_no = rs.getInt(1);
					faq_no = rs.getInt(2);
					question = rs.getString(3);
					answer = rs.getString(4);
					vo = new FaqDTO(q_no, faq_no, question, answer);
					list.add(vo);
				} while (rs.next());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return list;
	}
	*/

	@Override
	public int getTotalPages(Connection conn, int numberPerPage, int category) throws SQLException {
		int totalPages = 0;
		String sql = " SELECT CEIL(COUNT(*)/?) "
				+ " FROM faq "
				+ " WHERE faq_no = ?";

		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, numberPerPage);
		pstmt.setInt(2, category);
		ResultSet rs = pstmt.executeQuery();

		if( rs.next() ) totalPages = rs.getInt(1);

		rs.close();
		pstmt.close();
		return totalPages;
	}
	
	@Override
	public int selectCount(Connection conn, int category) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT COUNT(*) "
				+ " FROM faq "
				+ " WHERE faq_no = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, category);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}


}
