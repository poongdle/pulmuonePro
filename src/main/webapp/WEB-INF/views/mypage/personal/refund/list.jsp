<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/layouts/head.jsp" %>



<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
		<div class="breadcrumb-style">
			<div class="container">
				<ul>
					<li><a href="/">홈</a></li>
					<li><a href="/mypage">MY녹즙</a></li>
					<li><a class="" href="/mypage/">개인정보</a></li>
					<li><a class="active" href="/mypage/drink/drink">음용내역</a></li>
				</ul>
			</div>
		</div>
		<div class="container aside-layout main" style="padding-bottom:100px; ">
			<%@ include file="/WEB-INF/views/layouts/mypage/aside.jsp" %>
				
			<div class="container">
					<div class="border-wrapper">
						<h2 class="container-title">
							환불계좌 관리
						</h2>
					</div>
					<c:choose>
						<c:when test="${ acctOwner != null }">
							<div class="box-partition refund">
								<div class="part" style="padding-top:24px; padding-bottom:26px;">
									<ul class="document-style">
										<li>
											<label>은행명</label>
											<p>${ insttName }</p>
											
										</li>
										<li>
											<label>예금주</label>
											<p>${ acctOwner }</p>
											
										</li>
										<li>
											<label>계좌번호</label>
											<p>${ maskedAcctNum }</p>
											
										</li>
									</ul>
								</div>
							</div>
							<div class="btn-area-right" style="margin-top:20px; margin-right:2px;">
								<form action="/mypage/personal/refund/write.do" method="post" id="acctInfo">
									<input type="hidden" name="insttCode" value="${ insttCode }">
									<input type="hidden" name="insttName" value="${ insttName }">
									<input type="hidden" name="acctOwner" value="${ acctOwner }">
									<input type="hidden" name="acctNum" value="${ acctNum }">
								</form>
								<button type="button" id="delete" style="padding:0; width:140px;" class="btn-default btn-white">삭제</button>
								<button type="submit" id="modify" style="padding:0; width:140px;" class="btn-default btn-default" form="acctInfo">계좌정보 변경</button>
<!-- 								<a href="/mypage/personal/refund/1503" id="modify" style="padding:0; width:140px;" class="btn-default btn-default">계좌정보 변경</a> -->

							</div>
						</c:when>

						<c:otherwise>
							<div class="box-partition refund">
								<div class="caution-unit page">
									<span class="mark"></span>
									<p>등록된 환불계좌가 없습니다.</p>
								</div>
							</div>
							<div class="btn-area-right" style="margin-top:20px; margin-right:2px;">
								<a style="cursor: pointer; padding:0; width:140px;" href="/mypage/personal/refund/write.do" class="btn-default ">환불계좌 등록</a>
							</div>
						</c:otherwise>
					</c:choose>

			</div>
					
			</div> <!-- container aside-layout main -->

		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
		<%@ include file="/WEB-INF/views/ui/footermodal.jsp"%>

 	</div> <!-- wrapper -->
 	
<script>
	$(function () {
	    $("div.item p").each(function(index) {
	        if ($(this).text() != 0) {
	            $("div.item:eq(" + index + ")").parent("li").addClass("active");
	        } // if
	    });
	})
</script>

<script type="text/javascript">
//     $().ready(
//         function () {
// 				$('#delete').click(function (){
// 					confirmDesign("", "환불계좌를 삭제하시겠습니까?",function(){
// 						post({url:'/mypage/personal/refund/delete/1503'},function (r){
// 							if(r.RESULT_MSG){
// 								alert('삭제되었습니다.',()=>location.reload())
// 							}else {
// 								return alert('잘못된 요청입니다.',()=>location.reload())
// 							}
// 						})
// 					})
// 				})
//         })
</script>


</body>
</html>
