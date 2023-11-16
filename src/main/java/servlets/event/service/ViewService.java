package servlets.event.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import servlets.event.domain.EventDTO;
import servlets.event.domain.EventImageDTO;
import servlets.event.domain.EventViewDTO;

public class ViewService {
    private static ViewService instance = new ViewService();

    public static ViewService getInstance() {
        return instance;
    }

    private ViewService() {}

    public EventViewDTO selectEvent(int event_no) {
        EventViewDTO dto = null;
        EventDTO eventDTO = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
            conn = ds.getConnection();

            String sql = "SELECT e.event_no, e.event_name, e.event_start, e.event_end, e.event_notice, i.img_no, i.system_name, i.origin_name, i.img_size, i.img_type, i.img_path, i.img_link " +
                         "FROM event e INNER JOIN event_image i ON e.event_no = i.event_no WHERE e.event_no = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, event_no);
            rs = pstmt.executeQuery();

            List<EventImageDTO> images = new ArrayList<>();  // 이미지 리스트 생성

            while (rs.next()) {
                if (dto == null) {  // 첫 번째 행인 경우
                    dto = new EventViewDTO();
                    eventDTO = new EventDTO();
                    eventDTO.setEvent_no(rs.getInt("event_no"));
                    eventDTO.setEvent_name(rs.getString("event_name"));
                    eventDTO.setEvent_start(rs.getDate("event_start"));
                    eventDTO.setEvent_end(rs.getDate("event_end"));
                    eventDTO.setEvent_notice(rs.getString("event_notice"));
                    dto.setEvent(eventDTO);  // EventDTO 객체 설정
                }

                EventImageDTO imageDTO = new EventImageDTO();  // 이미지 정보를 담는 객체 생성
                imageDTO.setImg_no(rs.getString("img_no"));
                imageDTO.setSystem_name(rs.getString("system_name"));
                imageDTO.setOrigin_name(rs.getString("origin_name"));
                imageDTO.setImg_size(rs.getString("img_size"));
                imageDTO.setImg_type(rs.getString("img_type"));
                imageDTO.setImg_path(rs.getString("img_path"));
                imageDTO.setImg_link(rs.getString("img_link"));
                images.add(imageDTO);  // 이미지 리스트에 추가
            }

            if (dto != null) {
                dto.setImages(images);  // 이미지 리스트 설정
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }

        return dto;
    }


}
