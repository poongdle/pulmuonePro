package servlets.order.persistence;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import servlets.order.domain.DrkOrderProductDTO;

public interface DrkOrderDAO {
	
	// 1. 상품 정보 조회
	ArrayList<DrkOrderProductDTO> selectProducts(Connection conn, ArrayList<String> productsNo) throws SQLException;
	
}