package servlets.cart.persistence;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import servlets.cart.domain.CartDTO;

public interface CartDAO {


// 장바구니
   
ArrayList<CartDTO> cartList (Connection con , ArrayList<String> products_no) throws SQLException;
  int dailyadd(Connection con,  CartDTO dto) throws SQLException;
//ArrayList<CurationDTO> addcart(Connection con, ArrayList<String> products_tag) throws SQLException;
}
