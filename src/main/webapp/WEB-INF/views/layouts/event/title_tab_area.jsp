<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%
    HttpServletRequest Erequest = (HttpServletRequest) pageContext.getRequest();
    String requestURI = Erequest.getRequestURI();
%>
<%-- <% out.println(requestURI); %> --%>
<div class="title-tab-area">
	<h2 class="cont-title">이벤트</h2>
	<ul class="nav nav-tabs nav-justified" id="myTab-area" role="tablist">
		<li class="nav-item" role="presentation">
			<a href="/event/event/list.do" class="nav-link <%= requestURI.contains("/event/list") ? "active" : "" %>"
			style="padding-right: 4px; margin-bottom: 0px; height: 47px">진행중이벤트</a>
		</li>
		<li class="nav-item" role="presentation">
			<a href="/event/event/end/list.do" class="nav-link <%= requestURI.contains("/event/end/list") ? "active" : "" %>"
			style="padding-right: 4px; margin-bottom: 0px; height: 47px">종료된이벤트</a>
		</li>
		<li class="nav-item" role="presentation">
			<a href="/event/event/winner" class="nav-link <%= requestURI.contains("/event/winner") ? "active" : "" %>"
			style="margin-bottom: 0px; padding-right: 0; height: 47px">당첨자발표</a>
		</li>
		<li class="nav-item" role="presentation">
			<a href="/event/event/view/2394" class="nav-link "
			style="padding-right: 4px; margin-bottom: 0px; height: 47px">친구초대</a>
		</li>
		<li class="nav-item" role="presentation">
			<a ref="/event/event/view/2757" class="nav-link "
			style="margin-bottom: 0px; height: 47px">회원혜택</a>
		</li>
	</ul>
</div>