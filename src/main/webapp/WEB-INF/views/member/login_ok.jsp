<%@page import="auth.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	// days07.AuthInfo.java
	
	String memberNo = request.getParameter("memberNo");
	String memberId = request.getParameter("memberId");
	String name = request.getParameter("name");

	
// 	session.setAttribute("auth", id);

	
	// 

	// 로그인 성공 시, 메인 페이지로 이동
	String location = "/index.jsp";

	// referer가 있으면 
	String referer = (String) session.getAttribute("referer");

	if (referer != null) {
		location = referer;
		session.removeAttribute("referer");
	}
	
	response.sendRedirect(location);

	
%>