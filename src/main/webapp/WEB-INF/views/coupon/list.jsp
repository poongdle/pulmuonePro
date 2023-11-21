<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/layouts/head.jsp"%>
<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
		<main class="page forum">
			<div class="breadcrumb-style">
				<div class="container">
					<ul>
						<li><a href="/">홈</a></li>
						<li><a href="/mypage.do">MY녹즙</a></li>
						<li><a class="active" href="">쿠폰</a></li>
					</ul>
				</div>
			</div>
			<div class="container aside-layout" style="padding-bottom: 120px;">
				<%@ include file="/WEB-INF/views/layouts/mypage/aside.jsp"%>
				<div class="container">
					<div class="border-wrapper">
						<h2 class="container-title">쿠폰</h2>
						<div class="page-tab">
							<a href="/mypage/benefit/coupon.do" class="active">전체</a> <a
								href="/mypage/benefit/coupon?type=CPTP012">매일배송</a> <a
								href="/mypage/benefit/coupon?type=CPTP013">택배배송</a>
							<button style="margin-left: 20px; color: #7acc12"
								onclick="openWindowPop('/resources/assets/images/common/couponGuide.png','popup')"
								target="img">쿠폰사용가이드</button>
						</div>
					</div>
					<div class="coupon-srch">
						<form id="registCoupon">
							<div class="form-input none-dt">
								<dl>
									<dt>
										<label>쿠폰번호</label>
									</dt>
									<dd>
										<input type="text" name="code" placeholder="쿠폰번호를 입력하세요.">
										<button class="btn-square">쿠폰등록</button>
									</dd>
								</dl>
							</div>
						</form>
					</div>
					<div class="page-addiction-wrapper"
						style="align-items: center; margin-bottom: 2px;">
						<div class="info-copy"></div>
						<div class="price-tag coupon right">
							<label>사용가능한 쿠폰</label>
							<p class="value">0</p>
						</div>
					</div>
					<div class="coupon-item-list">
						<ul id="pagable-list" data-list-object="append">
							<li>
								<div class="item disabled">
									<div style="min-height: 175px" class="body">
										<div
											style="display: flex; justify-content: space-between; min-height: 35px">
											<h4>웰컴쿠폰</h4>
										</div>
										<div class="date">
											<p>2023.10.23 ~ 2024.01.25</p>
											<span> 66일남음 </span>
										</div>
										<ul>
											<li>중복사용가능</li>
											<li class="prtn">전 매일배송상품 사용가능 &nbsp;&nbsp;/&nbsp;&nbsp;
												전 가맹점 사용가능</li>
										</ul>
									</div>
									<div class="foot">
										<p class="price">
											5,000<span>원</span>
										</p>
										<p class="out">사용완료</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="alert-area lg between"
						style="padding-top: 38px; margin-top: 30px">
						<h4 style="margin-bottom: 17px;">유의사항</h4>
						<ul>
							<li>매일 배송 상품에 사용 가능한 쿠폰은 매 월 25일까지 스마트청구서에서 적용 가능합니다.</li>
							<li>스마트청구서는 MY녹즙&gt;매일배송음용내역&gt;영수증조회에서 확인 가능합니다.</li>
							<li>스마트청구서에서 사용한 쿠폰은 사용 취소가 불가합니다.</li>
							<li>가맹점 사정에 따라 일부 쿠폰은 사용이 불가할 수 있습니다.</li>
						</ul>
					</div>
				</div>
			</div>

		</main>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>
		<%@ include file="/WEB-INF/views/ui/footermodal.jsp"%>		
		<img src="/resources/assets/images/common/couponGuide.png" style="display: none" id="guideImage" alt="">
	</div>	
</body>
</html>
