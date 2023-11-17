package servlets.franchiseSearch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.JdbcUtil;
import servlets.franchiseSearch.model.AddressDTO;
import servlets.franchiseSearch.model.FranchiseDTO;

public class FranchiseSearchDAOImpl implements FranchiseSearchDAO {

	@Override
	public ArrayList<FranchiseDTO> select(Connection conn, AddressDTO vo) throws SQLException {
		String sql = " SELECT fc.* "
				+ " FROM ( "
				+ "    SELECT fc_name, fc_addr, fc_lat, fc_lng, fc_phone, fc_tel, fc_type, gift_avail, "
				+ "             (6371 * acos ( "
				+ "                        cos ( radians( ? ) ) * cos( radians( fc_lat ) ) * cos( radians( fc_lng ) - radians( ? ) ) "
				+ "                        + sin ( radians( ? ) ) * sin( radians( fc_lat ) ) "
				+ "            )) distance "
				+ "    FROM franchise "
				+ " ) fc "
				+ " WHERE distance < 7 AND ROWNUM <= 2 ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<FranchiseDTO> list = null;
		FranchiseDTO dto = null;
		
		String fc_name; 
		String fc_addr; 
		String fc_phone;
		String fc_tel;  
		int fc_type;    
		int gift_avail; 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1, vo.getY());
			pstmt.setDouble(2, vo.getX());
			pstmt.setDouble(3, vo.getY());
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				list = new ArrayList<>();
				do {
					fc_name = rs.getString("fc_name");
					fc_addr = rs.getString("fc_addr");
					fc_phone = rs.getString("fc_phone");
					fc_tel = rs.getString("fc_tel");
					fc_type = rs.getInt("fc_type");
					gift_avail = rs.getInt("gift_avail");
					
					dto = new FranchiseDTO(fc_name, fc_addr, fc_phone, fc_tel, fc_type, gift_avail);
					
					list.add(dto);
					
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
