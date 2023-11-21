<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layouts/head.jsp"%>
<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
		<main class="page">
			<div id="container-wrapper" class="container-wrapper">
				<div class="breadcrumb-style">
					<div class="container">
						<ul>
							<li><a href="/">홈</a></li>
							<li><a href="/mypage.do">MY녹즙</a></li>
							<li><a class="active" href="">시음선물내역</a></li>
						</ul>
					</div>
					<div class="container aside-layout" style="padding-bottom: 120px;">
						<%@ include file="/WEB-INF/views/layouts/mypage/aside.jsp"%>
						<div class="container">
							<div class="border-wrapper">
								<h2 class="container-title">시음선물내역</h2>
							</div>
							<div class="page-addiction-wrapper"
								style="align-items: center; margin-bottom: 20px;">
								<div class="info-copy description"
									style="padding-left: 3px; padding-top: 2px;">
									<p>
										총 <b>0</b>건
									</p>
								</div>
								<div class="form-input select none-dt" style="width: 228px;">
									<dl>
										<dt>문의유형</dt>
										<dd>
											<div class="dropdown">
												<a class="btn dropdown-toggle" href="javascript:void(0);"
													role="button" data-value="3m" data-toggle="dropdown"
													aria-expanded="false"
													style="height: 60px; padding-left: 19px; padding-top: 2px;">
													최근 3개월 </a>
												<div class="dropdown-menu">
													<a class="dropdown-item 3m" data-value="3m"
														href="javascript:void(0);">최근 3개월</a> <a
														class="dropdown-item 6m" data-value="6m"
														href="javascript:void(0);">최근 6개월</a> <a
														class="dropdown-item 1y" data-value="1y"
														href="javascript:void(0);">최근 1년</a>
												</div>
											</div>

										</dd>
									</dl>
								</div>
								<div class="form-input period sm none-dt"
									style="margin-left: 10px;">
									<dl class="date" style="height: 60px">
										<dt>기간 설정</dt>
										<dd style="width: 308px;">
											<input type="text" name="daterange" placeholder="기간을 선택하세요">
										</dd>
									</dl>
								</div>
								<div class="btn-wrap">
									<button style="margin-left: 5px; height: 60px; display: none"
										id="searchBtn" class="btn-square btn-black" type="button">조회</button>
								</div>
							</div>
							<div class="delivery-order-list gift">
								<div class="caution-unit page">
									<span class="mark"></span>
									<p>나의 시음선물 내역이 없습니다.</p>
								</div>
								<ul data-list-object="append" id="product-items">
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
	<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>
	<%@ include file="/WEB-INF/views/ui/footermodal.jsp"%>
</body>
</html>

