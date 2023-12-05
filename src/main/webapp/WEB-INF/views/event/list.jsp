<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/layouts/head.jsp"%>
<body>

	<div class="wrapper">

		<%@ include file="/WEB-INF/views/layouts/header.jsp"%>

		<div class="contents-area">
			<div class="container">
				<div class="location">
					<a href="/">홈</a> <a href="/event/event/list.do">이벤트</a>
				</div>
				<div class="cont-event-area">
					<%@ include file="/WEB-INF/views/layouts/event/title_tab_area.jsp"%>

					<div class="tab-pane fade show active" id="profile" role="tabpanel"
						aria-labelledby="profile-t">

						<h3 class="hide">진행중이벤트</h3>
						<ul class="event-list" id="pagable-list"
							data-list-object="replace">
							
							<c:forEach var="event" items="${onEvent}">
								<li>
									<a href="/event/event/view.do?event_no=${event.event_no}">
										<div class="img-area">
										    <img src="${event.thumbnail.img_path}" alt="${event.event_name}">
										</div>
										<div class="text-area">
											<b>${event.event_name}</b> <span class="text-day">
											<fmt:formatDate value="${event.event_start}" pattern="yyyy.MM.dd" /> ~ 
											<fmt:formatDate value="${event.event_end}" pattern="yyyy.MM.dd" />
											</span>
										</div>
									</a>
								</li>
							</c:forEach>
							
							<%-- 
							<c:if test="${empty list}">
								<p>list is empty or null.</p>
							</c:if>
							<c:if test="${not empty list}">
								<p>list is not empty. It has ${fn:length(list)} items.</p>
							</c:if>
							 --%>
							
						</ul>
						<nav aria-label="Page navigation example" class="pagenavi-area"
							data-pagination="">
							<input type="hidden" id="pageNo" name="pageNo">
							<ul class="pagination">
								<c:forEach var="i" begin="1" end="${pDto.totalPages}">
								    <li class="page-item <c:if test="${i == pDto.currentPage}">active</c:if>">
								        <a class="page-link" href="/event/event/list.do?currentpage=${i}">${i}</a>
								    </li>
								</c:forEach>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>
		<%@ include file="/WEB-INF/views/ui/footermodal.jsp"%>

	</div>

</body>
</html>