package servlets.event.persistence;

import java.sql.*;
import java.util.*;

import servlets.event.domain.EventCommentDTO;

public class EventCommentDAO implements IEventCommnet{

    @Override
    public List<EventCommentDTO> selectList(Connection con, int event_no) throws SQLException {
        List<EventCommentDTO> comments = new ArrayList<>();
        String sql = "SELECT * FROM event_comment WHERE event_no = ?";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, event_no);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    EventCommentDTO comment = new EventCommentDTO(
                        rs.getInt("comment_no"),
                        rs.getInt("event_no"),
                        rs.getInt("member_no"),
                        rs.getDate("write_date"),
                        rs.getString("content")
                    );
                    comments.add(comment);
                }
            }
        }
        return comments;
    }

    @Override
    public int insert(Connection con, EventCommentDTO dto) throws SQLException {
        String sql = "INSERT INTO event_comment (event_no, member_no, write_date, content) VALUES (?, ?, ?, ?)";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, dto.getEvent_no());
            pstmt.setInt(2, dto.getMember_no());
            pstmt.setDate(3, dto.getWrite_date());
            pstmt.setString(4, dto.getContent());
            return pstmt.executeUpdate();
        }
    }

    @Override
    public int delete(Connection con, int comment_no) throws SQLException {
        String sql = "DELETE FROM event_comment WHERE comment_no = ?";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setInt(1, comment_no);
            return pstmt.executeUpdate();
        }
    }

    @Override
    public int update(Connection con, int comment_no, String content) throws SQLException {
        String sql = "UPDATE event_comment SET content = ? WHERE comment_no = ?";
        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, content);
            pstmt.setInt(2, comment_no);
            return pstmt.executeUpdate();
        }
    }

}
