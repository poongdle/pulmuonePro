package servlets.mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import jdbc.JdbcUtil;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import servlets.mypage.dto.BoxOrderListDTO;
import servlets.mypage.dto.BoxOrderSimpleInfoDTO;
import servlets.order.domain.BoxOrderDTO;
import servlets.order.domain.BoxOrderInfoDTO;
import servlets.order.domain.BoxOrderProductDTO;


@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class MypageDAOImpl implements MypageDAO {

	private Connection conn = null;
	
	// 1. 매일배송 관련
	
	
	// 2. 택배배송 관련
	// 	1) 총 택배배송 주문 건수 
	@Override
	public int boxOrderCnt(int memberNo) throws SQLException {
		String sql = " SELECT COUNT(*) total_cnt " 
				+ " FROM box_order "
				+ " WHERE member_no = " + memberNo;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int boxOrderCnt = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				boxOrderCnt = rs.getInt("total_cnt");
			} // if
		} catch (Exception e) {
			System.out.println("MypageDAOImpl.boxOrderCnt() error...");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // try
		return boxOrderCnt;
	} // boxOrderCnt()

	// 	2) 택배배송 주문 내역
	//		a. 결제완료 주문 건수, 배송준비중 주문 건수, 배송중 주문건수, 배송완료 주문건수
	@Override
	public int [] boxOrderStatus(int memberNo) throws SQLException {
		String sql = " SELECT COUNT(*) status_cnt " 
				+ " FROM box_order "
				+ " WHERE member_no = ? AND box_order_status = ? ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int [] orderCnt = new int [4];
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			for (int i = 0; i < 4; i++) {
				pstmt.setInt(2, i+1);
				rs = pstmt.executeQuery();
				
				if (rs.next()) orderCnt[i] = rs.getInt("status_cnt");
			} // for
			
		} catch (Exception e) {
			System.out.println("MypageDAOImpl.boxOrderStatus() error...");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // try
		return orderCnt;
	} // boxOrderStatus

	// 		b. 최근 2개의 주문 내역 정보(주문번호, 상품명, 결제금액, 주문일자, 주문상태)
	@Override
	public ArrayList<BoxOrderSimpleInfoDTO> currBoxOrderList(int memberNo) throws SQLException {
		String sql = " SELECT box_order_no, products_name, box_order_date, box_order_status, box_final_price " 
				+ " FROM ( "
					+ " WITH pn AS ( "
						+ " SELECT box_order_no, products_name "
						+ " FROM ( "
								+ " SELECT box_order_no, products_no, ROW_NUMBER() OVER(PARTITION BY box_order_no ORDER by products_no) AS prn "
								+ " FROM box_order_products "
							+ " ) op JOIN products p ON op.products_no = p.products_no "
						+ " WHERE prn = 1 "
					+ " ) "
					+ " SELECT o.box_order_no, products_name, box_order_date, box_order_status, box_final_price "
						+ " , ROW_NUMBER() OVER(PARTITION BY member_no ORDER BY o.box_order_no DESC ) AS rn "
					+ " FROM pn JOIN box_order o ON pn.box_order_no = o.box_order_no "
							+ " JOIN box_pay p ON pn.box_order_no = p.box_order_no "
					+ " WHERE member_no = ? "
					+ " ) "
				+ " WHERE rn IN (1, 2) ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		BoxOrderSimpleInfoDTO dto = null;
		ArrayList<BoxOrderSimpleInfoDTO> list = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<>();
				do {
					dto = new BoxOrderSimpleInfoDTO();
					dto.setOrderNo(rs.getInt("box_order_no"));
					dto.setProductsName(rs.getString("products_name"));
					dto.setBoxOrderDate(rs.getString("box_order_date"));
					dto.setBoxOrderStatus(rs.getInt("box_order_status"));
					dto.setFinalPrice(rs.getInt("box_final_price"));
					list.add(dto);
				} while (rs.next());
			} // if
		} catch (Exception e) {
			System.out.println("MypageDAOImpl.currBoxOrderList() error...");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // try
		return list;
	} // currBoxOrderList()
	
	// 	3) 택배배송 주문 내역 - 리스트 조회 및 날짜 검색
	@Override
	public ArrayList<BoxOrderListDTO> selectBoxOrderList(int memberNo, String startSearchDate, String endSearchDate) throws SQLException {
		String sql = " SELECT box_order_no, box_order_date, box_order_status "
				+ " FROM box_order "
				+ " WHERE member_no = ? AND box_order_date BETWEEN ? AND ? ";
		
		String sql2 = " SELECT DISTINCT p.products_no, products_type, products_name, products_size, products_cnt, price, event_price, img_path, origin_name "
				+ " FROM box_order_products o JOIN products p ON o.products_no = p.products_no "
										+ " JOIN products_img i ON p.products_no = i.products_no "
				+ " WHERE box_order_no = ? AND origin_name = 'View.png' ";
		
		PreparedStatement pstmt1 = null;
		ResultSet rs1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		BoxOrderListDTO odto = null;
		BoxOrderProductDTO pdto = null;
		ArrayList<BoxOrderListDTO> list1 = null;
		ArrayList<BoxOrderProductDTO> list2 = null;

		try {
			pstmt1 = conn.prepareStatement(sql);
			pstmt1.setInt(1, memberNo);
			pstmt1.setString(2, startSearchDate);
			pstmt1.setString(3, endSearchDate);
			rs1 = pstmt1.executeQuery();
			if (rs1.next()) {
				list1 = new ArrayList<>();
				do {
					odto = new BoxOrderListDTO();
					odto.setBoxOrderNo(rs1.getInt("box_order_no"));
					odto.setBoxOrderDate(rs1.getString("box_order_date"));
					odto.setBoxOrderStatus(rs1.getInt("box_order_status"));
					
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setInt(1, rs1.getInt("box_order_no"));
					rs2 = pstmt2.executeQuery();
					
					if (rs2.next()) {
						list2 = new ArrayList<>();
						do {
							pdto = new BoxOrderProductDTO();
							pdto.setProductsNo(rs2.getString("products_no"));
							pdto.setProductsType(rs2.getString("products_type"));
							pdto.setProductsName(rs2.getString("products_name"));
							pdto.setProductsSize(rs2.getString("products_size"));
							pdto.setProductsCnt(rs2.getString("products_cnt"));
							pdto.setPrice(rs2.getInt("price"));
							pdto.setEventPrice(rs2.getInt("event_price"));
							pdto.setImgPath(rs2.getString("img_path"));
							pdto.setOriginName(rs2.getString("origin_name"));
							list2.add(pdto);
						} while (rs2.next());
					} // if
					
					JdbcUtil.close(pstmt2);
					JdbcUtil.close(rs2);
					odto.setProductList(list2);
					
					list1.add(odto);
				} while (rs1.next());
			} // if
		} catch (Exception e) {
			System.out.println("MypageDAOImpl.selectBoxOrderList() error...");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt2);
			JdbcUtil.close(rs2);
			JdbcUtil.close(pstmt1);
			JdbcUtil.close(rs1);
		} // try
		return list1;
	}

	
	// 3. 시음선물 관련
	
	
	// 4. 쿠폰 관련
				
				
	// 5. 리뷰 관련
				
				
	// 6. 1:1 문의 관련
	
	
	
	
} // class
