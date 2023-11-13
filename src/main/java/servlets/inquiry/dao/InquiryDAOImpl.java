package servlets.inquiry.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import jdbc.JdbcUtil;
import servlets.inquiry.model.InquiryDTO;

public class InquiryDAOImpl implements InquiryDAO{

	@Override
	public int write(Connection conn, InquiryDTO dto) throws SQLException {
		String sql = " INSERT INTO inquiry  "
				+ " ( inquiry_no, member_id, inquiry_cate, email, title, content) "
				+ " VALUES ( "
				+ "    seq_inquiry.NEXTVAL, ?, ?, ?, ?, ?"
				+ " ) ";
		
		PreparedStatement pstmt = null;
		int insertRow = 0;
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMember_id());
			pstmt.setString(2, dto.getInquiry_cate());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getTitle());
			pstmt.setString(5, dto.getContent());
			
			insertRow = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		
		return insertRow;
	}

	@Override
	public ArrayList<InquiryDTO> select(Connection conn, String category) throws SQLException {
		String sql = " SELECT * "
				+ " FROM inquiry ";
				if( category != null || !category.equals("")) {
					sql += " WHERE inquiry_cate = ? ";
				}
		System.out.println("__________--");
		System.out.println(category);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<InquiryDTO> list = null;
		InquiryDTO vo = null;
		
		int inquiry_no;     
		String member_id;   
		String inquiry_cate;
		String email;       
		String title;       
		String content;     
		Date regdate;       
		String status;
		
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			if( category != null || !category.equals("")) {
				pstmt.setString(1, category);
			}
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				list = new ArrayList<>();
				
				do {
					inquiry_no = rs.getInt("inquiry_no");
					member_id = rs.getString("member_id");
					inquiry_cate = rs.getString("inquiry_cate");
					email = rs.getString("email");
					title = rs.getString("title");
					content = rs.getString("content");
					regdate = rs.getDate("regdate");
					status = rs.getString("status");
					
					vo = new InquiryDTO(inquiry_no, member_id, inquiry_cate, email, title, content, regdate, status);
					System.out.println(vo);
					list.add(vo);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		return list;
	}

}
