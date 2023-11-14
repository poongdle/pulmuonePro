<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/inc/session_auth.jspf" %>


<%
	// 세션 삭제(제거)
	// 1) 즉시 강제 종료 : session.invalidate()
	// 2) 자동 제거 : 약 20분 간 요청이 없는 경우, 자동으로 세션이 종료됨.

	session.invalidate();
%>

<script>
	alert("<%= auth.getName() %>님 로그아웃하셨습니다.");
	location.href = "/index.jsp";

</script>