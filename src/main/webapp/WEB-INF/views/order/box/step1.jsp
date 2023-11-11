<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="domain.order.box.BoxOrderProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/layouts/head.jsp"%>
<style>
	
</style>
<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
		<main class="page order">
			<div class="container">

				<div class="contents-area">
					<%@ include file="/WEB-INF/views/layouts/orderForm.jsp"%>
						<div class="checkout-title-area">
						<%
							String [] prod = request.getParameterValues("productsNo");
							int prdCnt = prod.length;
						%>
							<strong class="list-amount">주문상품 <em class="prd-count" style="padding: 0 16px; margin-left: 2px"><%= prdCnt %></em></strong>
							<button type="button" class="btn-down">
								<i class="ico ico-down"><span class="hide">주문서 닫기</span></i>
							</button>
						</div>

							<ul style="padding: 0px 20px;" class="prd-cart-list cart-box-list box-list-type2" id="order_targets">
								
								<c:forEach items="${ productList }" var="dto">
									<li class="order-item" data-itemcode="${ dto.productsNo }" data-origin-price="${ dto.price }" data-price="${ dto.eventPrice }" style="padding: 20px 0 18px;">
										<div class="prd-cart-info-area">
											<div class="flex-l">
												<a class="thumb">
													<img src="${ dto.imgPath }/${ dto.originName }" alt="${ dto.productsName }">
												</a>
												<div class="prd-info-select-amount">
													<a href="/product/box/728?eventIdx=" class="prd-info">
														<em>${ dto.productsType }</em> <b class="prd-title">${ dto.productsName }</b>
														<span class="volume">(${ dto.productsSize })</span>
													</a>
													<input type="hidden" data-count="0" value="${ param.productsCnt }">
													<div class="prd-select-amount">
														<em>${ param.productsCnt }</em>개
													</div>
												</div>
											</div>

											<div class="prd-cart-btn-price">
												<div></div>
												<div class="price-info">
													<em class="before-price">
														<em data-print-price="${ dto.price * param.productsCnt }">${ dto.price * param.productsCnt }</em> <span>원</span>
													</em>
													<b class="now-price">
														<b data-print-price="${ dto.eventPrice * param.productsCnt }">${ dto.eventPrice * param.productsCnt }</b> <span>원</span>
													</b>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
								
							</ul>
						</div>

						<%@ include file="/WEB-INF/views/layouts/addrInputForm.jsp"%>

						<div class="checkout-input-area" style="padding-bottom: 32px" id="coupon-pane">
							<div class="checkout-input-title-area" style="margin-bottom: 17px">
								<h3 class="checkout-input-title">쿠폰적용</h3>
							</div>
							
							<div class="checkout-input-box">
								<div class="form-input">
									<dl>
										<dt>
											<label for="input01">쿠폰선택</label>
										</dt>
										<dd>
											<select id="coupon-selector" class="form-select form-select-lg">
												<c:choose>
													<c:when test="${ empty couponList }">
														<option value="" selected>사용 가능한 쿠폰이 없습니다.</option>
														<script>
															$("#coupon-selector").prop("disabled", true);
														</script>
													</c:when>
													<c:otherwise>
														<option value="" selected>= 쿠폰 선택 =</option>
														<c:forEach items="${ couponList }" var="coupon">
															<option value="">${ coupon.couponName }&nbsp&nbsp|&nbsp&nbsp${ coupon.discount }원</option>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</select>
										</dd>
									</dl>
								</div>
								<!-- 
								일단 주석... - 지현
								<ul class="file-list-area" id="apply-coupon-list">
								</ul>
								-->
							</div>
						</div>

						<div class="checkout-input-area">
							<div class="checkout-input-title-area">
								<h3 class="checkout-input-title">결제정보</h3>
							</div>
							<div class="select-checkout-area">

								<ul class="nav nav-tabs nav-justified" id="myTab-area" role="tablist">
									<li class="nav-item" role="presentation">
										<a href="#" class="nav-link active" id="checkout-type-tab1" data-target="#checkout-type1" data-value="Card"
											data-toggle="tab" role="tab" aria-controls="checkout-type1" aria-selected="true">
											<img src="/resources/assets/images/ui/ico-checkout-item01-on.png" alt="" width="90%" height="90%">
											<span>카드결제</span>
										</a>
									</li>
													
									<li class="nav-item" role="presentation">
										<a href="#" class="nav-link" data-value="DirectBank" id="checkout-type-tab2" data-target="#checkout-type2"
											data-toggle="tab" role="tab" aria-controls="checkout-type2" aria-selected="false">
											<span>실시간 계좌이체</span>
										</a>
									</li>
												
									<li class="nav-item" role="presentation">
										<a href="#" class="nav-link" data-value="VBank" id="checkout-type-tab3" data-target="#checkout-type3"
											data-toggle="tab" role="tab" aria-controls="checkout-type3" aria-selected="false">
											<span>가상계좌</span>
										</a>
									</li>
								</ul>
												
								<div class="tab-content checkout-input-box" id="myTabContent">
									<div class="tab-pane fade show active" role="tabpanel" id="checkout-type1" aria-labelledby="checkout-type-tab1"></div>
									<div class="tab-pane fade" role="tabpanel" id="checkout-type2" aria-labelledby="checkout-type-tab2"></div>
								</div>
							</div>
						</div>
					</div>

					<div class="prd-checkout-area creat-checkout2">
						<dl>
							<dt>
								<span>상품 판매가 </span> <b>
									<div class="now-price">
										<b data-price-view="origin">225,000</b> <span>원</span>
									</div>
								</b>
							</dt>
							<dd>

								<span>상품 할인 판매가</span> <b>
									<div class="now-price">
										<b data-price-view="sale" class="minus">195,000</b> <span>원</span>
									</div>
								</b>
							</dd>

							<dd>
								<span>쿠폰 할인 금액</span>
								<b>
									<div class="now-price minus">
										<b data-price-view="coupon">0</b> <span>원</span>
									</div>
								</b>
							</dd>
							<dd>
								<span>배송비</span>
								<b>
									<div class="now-price">
										<b data-price-view="delivery">0</b> <span>원</span>
									</div>
								</b>
							</dd>

							<dd class="checkout-sum">
								<span>최종 결제금액</span>
								<b>
										<div class="now-price">
										<b data-price-view="payment">195,000</b> <span>원</span>
									</div>
								</b>
							</dd>
						</dl>
						<div class="checkbox chk-type4">
							<input type="checkbox" id="agree-11" name="chk-agree-condition">
								<label for="agree-11">구매조건 확인 및 결제진행 동의</label>
						</div>

						<div class="checkout-text" style="margin-top: 20px">
							<p>개인 변심에 의한 반품 또는 교환 시 별도 배송비가 청구됩니다.</p>
							<p>냉장 상품은 상품 특성 상 개인 변심에 의한 반품/ 교환이 불가합니다.</p>
							<p>상품에 따라 출고 지연이 발생할 수 있으며, 출고 지연 시 개별적으로 안내 드립니다.</p>
							<p>회원 본인은 위 내용을 확인하였으며, 구매조건, 결제대행 서비스 및 결제에 동의합니다.</p>
						</div>

						<button type="button" id="allOrderBtn" class="btn-default">주문하기</button>
					</div>
				</div>
			</div>
		</form></div>

	<div class="modal show" id="addressModal" tabindex="-1" aria-labelledby="addressModal" style="display: block; padding-left: 19px;" aria-modal="true" role="dialog">
		<div class="modal-dialog modal-dialog-centered" style="max-width: 500px; margin: 1.75rem auto;">
			<div class="modal-content ">
				<div class="modal-header">
					<h5 class="modal-title" id="emailPolicyLabel">주소록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body" style="max-height: 80vh; overflow-y: scroll">
					<div class="drinking-list address" style="margin: 0">
						<div class="item" style="margin: 0; border-radius: 0">
							<div class="head">
								<div class="nickname-format xl">
									<h5>이지현</h5>
								</div>
								<ul class="info" style="margin-top: 15px; padding-left: 1px;">
									<li>
										<p>이지현</p>
									</li>
									<li>
										<p>010-5523-4090</p>
									</li>
									<li>
										<p>(08843) 서울 관악구 문성로32가길 17 201호</p>
									</li>
								</ul>
							</div>
							<div class="tail">
								<button type="button" class="adapt-address rounded-button">선택</button>
							</div>
						</div>
					</div>
					<div style="padding: 20px; display: none;">
						<button class="btn-default btn-white" style="width: 100%">더보기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(function() {
			$("#addressModal").dialog({
				autoOpen : false,
				modal : true
			});

			$("#addressBtn").on("click", function() {
				$("#addressModal").dialog("open");
			});
		});
	</script>
</div>

</main>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>
</div>
</body>
</html>
