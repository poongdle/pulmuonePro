package servlets.event.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import servlets.event.domain.EventWinnerDTO;

public class EventWinnerDAO implements IEventWinner {
    
    @Override
    public List<EventWinnerDTO> selectList(Connection con) throws SQLException {
        String sql = "SELECT * FROM winner_board ORDER BY win_board_no DESC";
        PreparedStatement stmt = con.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        List<EventWinnerDTO> winBoards = new ArrayList<>();
        while (rs.next()) {
            EventWinnerDTO winBoard = new EventWinnerDTO();
            winBoard.setWin_board_no(rs.getInt("win_board_no"));
            winBoard.setWin_title(rs.getString("win_title"));
            winBoard.setWin_content(rs.getString("win_content"));
            winBoard.setWin_regdate(rs.getDate("win_regdate"));
            winBoards.add(winBoard);
        }

        rs.close();
        stmt.close();

        return winBoards;
    }

    @Override
    public int insert(Connection con, EventWinnerDTO dto) throws SQLException {
        String sql = "INSERT INTO winner_board (win_board_no, win_title, win_content, win_regdate) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, dto.getWin_board_no());
        stmt.setString(2, dto.getWin_title());
        stmt.setString(3, dto.getWin_content());
        stmt.setDate(4, new java.sql.Date(dto.getWin_regdate().getTime()));

        int affectedRows = stmt.executeUpdate();
        stmt.close();

        return affectedRows;
    }

    @Override
    public EventWinnerDTO selectOne(Connection con, int num) throws SQLException {
        String sql = "SELECT * FROM winner_board WHERE win_board_no = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, num);
        ResultSet rs = stmt.executeQuery();

        EventWinnerDTO winBoard = null;
        if (rs.next()) {
            winBoard = new EventWinnerDTO();
            winBoard.setWin_board_no(rs.getInt("win_board_no"));
            winBoard.setWin_title(rs.getString("win_title"));
            winBoard.setWin_content(rs.getString("win_content"));
            winBoard.setWin_regdate(rs.getDate("win_regdate"));
        }

        rs.close();
        stmt.close();

        return winBoard;
    }

    @Override
    public int delete(Connection con, int num) throws SQLException {
        String sql = "DELETE FROM winner_board WHERE win_board_no = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, num);

        int affectedRows = stmt.executeUpdate();
        stmt.close();

        return affectedRows;
    }
}
