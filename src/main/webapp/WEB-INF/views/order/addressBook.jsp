<%@page import="java.util.Arrays"%>
<%@page import="java.util.Iterator"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="jdbc.JdbcUtil"%>
<%@page import="jdbc.connection.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int memberNo = Integer.parseInt((String) session.getAttribute("auth"));
	
	String sql = " SELECT addr_name, name, tel, dest, zip_code, addr, addr_detail, memo, default_addr, COUNT(member_no) OVER() total_count "
			+ " FROM addr_book " + " WHERE member_no = " + memberNo;
	
	JSONObject jsonData = new JSONObject();
	
	try {
		conn = ConnectionProvider.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	
		JSONArray jsonArr = new JSONArray();
		JSONObject jsonObj = new JSONObject();
	
		String addrName, name, tel, zipCode, addr, addrDetail, memo;
		int dest, defaultAddr, totalCount;
	
		while (rs.next()) {
			addrName = rs.getString("addr_name");
			name = rs.getString("name");
			tel = rs.getString("tel");
			dest = rs.getInt("dest");
			zipCode = rs.getString("zip_code");
			addr = rs.getString("addr");
			addrDetail = rs.getString("addr_detail");
			memo = rs.getString("memo")==null?"":rs.getString("memo");
			defaultAddr = rs.getInt("default_addr");
			totalCount = rs.getInt("total_count");
	
			jsonObj.put("addrName", addrName);
			jsonObj.put("name", name);
			jsonObj.put("tel", tel);
			jsonObj.put("dest", dest);
			jsonObj.put("zipCode", zipCode);
			jsonObj.put("addr", addr);
			jsonObj.put("addrDetail", addrDetail);
			jsonObj.put("memo", memo);
			jsonObj.put("defaultAddr", defaultAddr);
			jsonObj.put("totalCount", totalCount);
			jsonArr.add(jsonObj);
		} // while
	
		// 주소록 데이터를 페이지에 따라 반환
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		int pageSize = 5; // 페이지당 항목 수
		int startIndex = pageNo * pageSize;
		int endIndex = Math.min(startIndex + pageSize, jsonArr.size());
	
		JSONArray pagedArr = new JSONArray();
		
		for(int i = startIndex; i < endIndex; i++) {
			pagedArr.add(jsonArr.get(i));
		} // for
	
		jsonData.put("addrArr", pagedArr);
	} catch (Exception e) {
		System.out.println("addressBook.jsp error");
		e.printStackTrace();
	} finally {
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(conn);
	} // try
%>
<%=jsonData%>