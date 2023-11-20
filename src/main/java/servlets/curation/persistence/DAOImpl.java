package servlets.curation.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import jdbc.JdbcUtil;
import servlets.curation.domain.CurationDTO;
import servlets.curation.domain.KidsDTO;
import servlets.product.domain.ProductsDTO;


public class DAOImpl implements CurationDAO{

	// 1. 싱글톤
	private DAOImpl() {}
	public DAOImpl(Connection conn) {
		// TODO Auto-generated constructor stub
	}

	private static DAOImpl instance = new DAOImpl();
	public static DAOImpl getInstance() {
		return instance;
	}


	// 키즈
	@Override
	public List<KidsDTO> selectList(Connection con) throws SQLException {
		String sql = "select kids_product_no, program_no, pi.img_no, program_name, dayweek, pi.products_no, p.products_name, program_content, "
				+ "products_tag, system_name, price, products_size, products_sub_name, origin_name "
				+ "from kids_product k join products_img pi on k.products_no = pi.products_no "
				+ "join products p on p.products_name = k.products_name "
				+ "where origin_name not like 'View%' "
				+ "order by kids_product_no";

		ArrayList<KidsDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(sql);
			System.out.println(sql);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				list = new ArrayList<KidsDTO>();
				KidsDTO dto = null;
				do {
					dto =  new KidsDTO();

					dto.setKids_product_no(rs.getInt("kids_product_no"));
					dto.setImg_no(rs.getInt("img_no"));
					dto.setDayweek(rs.getString("dayweek"));
					dto.setProducts_no(rs.getString("products_no"));
					dto.setProducts_name(rs.getString("products_name"));
					dto.setProgram_content(rs.getString("program_content"));
					dto.setSystem_name(rs.getString("system_name"));
					dto.setPrice(rs.getInt("price"));
					dto.setProducts_tag(rs.getInt("products_tag"));
					dto.setProducts_size(rs.getString("products_size"));
					dto.setProducts_sub_name(rs.getString("products_sub_name"));
					dto.setOrigin_name(rs.getString("origin_name"));

					list.add(dto);
				} while ( rs.next() );
			} // 
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} // finally

		return list;
	}

	//썸네일 이미지
	@Override
	public List<KidsDTO> select(Connection con,  int num) throws SQLException {
		String sql = "select products_tag,  products_name, img_no, system_name, price, "
				+ " products_size, products_sub_name "
				+ " from  products_img pi join products p on p.products_no = pi.products_no "
				+ " where products_tag in ( ? )"
				+ " and origin_name like 'View%' "
				+ "order by img_no asc"; 

		ArrayList<KidsDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setInt(1, num);
			//			System.out.println(num);
			//			System.out.println(num2);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				list = new ArrayList<KidsDTO>() ;
				KidsDTO dto = null;

				do {
					dto = new KidsDTO();

					dto.setProducts_tag(rs.getInt("products_tag"));
					dto.setImg_no(rs.getInt("img_no"));
					dto.setProducts_name(rs.getString("products_name"));
					dto.setSystem_name(rs.getString("system_name"));
					dto.setPrice(rs.getInt("price"));
					dto.setProducts_size(rs.getString("products_size"));
					dto.setProducts_sub_name(rs.getString("products_sub_name"));
					list.add(dto);
				} while (rs.next());
			}	

		} finally {

			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		}

		return list;
	}

	// 큐레이션 결과 - 맞춤상품 선택
	@Override
	public List<CurationDTO> selectPD(Connection con,String path, int num) throws SQLException {
		String sql = "select curation_no, program_no,program_name, pi.img_no, dayweek, pi.products_no, p.products_name, program_content, products_tag, "
				+ " system_name, price, products_size, products_sub_name,  lifestyle_change01, lifestyle_change02, lifestyle_change03 "
				+ "from curation_result c join products_img pi on c.img_no = pi.img_no "
				+ "join products p on c.products_no = p.products_no "
				+ "where dayweek is null and program_no in ( ? ) "
				+ "order by curation_no";

		ArrayList<CurationDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			System.out.println(sql);
			rs = pstmt.executeQuery();

			if ( rs.next() ) {
				list = new ArrayList<CurationDTO>();
				CurationDTO dto = null;
				do {
					dto =  new CurationDTO();

					dto.setCuration_no(rs.getInt("curation_no"));
					dto.setProgram_no(rs.getInt("program_no"));
					dto.setProgram_name(rs.getString("program_name"));
					dto.setImg_no(rs.getInt("img_no"));
					dto.setDayweek(rs.getString("dayweek"));
					dto.setProducts_no(rs.getString("products_no"));
					dto.setProducts_name(rs.getString("products_name"));
					dto.setProgram_content(rs.getString("program_content"));
					dto.setSystem_name(rs.getString("system_name"));
					dto.setLifestyle_change01(rs.getString("lifestyle_change01"));
					dto.setLifestyle_change02(rs.getString("lifestyle_change02"));
					dto.setLifestyle_change03(rs.getString("lifestyle_change03"));
					dto.setPrice(rs.getInt("price"));
					dto.setProducts_tag(rs.getInt("products_tag"));
					dto.setProducts_size(rs.getString("products_size"));
					dto.setProducts_sub_name(rs.getString("products_sub_name"));


					list.add(dto);
				} while ( rs.next() );
			} // 
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} // finally

		return list;
	}

	// 큐레이션 결과 - 프로그램 선택
	@Override
	public List<CurationDTO> selectPG(Connection con,String path, int num) throws SQLException {
		String sql =  "select curation_no, program_no,program_name, pi.img_no, dayweek, pi.products_no, p.products_name, program_content, products_tag, "
				+ " system_name, price, products_size, products_sub_name,  lifestyle_change01, lifestyle_change02, lifestyle_change03 "
				+ "from curation_result c join products_img pi on c.img_no = pi.img_no "
				+ "join products p on c.products_no = p.products_no "
				+ "where dayweek is not null and program_no in ( ? ) "
				+ "order by curation_no";

		ArrayList<CurationDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			System.out.println(sql);
			rs = pstmt.executeQuery();

			if ( rs.next() ) {
				list = new ArrayList<CurationDTO>();
				CurationDTO dto = null;
				do {
					dto =  new CurationDTO();

					dto.setCuration_no(rs.getInt("curation_no"));
					dto.setProgram_no(rs.getInt("program_no"));
					dto.setProgram_name(rs.getString("program_name"));
					dto.setImg_no(rs.getInt("img_no"));
					dto.setDayweek(rs.getString("dayweek"));
					dto.setProducts_no(rs.getString("products_no"));
					dto.setProducts_name(rs.getString("products_name"));
					dto.setProgram_content(rs.getString("program_content"));
					dto.setSystem_name(rs.getString("system_name"));
					dto.setLifestyle_change01(rs.getString("lifestyle_change01"));
					dto.setLifestyle_change02(rs.getString("lifestyle_change02"));
					dto.setLifestyle_change03(rs.getString("lifestyle_change03"));
					dto.setPrice(rs.getInt("price"));
					dto.setProducts_tag(rs.getInt("products_tag"));
					dto.setProducts_size(rs.getString("products_size"));
					dto.setProducts_sub_name(rs.getString("products_sub_name"));

					list.add(dto);
				} while ( rs.next() );
			} // 
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} // finally

		return list;
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
	public List<CurationDTO> dailyadd(Connection con, CurationDTO dto) throws SQLException {

		ArrayList<CurationDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;


		String sql = "insert into cart_daily (cart_no, member_no, products_no, mon_cnt, tue_cnt, wed_cnt, thu_cnt, fir_cnt, reg_date) "
				+ " values( ?, ? , '?', ? , ?, ?, ?, ?, sysdate)";

		try {
			pstmt = con.prepareStatement(sql);
			System.out.println(sql);
			rs = pstmt.executeQuery();

			if ( rs.next() ) {
				list = new ArrayList<CurationDTO>();
				do {
					dto =  new CurationDTO();

					dto.setCart_no(rs.getInt("cart_no"));
					dto.setMember_no(rs.getInt("member_no"));
					dto.setProducts_no(rs.getString("products_no"));
					dto.setMon_cnt(rs.getInt("mon_cnt"));
					dto.setTue_cnt(rs.getInt("tue_cnt"));
					dto.setWed_cnt(rs.getInt("wed_cnt"));
					dto.setThu_cnt(rs.getInt("thu_cnt"));
					dto.setFir_cnt(rs.getInt("fir_cnt"));
					dto.setReg_date(rs.getString("reg_date"));
					

					list.add(dto);
				} while ( rs.next() );
			} // 
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} // finally

		return list;
	}

	
	
	@Override
	public int addcart(Connection con, int num) throws SQLException {
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		String sql = " select * from cart_daily ";
		pstmt = con.prepareStatement(sql);
//		pstmt.setInt(1,tag);
//		System.out.println(tag);
//		System.out.println(sql);
		List<CurationDTO> list = null;
		rs = pstmt.executeQuery();	
		int insertRow=0;
		if( rs.next() ) {
			sql = " DELETE FROM products_wish where products_tag = ? ";			
		}else {			
			sql = " INSERT INTO products_wish "
					+ "select products_no, category_no, products_name, products_sub_name, products_type, content, price, event_price "
					+ " , products_size, delivery_type, tag_no1, tag_no2, tag_no3, tag_no4, tag_no5, products_tag, reg_date, event_tag, event_tag2 "
					+ " from products "
					+ " WHERE products_tag = ? ";
		}	
		try {
			pstmt = con.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setInt(1, num);
			//			System.out.println(num);
			//			System.out.println(num2);
		
			if ( rs.next() ) {
				list = new ArrayList<CurationDTO>() ;
				CurationDTO dto = null;

				do {
					dto = new CurationDTO();

					dto.setProducts_name(rs.getString("products_name"));
					dto.setSystem_name(rs.getString("system_name"));
					dto.setPrice(rs.getInt("price"));
					dto.setProducts_tag(rs.getInt("product_tag"));
					dto.setProducts_no(rs.getString("products_no"));
					list.add(dto);
				} while (rs.next());
			}

		} finally {

			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		}

		return insertRow;
	}
	
	
	
}
