package servlets.cart.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.JdbcUtil;
import servlets.cart.domain.CartDTO;


public class CartImpl implements CartDAO{

	// 1. 싱글톤
	private CartImpl() {}
	public CartImpl(Connection conn) {
		// TODO Auto-generated constructor stub
	}

	private static CartImpl instance = new CartImpl();
	public static CartImpl getInstance() {
		return instance;
	}
	
// 장바구니 - 쿼리 확인	
	@Override
	public int dailyadd(Connection con, CartDTO dto) throws SQLException {

		int rowcount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "insert into cart_daily (cart_no, member_no, products_no, mon_cnt, tue_cnt, wed_cnt, thu_cnt, fir_cnt, reg_date) "
				+ " values( ?, ? , '?', ? , ?, ?, ?, ?, sysdate)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getCart_no());
			pstmt.setInt(2, dto.getMember_no());
			pstmt.setString(3, dto.getProducts_no());
			pstmt.setInt(4, dto.getMon_cnt());
			pstmt.setInt(5, dto.getTue_cnt());
			pstmt.setInt(6, dto.getWed_cnt());
			pstmt.setInt(7, dto.getThu_cnt());
			pstmt.setInt(8, dto.getFir_cnt());

			System.out.println(sql);
			rs = pstmt.executeQuery();

		} catch (Exception e) {
			System.out.println("cart error...");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // try

		return rowcount;
	} 


	@Override

	public ArrayList<CartDTO> cartList(Connection con, String products_no) throws SQLException {
		/*
		 * String sql =
		 * "  select  products_name, products_tag, system_name, price, products_size , p.products_no "
		 * + "from  products_img pi join products p on p.products_no = pi.products_no "
		 * + "where p.products_no in ? " + "order by products_no desc";
		 */				
		
		String sql = " SELECT DISTINCT p.products_no,products_tag, products_name, price, products_size, img_path, system_name "
				+ " FROM products p LEFT JOIN products_img i ON p.products_no = i.products_no "
		        + " WHERE p.products_no in ('0073156')";
//				sql += String.format(" WHERE p.products_no in (%s) ", products_no);
				sql += " AND origin_name != 'View.png'";

		
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		ArrayList<CartDTO> list = null;
		CartDTO dto = null;

		try {
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();	
			
			if ( rs.next() ) {
				list = new ArrayList<CartDTO>();

				do {
					dto = new CartDTO();

					dto.setProducts_no(rs.getString("products_no"));
					dto.setProducts_tag(rs.getShort("products_tag"));
					dto.setProducts_name(rs.getString("products_name"));
					dto.setPrice(rs.getInt("price"));
					dto.setImg_path(rs.getString("img_path"));
					dto.setSystem_name(rs.getString("system_name"));
					dto.setProducts_size(rs.getString("products_size"));

					list.add(dto);

				} while (rs.next());
			} // if

		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // try
		return list;
	}
}



