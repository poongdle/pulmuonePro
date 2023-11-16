package servlets.event.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import servlets.event.domain.EventWinnerDTO;

public class WinViewService {

    private static WinViewService instance = new WinViewService();

    public static WinViewService getInstance() {
        return instance;
    }

    private WinViewService() {}

    public EventWinnerDTO selectWinner(int win_board_no) {
        EventWinnerDTO winner = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
            conn = ds.getConnection();

            String sql = "SELECT * FROM winner_board WHERE win_board_no = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, win_board_no);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                winner = new EventWinnerDTO();
                winner.setWin_board_no(rs.getInt("win_board_no"));
                winner.setWin_title(rs.getString("win_title"));
                winner.setWin_content(rs.getString("win_content"));
                winner.setWin_regdate(rs.getDate("win_regdate"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return winner;
    }
}
