package servlets.cart.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import jdbc.JdbcUtil;
import servlets.cart.domain.CartDTO;
import servlets.curation.domain.CurationDTO;
import servlets.curation.domain.KidsDTO;
import servlets.product.domain.ProductsDTO;


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

	//	@Override
	//	public int cartadd(Connection con, int tag) throws SQLException {
	//		PreparedStatement pstmt = null;		
	//		ResultSet rs = null;
	//		String sql = " select * from cart_daily ";
	//		pstmt = con.prepareStatement(sql);
	////		pstmt.setInt(1,tag);
	////		System.out.println(tag);
	////		System.out.println(sql);
	//		rs = pstmt.executeQuery();		
	//		int insertRow = 0;
	//		if( rs.next() ) {
	//			sql = " DELETE FROM products_wish where products_tag = ? ";			
	//		}else {			
	//			sql = " INSERT INTO products_wish "
	//					+ "select products_no, category_no, products_name, products_sub_name, products_type, content, price, event_price "
	//					+ " , products_size, delivery_type, tag_no1, tag_no2, tag_no3, tag_no4, tag_no5, products_tag, reg_date, event_tag, event_tag2 "
	//					+ " from products "
	//					+ " WHERE products_tag = ? ";
	//		}		
	//		try {
	//			pstmt = con.prepareStatement(sql);	
	//			pstmt.setInt(1,tag);
	////			System.out.println("wishadd");
	////			System.out.println(tag);
	////			System.out.println(sql);
	//			insertRow = pstmt.executeUpdate();
	//			
	//		} catch (SQLException e) {
	//			e.printStackTrace();
	//		} catch (Exception e) {
	//			e.printStackTrace();
	//		} finally {
	//			JdbcUtil.close(pstmt);
	//		}
	//		
	//		return insertRow;
	//	}


	
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

	public ArrayList<CartDTO> cartList(Connection con, ArrayList<String> products_no) throws SQLException {
		/*
		 * String sql =
		 * "  select  products_name, products_tag, system_name, price, products_size , p.products_no "
		 * + "from  products_img pi join products p on p.products_no = pi.products_no "
		 * + "where p.products_no in ? " + "order by products_no desc";
		 */
		
		Iterator<String> ir = products_no.iterator();
		
		String sql = " SELECT DISTINCT p.products_no,products_tag, products_name, price, products_size, img_path, system_name "
				+ " FROM products p LEFT JOIN products_img i ON p.products_no = i.products_no "
				+ " WHERE p.products_no IN( ";
				while (ir.hasNext()) {
					String prd = (String) ir.next();
					sql += prd+",";
				} // while
				sql += " -1 )  AND origin_name != 'View.png'";

		
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		ArrayList<CartDTO> list = null;


		try {
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();	
			
			if ( rs.next() ) {
				list = new ArrayList<CartDTO>();

				do {
					dto = new CartDTO();

					dto.setProducts_no(rs.getString("products_no"));
					dto.setProducts_tag(rs.getInt("products_tag"));
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



