package servlets.franchiseSearch.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import servlets.franchiseSearch.model.AddressDTO;
import servlets.franchiseSearch.model.FranchiseDTO;

public interface FranchiseSearchDAO {
	// 가맹점 조회
	ArrayList<FranchiseDTO> select(Connection conn, AddressDTO vo) throws SQLException;
}
