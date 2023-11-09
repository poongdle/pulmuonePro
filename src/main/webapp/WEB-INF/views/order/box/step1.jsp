<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="domain.order.box.ProductsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/layouts/head.jsp"%>
<body>
	<div class="wrapper">
<%  %>
		<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
		<main class="page order">
			<div class="container">

				<div class="contents-area">
					<%@ include file="/WEB-INF/views/layouts/orderForm.jsp"%>
						<div class="checkout-title-area">
						<%
							String [] prod = request.getParameterValues("produtsNo");
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
														<em>${ dto.productsType }</em> <b class="prd-title"></b>
														<span class="volume">(${ dto.productsSize })</span>
													</a>
													<input type="hidden" data-count="0" value="${ param.produtsCnt }">
													<div class="prd-select-amount">
														<em>${ param.produtsCnt }</em>개
													</div>
												</div>
											</div>

											<div class="prd-cart-btn-price">
												<div></div>
												<div class="price-info">
													<em class="before-price">
														<em data-print-price="${ dto.price * param.produtsCnt }">${ dto.price * param.produtsCnt }</em> <span>원</span>
													</em>
													<b class="now-price">
														<b data-print-price="${ dto.eventPrice * param.produtsCnt }">${ dto.eventPrice * param.produtsCnt }</b> <span>원</span>
													</b>
												</div>
											</div>
										
										</div>
									</li>
								</c:forEach>
								
							</ul>
						</div>

						<div class="checkout-input-area">
							<div class="checkout-input-title-area">
								<h3 class="checkout-input-title">배송정보</h3>
								<button type="button">
									<i class="ico ico-down"></i> <span class="hide">현재화면 닫기</span>
								</button>
							</div>
											
							<div class="checkout-input-box">
								<div class="prd-cart-all-select">
									<div class="checkbox chk-type3">
										<input type="checkbox" name="chk-same" id="chk-same" checked="">
										<label for="chk-same">고객정보와 동일</label>
									</div>
									<button id="addressBtn" type="button" class="btn-round2">주소록</button>
								</div>

								<div class="form-input">
									<dl>
										<dt>
											<label for="receiver">받으시는분</label>
										</dt>
										<dd>
											<input type="text" data-receiver="" id="receiver" name="orderName" title="이름을 입력하세요"
												placeholder="이름을 입력하세요" value="이지현" data-init="이지현" data-require="" data-name="받는사람" maxlength="10">
										</dd>
									</dl>
								</div>
												
								<div class="form-input">
									<dl>
										<dt>
											<label for="phone">휴대폰번호</label>
										</dt>
										<dd>
											<input type="hidden" id="phone" name="orderPhone" maxlength="13" title="휴대폰번호를 입력하세요" data-call-text=""
												placeholder="휴대폰번호를 입력하세요" value="01055234090" data-init="01055234090" data-require="" data-name="휴대폰번호">
											<input type="tel" name="_x_orderPhone" maxlength="13" title="휴대폰번호를 입력하세요"
												placeholder="휴대폰번호를 입력하세요" value="01055234090" data-init="01055234090" data-require="" data-name="휴대폰번호">
										</dd>
									</dl>
								</div>
												
								<div class="form-input">
									<dl>
										<dt>
											<label for="zipcode">우편번호</label>
										</dt>
										<dd>
											<input id="zipcode" readonly="" name="zipCode" title="주소찾기 버튼을 눌러주세요" placeholder="주소찾기 버튼을 눌러주세요"
												value="" data-init="" data-require="" style="background: #fff" data-name="우편번호">
											<input type="hidden" name="orderStreetAddress" id="orderStreetAddress" value="">
											<button type="button" id="searchPostcode" class="btn-square btn-black">주소찾기</button>
										</dd>
									</dl>
								</div>
												
								<div class="form-input">
									<dl>
										<dt>
											<label for="addrRoad">주소</label>
										</dt>
										<dd>
											<input type="text" id="addrRoad" name="addrRoad" title="주소 입력" placeholder="" readonly="" value=""
												data-init="" data-require="" style="background: #fff" data-name="주소">
										</dd>
									</dl>
								</div>
												
								<div class="form-input">
									<dl>
										<dt>
											<label for="addrDetail">상세주소</label>
										</dt>
										<dd>
											<input type="text" id="addrDetail" name="addrDetail" title="상세주소 입력" placeholder="상세주소 입력" value=""
												data-init="" data-require="" data-name="상세주소" maxlength="100">
										</dd>
									</dl>
								</div>
												
								<div class="form-input">
									<dl>
										<dt>
											<label for="memo">배송메모</label>
										</dt>
										<dd>
											<input id="memo" name="orderMemo" title="배송메모를 입력하세요" placeholder="배송메모를 입력하세요" value="" data-init="">
										</dd>
									</dl>
								</div>

								<div class="checkbox chk-type3" style="margin-top: 28px">
									<input type="checkbox" id="saveAddrChk" name="saveAddrChk" value="Y">
									<label for="saveAddrChk">주소록에 저장</label>
								</div>
							</div>
						</div>

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
											<select id="coupon-selector" class="form-select form-select-lg" disabled="">
												<option selected="" value="">사용 가능한 쿠폰이 없습니다.</option>
											</select>
										</dd>
									</dl>
								</div>
								<ul class="file-list-area" id="apply-coupon-list">
								</ul>
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
											<img src="/resources/images/common/checkout-item01.png" alt="">
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
		</form>
</div>
</div>
</main>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>
</div>
</body>
</html>
