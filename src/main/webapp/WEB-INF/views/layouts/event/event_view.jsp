<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="board-cont event-board"
	style="position: relative; min-height: 100px;">
	<div id="content-editor-area" style="line-height: 0;">
		<c:forEach var="image" items="${eventView.images}">
			<c:choose>
				<c:when test="${not empty image.img_link}">
					<a href="${image.img_link}" target="_blank"> <img
						src="${image.img_path}" title="${image.origin_name}"
						class="${image.system_name}" style="line-height: 0;">
					</a>
				</c:when>
				<c:otherwise>
					<img src="${image.img_path}" title="${image.origin_name}"
						class="${image.system_name}" style="line-height: 0;">
				</c:otherwise>
			</c:choose>
			<br style="clear: both;">
		</c:forEach>
	</div>
</div>
