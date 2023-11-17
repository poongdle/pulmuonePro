<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="board-write">
    <span style="text-decoration: underline">
        <a href="/member/login?redirectUrl=/event/event/view/${event_no}" id="login-link">로그인</a>
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

<style> /* 모달창 스타일 */
.modal-content {
	max-width: 350px;
}

.modal-header{
	border: 0px;
	padding: 20px 20px 0px;
}

.modal-body {
    font-weight: 300;
    letter-spacing: -1.2px;
    text-align: center;
    color: #333;
    padding: 30px 20px 40px;
    background: #fff;
}

.modal-footer {
	padding: 0px;
}

.modal-footer .cancel {
	border-bottom-left-radius: 26px;
    background: #333333;
    color: #fff;
    flex: 1;
    font-size: 15px;
    font-weight: 500;
    font-stretch: normal;
    font-style: normal;
    line-height: 1.73;
    letter-spacing: -1.13px;
    text-align: center;
    justify-content: center;
    height: 60px;
    margin: 0px;
}

.modal-footer .confirm {
    border-bottom-right-radius: 26px;
    background: #7acc12;
    color: #fff;
    flex: 1;
    font-size: 15px;
    font-weight: 500;
    font-stretch: normal;
    font-style: normal;
    line-height: 1.73;
    letter-spacing: -1.13px;
    text-align: center;
    justify-content: center;
    height: 60px;
    margin: 0px;
}
</style>

<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true" role="dialog">
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



<script>
$(document).ready(function() {
    
    $(".page-link").click(function(e) {
        e.preventDefault(); 

        $(".page-item").removeClass("active");
        $(this).parent().addClass("active");
        
        var pageNo = $(this).text();
        var eventNo = ${eventView.event.event_no};

        $.ajax({
            url: "/event/event/EventComment.ajax", 
            type: "GET",
            data: {
                event_no: eventNo,
                currentPage: pageNo
            },
            dataType: "json",
            success: function(response) {
                
                $("#pagable-list").empty();
                $.each(response.comments, function(i, comment) {
                    $("#pagable-list").append(
                        '<li style="position: relative">' +
                            '<div class="board-review-cont" style="width: 100%">' +
                                '<b>' + comment.member_no + '</b>' +
                                '<p class="review-content-' + comment.comment_no + '">' + comment.content + '</p>' +
                                '<span class="text-day">' + comment.write_date + '</span>' +
                            '</div>' +
                            '<div class="review-util-btn" style="white-space: nowrap; position: absolute; top: 32px; right: 0" data-idx="' + comment.comment_no + '" data-eventidx="' + comment.event_no + '"></div>' +
                        '</li>'
                    );
                });
                $(".count > span").text(response.totalComments);
                
                $('html, body').animate({
                    scrollTop: $('.board-write').offset().top
                }, 'slow');
            },
            error: function(jqXHR, textStatus, errorThrown) { 
                console.log(textStatus, errorThrown);
            }
        });
    });
});
</script>

<script> /* 모달창 */
    $(document).ready(function() {
        $('#write-review').click(function() {
            $('#loginModal').modal('show');
        });
    });
</script>

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