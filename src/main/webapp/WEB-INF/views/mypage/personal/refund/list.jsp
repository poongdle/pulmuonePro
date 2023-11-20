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
					<li><a class="active">MY녹즙</a></li>
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
					<div class="box-partition refund">
					<c:choose>
						<c:when test="${ acctOwner != null }">
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
							<div class="btn-area-right" style="margin-top:20px; margin-right:2px;">
								<button type="button" id="delete" style="padding:0; width:140px;" class="btn-default btn-white">삭제</button>
								<a href="/mypage/personal/refund/1503" id="modify" style="padding:0; width:140px;" class="btn-default btn-default">계좌정보 변경</a>
							</div>
						
						</c:when>



						<c:otherwise>
							<div class="caution-unit page">
								<span class="mark"></span>
								<p>등록된 환불계좌가 없습니다.</p>
							</div>
						</c:otherwise>
					</c:choose>
				
				</div>
			</div>
					
			</div> <!-- container aside-layout main -->

		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>

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
</body>
</html>
