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

<script>
$(document).ready(function() {
    $("#content-editor-area > a").click(function(e) {
        e.preventDefault();  // 기본적인 링크 클릭 동작을 막습니다.

        var couponLink = $(this).attr('href');  // 쿠폰 링크를 가져옵니다.

        $.ajax({
            url: couponLink,
            type: 'GET',
            success: function(response) {
                // 서버로부터 응답을 받았을 때 실행되는 코드입니다.
                var message = response.message;  // 응답에서 메시지를 가져옵니다.

                // 모달 창에 메시지를 표시하고, 모달 창을 보이게 합니다.
                $('#modalMessage').text(message);
                $('#messageModal').modal('show');
            }
        });
    });
});
</script>
<div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                </button>
            </div>
            <div class="modal-body">로그인 후 참여가능합니다.</div>
            <div class="modal-footer">
                <button type="button" class="cancel" data-dismiss="modal">취소</button>
                <button type="button" class="confirm" onclick="location.href=$('#login-link').attr('href');">확인</button>
            </div>
        </div>
    </div>
</div>