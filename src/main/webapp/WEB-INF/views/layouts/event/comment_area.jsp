<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="board-write">


    <span style="text-decoration: underline"><a href="/member/login?redirectUrl=/event/event/view/3058">로그인</a></span>

    <div class="textarea">
        <textarea id="content" title="댓글을 남겨보세요." placeholder="댓글을 남겨보세요" maxlength="500"></textarea>
        <button id="write-review" type="button">댓글등록</button>
    </div>
</div>

<div class="board-review-list-area">
    <div class="list-head">
        <em class="count">댓글 <span>1086 </span></em>
    </div>
    <ul class="board-review-list" data-list-object="replace" id="pagable-list">

        <li style="position: relative">
            <div class="board-review-cont" style="width: 100%">
                <b>임*미</b>
                <p class="review-content-16846">퍼플</p>
                <span class="text-day">2023-11-15</span>
            </div>
            <div class="review-util-btn" style="white-space: nowrap;position: absolute;top: 32px;right: 0" data-idx="16846" data-eventidx="3058">

            </div>
        </li>

    </ul>
</div>

<form id="searchForm">
    <nav aria-label="Page navigation example" class="pagenavi-area" data-pagination="">
		<input type="hidden" id="pageNo" name="pageNo">
		<ul class="pagination">
			<c:forEach var="i" begin="1" end="${pDto.totalPages}">
				<li class="page-item <c:if test="${i == pDto.currentPage}">active</c:if>">
					<a class="page-link" href="/event/event/list.do?currentpage=${i}">${i}</a>
				</li>
			</c:forEach>
		</ul>
	</nav>
</form>