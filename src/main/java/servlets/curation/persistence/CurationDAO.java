package servlets.curation.persistence;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import servlets.curation.domain.CurationDTO;
import servlets.curation.domain.KidsDTO;

public interface CurationDAO {


   // 6. 맞춤 프로그램
//   List<CurationDTO> selectPG(Connection con, String path) throws SQLException;
   List<CurationDTO> selectPG( Connection con,String path, int num) throws SQLException;
//   CurationDTO selectPG(Connection con) throws SQLException;
   
   //   // 7. 맞춤 상품
   List<CurationDTO> selectPD(Connection con,String path, int num) throws SQLException;
   
   // 8. 키즈 상품
//   KidsDTO select(Connection con, int num) throws SQLException;
   List<KidsDTO> selectList(Connection con) throws SQLException;
   List<KidsDTO> select(Connection con, int num) throws SQLException;
   
//   int cartadd(Connection con, int tag) throws SQLException;
// 장바구니
   
   List<CurationDTO> addcart (Connection con , int num) throws SQLException;
  List<CurationDTO> dailyadd(Connection con,  CurationDTO dto) throws SQLException;
//ArrayList<CurationDTO> addcart(Connection con, ArrayList<String> products_tag) throws SQLException;
}
