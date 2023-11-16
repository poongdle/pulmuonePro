<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="board-write">
	<span style="text-decoration: underline"> <a
		href="/member/login?redirectUrl=/event/event/view/${event_no}">로그인</a>
	</span>
	<div class="textarea">
		<textarea id="content" title="댓글을 남겨보세요." placeholder="댓글을 남겨보세요" maxlength="500"></textarea>
		<button id="write-review" type="button">댓글등록</button>
	</div>
</div>
<div class="board-review-list-area">
    <div class="list-head">
        <em class="count">댓글 <span>${totalComments}</span></em>
    </div>
    <ul class="board-review-list" data-list-object="replace" id="pagable-list">
        <c:forEach var="comment" items="${comments}">
            <li style="position: relative">
                <div class="board-review-cont" style="width: 100%">
                    <b>${comment.member_no}</b> <!-- 회원 번호를 표시. 회원 이름을 표시하려면 적절한 속성을 사용하세요 -->
                    <p class="review-content-${comment.comment_no}">${comment.content}</p>
                    <span class="text-day">${comment.write_date}</span>
                </div>
                <div class="review-util-btn" style="white-space: nowrap; position: absolute; top: 32px; right: 0" data-idx="${comment.comment_no}" data-eventidx="${comment.event_no}"></div>
            </li>
        </c:forEach>
    </ul>
</div>

<nav aria-label="Page navigation example" class="pagenavi-area" data-pagination="">
    <input type="hidden" id="pageNo" name="pageNo">
    <ul class="pagination">
        <c:forEach var="i" begin="1" end="${totalPages}">
            <li class="page-item ${i == currentPage ? 'active' : ''}">
                <a class="page-link" href="/event/event/view.do?event_no=${eventView.event.event_no}&currentPage=${i}">${i}</a>
            </li>
        </c:forEach>
    </ul>
</nav>

<!-- 미완 댓글 작성 
<script>
document.getElementById('write-review').addEventListener('click', postComment);

function postComment() {
    var content = document.getElementById('content').value;

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/event/comment/post.do');
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.send('event_no=' + encodeURIComponent(${eventView.event.event_no}) + '&content=' + encodeURIComponent(content));

    xhr.onload = function() {
        if (xhr.status === 200 || xhr.status === 201) {
            alert('댓글이 등록되었습니다.');
            location.reload();
        } else {
            console.error(xhr.responseText);
        }
    };
}
</script>
 -->