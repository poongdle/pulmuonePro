package servlets.event.persistence;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import servlets.event.domain.EventWinnerDTO;

public interface IEventWinner {

	   // 1. 글 목록
	   List<EventWinnerDTO> selectList(Connection con) throws SQLException;

	   // 2. 글 추가
	   int insert( Connection con, EventWinnerDTO dto) throws SQLException;

	   // 4. 글 상세 보기
	   EventWinnerDTO selectOne( Connection con, int num) throws SQLException;

	   // 6. 삭제
	   int delete(Connection con, int num) throws SQLException;
	
}
