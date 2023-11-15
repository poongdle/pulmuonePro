package persistence.order;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import domain.order.box.BoxOrderDTO;
import domain.order.box.BoxOrderProductDTO;
import domain.order.box.BoxPayDTO;
import domain.order.box.BoxShipDTO;
import domain.order.box.OrderAddrBookDTO;
import domain.order.box.OrderCouponDTO;
import domain.order.box.OrderMemberInfoDTO;
import jdbc.JdbcUtil;

public class BoxOrderDAO implements BoxOrderImpl {
	
	// 싱글톤
	private BoxOrderDAO() {}
	private static BoxOrderDAO instance = new BoxOrderDAO();
	public static BoxOrderDAO getInstance() {
		return instance;
	}
	
	@Override
	public ArrayList<BoxOrderProductDTO> selectProducts(Connection conn, String [] productsNo) throws SQLException {
		String sql = " SELECT DISTINCT p.products_no, category_no, products_name, products_type, products_size, price, event_price, img_path, origin_name "
				+ " FROM products p LEFT JOIN products_img i ON p.products_no = i.products_no "
				+ " WHERE p.products_no IN( ";
				for(int i = 0; i <= productsNo.length; i++) {
					sql += productsNo[0]+", ";
				} // for
				sql += " -1 ) ";
				
		BoxOrderProductDTO dto = null;
		ArrayList<BoxOrderProductDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<>();
				do {
					dto = new BoxOrderProductDTO();
					dto.setProductsNo(rs.getInt("products_no"));
					dto.setCategoryNo(rs.getInt("category_no"));
					dto.setProductsName(rs.getString("products_name"));
					dto.setProductsType(rs.getString("products_type"));
					dto.setProductsSize(rs.getString("products_size"));
					dto.setPrice(rs.getInt("price"));
					dto.setEventPrice(rs.getInt("event_price"));
					dto.setImgPath(rs.getString("img_path"));
					dto.setOriginName(rs.getString("origin_name"));
					list.add(dto);
				} while (rs.next());
			} // if
		} catch (Exception e) {
			System.out.println("BoxOrderDAO selectProducts() error...");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // try
		return list;
	} // selectProducts

	@Override
	public int getProductsPrice(Connection conn, String[] productsNo) {
		String sql = " SELECT SUM(price) price"
				+ " FROM products "
				+ " WHERE products_no IN ( ";
		for (int i = 0; i < productsNo.length; i++) {
			sql += productsNo[i] + " , ";
		}
		sql += " -1) ";
		
		int price = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					price += rs.getInt("price");
				} while (rs.next());
			} // if
		} catch (Exception e) {
			System.out.println("BoxOrderDAO getProductsPrice() error...");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // try
		
		return price;
	}

	@Override
	public ArrayList<OrderCouponDTO> selectCoupon(Connection conn, int memberNo, int priductsPrice) throws SQLException {
		String sql = " SELECT h.coupon_no, coupon_name, discount, duplication, max_discount "
				+ " FROM have_coupon h JOIN coupon c ON h.coupon_no = c.coupon_no "
				+ " WHERE member_no = " + memberNo + " AND delivery_type = 1 AND used = 0 AND NVL(c.discount, discount) <= " + priductsPrice;
		
		OrderCouponDTO dto = null;
		ArrayList<OrderCouponDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<>();
				do {
					dto = new OrderCouponDTO();
					dto.setCouponNo(rs.getInt("coupon_no"));
					dto.setCouponName(rs.getString("coupon_name"));
					dto.setDiscount(rs.getDouble("discount"));
					dto.setDuplication(rs.getInt("duplication"));
					dto.setMaxDiscount(rs.getInt("max_discount"));
					list.add(dto);
				} while (rs.next());
			} // if
		} catch (Exception e) {
			System.out.println("BoxOrderDAO selectCoupon() error...");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // try
		
		return list;
	} // selectCoupon

	@Override
	public OrderMemberInfoDTO getNameAndTel(Connection conn, int memberNo) throws SQLException {
		String sql = " SELECT name, tel "
				+ " FROM member "
				+ " WHERE member_no = " + memberNo;
		
		OrderMemberInfoDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {
					dto = new OrderMemberInfoDTO();
					dto.setName(rs.getString("name"));
					dto.setTel(rs.getString("tel"));
				} while (rs.next());
			} // if
		} catch (Exception e) {
			System.out.println("BoxOrderDAO getNameAndTel() error...");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // try
		
		return dto;
	} // getNameAndTel
	
	@Override
	public int insertBoxOrder(Connection conn, BoxOrderDTO dto) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertBoxOrderedProducts(Connection conn, BoxOrderProductDTO dto) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertBoxShip(Connection conn, BoxShipDTO dto) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<BoxOrderDTO> selectList(Connection conn, int memberNo, Date startSearchDate, Date endSearchDate, int pageNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoxOrderDTO selectOne(Connection conn, int boxOrderNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Connection conn, int boxOrderNo) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertPay(Connection conn, BoxPayDTO dto) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
