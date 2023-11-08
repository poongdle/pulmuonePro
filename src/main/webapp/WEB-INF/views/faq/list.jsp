<%@page import="servlets.faq.model.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String category = request.getParameter("category");
	PageDTO paging = (PageDTO) request.getAttribute("paging");
%>
<%@ include file="/WEB-INF/views/layouts/head.jsp" %>
<body>
	<div class="wrapper">

		<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
		<main class="page faq">
			<div class="container">
				<div class="breadcrumb-style">
                    <div class="wrap">
                        <ul>
                            <li><a href="/">홈</a></li>
                            <li><a href="/forum/faq?category=top10">고객기쁨센터</a></li>
                            <li><a class="active">FAQ</a></li>
                        </ul>
                    </div>
                </div>
                
                <div class="page-wrap">
					<div class="aside">
						<h2 class="title">고객기쁨센터</h2>
						<ul class="lnb-style">
							<li class="active">
								<a href="/forum/faq.do?category=1">FAQ</a>
							</li>
							<li>
								<a href="/forum/action/counsel/write">1:1 문의</a>
							</li>
							<li>
								<a href="/forum/notice">공지사항</a>
							</li>
							<li>
								<a href="/search/branch">배송가능지역 검색</a>
							</li>
						</ul>
					</div>

					<div class="page-content">
						<form id="searchForm">
							<input type="hidden" id="category" name="category" value="<%=category%>">
							<input type="hidden" id="cTitle" name="cTitle" value="">
							<div class="border-wrapper">
								<h2 class="container-title">
									FAQ
								</h2>
							</div>
							<div class="coupon-srch" style="border-bottom:0; padding-bottom:0;">
								<div class="form-input none-dt">
									<dl>
										<dd>
											<input title="검색어 입력" type="text" id="searchKeyword" name="searchKeyword" placeholder="궁금하신 내용을 입력해주세요." value="" maxlength="30">
											<button class="btn-square" id="faqSearchBtn">검색</button>
										</dd>
									</dl>
								</div>
							</div>


							<div class="list-area">
								<div class="tab-area faq">
									<ul class="nav nav-tabs" role="tablist">
				
										<li>
											<a href="/forum/faq/list.do?category=0">TOP 10</a>
										</li>
										
											<li>
												<a href="/forum/faq/list.do?category=1">회원</a>
											</li>
										
											<li>
												<a href="/forum/faq/list.do?category=2" class="">혜택</a>
											</li>
										
											<li>
												<a href="/forum/faq/list.do?category=3" class="">주문/배송</a>
											</li>
										
											<li>
												<a href="/forum/faq/list.do?category=4" >상품</a>
											</li>
										
											<li>
												<a href="/forum/faq/list.do?category=5" class="">음용</a>
											</li>
										
											<li>
												<a href="/forum/faq/list.do?category=6" class="">기타</a>
											</li>
									</ul>
								</div>
									
								<div class="accordion faq-list" id="pagable-list" data-list-object="replace">
										
									<c:forEach items="${ list }" var="item">
										<div class="card">
											<div class="card-header">
												<h2 class="mb-0" style="width: 100%">
													<button class="btn btn-link btn-block text-left"
														type="button" style="width: 100%">${ item.question }</button>
												</h2>
											</div>
											<div class="faq-contents-area">
												<div class="card-body">
													<p>
														<span
															style="font-family: Arial; color: rgb(119, 119, 119);"><span
															style="font-size: 13.3333px;">${ item.answer }</span></span>&nbsp;
													</p>
												</div>
											</div>
										</div>
									</c:forEach>
									
								</div>
								<nav aria-label="Page navigation example" class="pagenavi-area" data-pagination="">
									<input type="hidden" id="pageNo" name="pageNo">
									<ul class="pagination">
										<c:forEach begin="${ paging.start }" end="${ paging.end }" step="1" var="i">
											<c:choose>
												<c:when test="${ i eq paging.currentPage }">
													<li class="page-item active">
														<a class="page-link active">${i }</a>
													</li>	
												</c:when>
												<c:otherwise>
													<li class="page-item">
														<a class="page-link" data-list-more="#pagable-list" data-param="${i }">${i }</a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</ul>
								</nav>
								
							</div>
						</form>
					</div>
				</div>
				
			</div>
		</main>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
 
 	</div>
	
<script>
	$(function(){
		
		$(".tab-area ul li a").removeClass("active");
		$(".tab-area ul li").eq(<%=category%>).find("a").addClass("active");
	})
</script>
</body>
</html>