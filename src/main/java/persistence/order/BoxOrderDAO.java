package persistence.order;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import domain.order.box.BoxOrderDTO;
import domain.order.box.BoxOrderProductsDTO;
import domain.order.box.BoxPayDTO;
import domain.order.box.BoxShipDTO;
import domain.order.box.ProductsDTO;
import jdbc.JdbcUtil;

public class BoxOrderDAO implements BoxOrderImpl {
	
	// 싱글톤
	private BoxOrderDAO() {}
	private static BoxOrderDAO instance = new BoxOrderDAO();
	public static BoxOrderDAO getInstance() {
		return instance;
	}
	
	@Override
	public ArrayList<ProductsDTO> selectProducts(Connection conn, String [] productsNo) throws SQLException {
		String sql = " SELECT p.products_no, category_no, products_name, products_type, products_size, price, event_price, img_path, origin_name "
				+ " FROM products p JOIN products_img i ON p.products_no = i.products_no "
				+ " WHERE p.products_no IN( ";
				for(int i = 0; i <= productsNo.length; i++) {
					sql += productsNo[0]+", ";
				} // for
				sql += " -1 ) ";
				
		ArrayList<ProductsDTO> list = null;
		ProductsDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				list = new ArrayList<>();
				
				do {
					dto = new ProductsDTO();
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
	public int insertBoxOrder(Connection conn, BoxOrderDTO dto) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertBoxOrderProducts(Connection conn, BoxOrderProductsDTO dto) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertBoxShip(Connection conn, BoxShipDTO dto) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoxOrderDTO> selectList(Connection conn, int memberNo, Date startSearchDate, Date endSearchDate,
			int pageNo) throws SQLException {
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
