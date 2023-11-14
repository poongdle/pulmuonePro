<%@tag import="auth.AuthInfo"%>
<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%
	HttpSession httpSession = request.getSession(false);
	if (httpSession != null && httpSession.getAttribute("auth") != null) {
		 AuthInfo auth = (AuthInfo) httpSession.getAttribute("auth");
%>
<jsp:doBody />
<%
	}
%>