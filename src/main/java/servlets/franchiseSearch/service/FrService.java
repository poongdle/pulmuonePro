package servlets.franchiseSearch.service;

import java.sql.Connection;
import java.util.ArrayList;

import jdbc.connection.ConnectionProvider;
import servlets.franchiseSearch.dao.FranchiseSearchDAO;
import servlets.franchiseSearch.dao.FranchiseSearchDAOImpl;
import servlets.franchiseSearch.model.AddressDTO;
import servlets.franchiseSearch.model.FranchiseDTO;

public class FrService {
	private FranchiseSearchDAO frDAO = new FranchiseSearchDAOImpl();
	
	public ArrayList<FranchiseDTO> select(AddressDTO vo) {
		ArrayList<FranchiseDTO> list = null;
		try ( Connection conn = ConnectionProvider.getConnection()) {
			list = frDAO.select(conn, vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
