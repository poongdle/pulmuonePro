<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>풀무원 녹즙</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/assets/images/pul_favicon.png">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/bootstrap-fdd.css">
<link rel="stylesheet" href="/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/assets/css/owl.theme.default.css">
<link rel="stylesheet" href="/resources/assets/css/style.css">
<link rel="stylesheet" href="/resources/assets/css/list.css">
<script src="/resources/assets/js/jquery-2.1.4.min.js"></script>
<script src="/resources/assets/js/jquery.form.min.js"></script>
<script src="/resources/assets/js/owl.carousel.min.js"></script>
<script src="/resources/assets/js/fdd.js"></script>
<script src="/resources/assets/js/request.js"></script>
<script src="/resources/assets/js/clipboard.min.js"></script>
<script src="/resources/assets/js/design.js"></script>
<script src="/resources/assets/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	$(".visual-area").fddCarousel({auto: 5000});
	$("#head-items").owlCarousel({
		items: 4,
		nav: true,
	})
});
</script>
</head>
<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
		<main class="page-dailylist">
			<div id="container-wrapper" class="container-wrapper">
				<!--S: 메인 비주얼-->
				<div class="visual-area">
					<div class="controller">
						<button class="arrow left" data-carousel="prev">
							<span></span> <span></span>
						</button>
						<div class="number">
							<p data-carousel="current">1</p>
							<span></span>
							<p data-carousel="max">5</p>
						</div>
						<button class="arrow right" data-carousel="next">
							<span></span> <span></span>
						</button>
					</div>
					<div class="vis-list" data-carousel="items">
						<a class="item active"
							href="https://greenjuice.pulmuone.com/product/daily/732"
							title="제품 상세페이지로 가기" style="background-color: #111111"> <img
							src="/file/download/banner/84c3f8d0-5ae5-462b-9fea-cac7bc1d34fd.png"
							alt="">
						</a> <a class="item right"
							href="https://greenjuice.pulmuone.com/product/search?searchKeyword=%ED%95%B8%EB%94%94%EB%B0%80"
							title="제품 상세페이지로 가기" style="background-color: #ffffff"> <img
							src="/file/download/banner/35b19bec-324b-41d6-812d-cdf8f00eb6cb.png"
							alt="">
						</a> <a class="item right"
							href="https://greenjuice.pulmuone.com/product/daily?category=&amp;tags=478"
							title="제품 상세페이지로 가기" style="background-color: #ffffff"> <img
							src="/file/download/banner/67c0a15e-a321-4513-8015-a973651fb8e8.png"
							alt="">
						</a> <a class="item" target="_blank"
							href="https://greenjuice.pulmuone.com/product/daily/315?eventIdx="
							title="제품 상세페이지로 가기" style="background-color: #111111"> <img
							src="/file/download/banner/6c036b45-96cf-4189-812a-82f2b36f7bcb.png"
							alt="">
						</a> <a class="item left"
							href="https://greenjuice.pulmuone.com/product/daily/430"
							title="제품 상세페이지로 가기" style="background-color: #f7f0d6"> <img
							src="/file/download/banner/2b301cd0-0431-47b6-ab77-9c180e55ef96.png"
							alt="">
						</a>
					</div>
				</div>
				<div class="section best-section">
					<div class="container">
						<h2 class="part-title">BEST &amp; NEW</h2>
						<div class="prd-list">
							<div id="head-items" class="owl-carousel owl-loaded owl-drag">
								<div class="owl-stage-outer">
									<div class="owl-stage"
										style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 6170px;">
										<c:forEach var="dto" items="${dailylist }">
										<div class="owl-item active" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/${dto.products_tag }?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges">
														<span class="badge">BEST</span>
													</div>
													<div class="thumb">
														<img src="/file/download/product/${dto.system_name }" alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title">${dto.products_name }</b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"><fmt:formatNumber value="${dto.price }" pattern="#,###"/><span> 원</span></b>
														</div>
														<span class="volume">(${dto.products_size })</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="281"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0071654"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>										
										</c:forEach>
										<!-- <div class="owl-item active" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/281?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges">
														<span class="badge">BEST</span>
													</div>
													<div class="thumb">
														<img
															src="/file/download/product/f1dfce0b-663c-4486-a7a3-188f199ba502.jpg"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title">위러브플러스</b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price">2,900<span> 원</span></b>
														</div>
														<span class="volume">(130ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="281"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0071654"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item active" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/315?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges"></div>
													<div class="thumb">
														<img
															src="/file/download/product/2476a7ea-a06c-4af4-a117-1666a39fe56f.jpg"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title">식물성유산균 위&amp;캡슐</b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price">2,500<span> 원</span></b>
														</div>
														<span class="volume">(130ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="315"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0070776"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item active" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/726?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges"></div>
													<div class="thumb">
														<img
															src="/file/download/product/1c884ddf-10fc-4cb8-854e-792ba5bc4875.png"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> 위러브 엑스투 </b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"> 3,500 <span> 원</span>
															</b>
														</div>
														<span class="volume">(137g)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="726"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0073405"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item active" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/442?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges"></div>
													<div class="thumb">
														<img
															src="/file/download/product/685a5aac-588c-4366-82c4-217f17b38067.jpg"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> 핸디밀 그린샐러드 식이섬유플랜 </b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"> 3,300 <span> 원</span>
															</b>
														</div>
														<span class="volume">(190ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="442"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0073184"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/590?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges"></div>
													<div class="thumb">
														<img
															src="/file/download/product/1ab610f3-bbfa-487c-ab1f-824ef52f315f.jpg"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> 진한 흑도라지&amp;수세미 </b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"> 2,500 <span> 원</span>
															</b>
														</div>
														<span class="volume">(80ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="590"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0073325"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/439?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges">
														<span class="badge">BEST</span>
													</div>
													<div class="thumb">
														<img
															src="/file/download/product/33675fee-f9b3-49ad-ae57-ebf63ea93651.jpg"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> 칸러브 엑스투 </b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"> 3,100 <span> 원</span>
															</b>
														</div>
														<span class="volume">(130ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="439"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0073019"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/723?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges"></div>
													<div class="thumb">
														<img
															src="/file/download/product/c4e38bfb-9926-4cfc-bb92-973a4401c609.png"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> ABC플러스 </b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"> 2,800 <span> 원</span>
															</b>
														</div>
														<span class="volume">(130ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="723"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0073344"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/324?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges"></div>
													<div class="thumb">
														<img
															src="/file/download/product/046a3d94-e61f-48f4-aed7-5f303b8e6daa.png"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> AP 프로바이오틱스 </b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"> 2,200 <span> 원</span>
															</b>
														</div>
														<span class="volume">(130ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="324"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0071664"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/307?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges"></div>
													<div class="thumb">
														<img
															src="/file/download/product/6c0a390a-2fa7-49b7-9ec3-138d7afbe665.jpg"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> 산이내린녹용과삼의힘 </b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"> 5,000 <span> 원</span>
															</b>
														</div>
														<span class="volume">(100ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="307"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0071928"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/444?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges"></div>
													<div class="thumb">
														<img
															src="/file/download/product/fccdbbd3-f74a-43f7-a898-aa55f1de5faa.jpg"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> 핸디밀 리얼그레인 프로틴플랜 </b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"> 3,300 <span> 원</span>
															</b>
														</div>
														<span class="volume">(190ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="444"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0073156"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/588?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges"></div>
													<div class="thumb">
														<img
															src="/file/download/product/6325439c-9c58-4c7e-a129-90afaf1c7f10.jpg"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> 히알&amp;콜라겐 식물성유산균 </b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"> 2,500 <span> 원</span>
															</b>
														</div>
														<span class="volume">(130ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="588"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0073327"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/278?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges">
														<span class="badge">BEST</span>
													</div>
													<div class="thumb">
														<img
															src="/file/download/product/517eebaa-b721-4dba-b620-76689d2a25ab.jpg"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> 러브미 케일&amp;셀러리녹즙 </b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"> 2,100 <span> 원</span>
															</b>
														</div>
														<span class="volume">(130ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="278"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0070680"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/316?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges"></div>
													<div class="thumb">
														<img
															src="/file/download/product/0512477d-b440-4adf-9cd3-3cc9ca29ab98.png"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> 식물성유산균쌀요거트 </b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"> 2,300 <span> 원</span>
															</b>
														</div>
														<span class="volume">(150ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="316"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0070445"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/440?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges"></div>
													<div class="thumb">
														<img
															src="/file/download/product/4cf0398b-fb18-45f9-97c4-be8b5bd2edd6.jpg"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> 하트러브 엑스투 </b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"> 3,300 <span> 원</span>
															</b>
														</div>
														<span class="volume">(130ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="440"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0073080"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/411?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges"></div>
													<div class="thumb">
														<img
															src="/file/download/product/66c8c37a-048e-4900-9883-52d5b3932ecf.jpg"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> AP 슈퍼그린 </b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"> 2,300 <span> 원</span>
															</b>
														</div>
														<span class="volume">(130ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="411"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0072652"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/443?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges"></div>
													<div class="thumb">
														<img
															src="/file/download/product/42da9a6f-9889-4ff7-bf77-af5989855f86.jpg"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> 핸디밀 블랙콩콩 비타D플랜 </b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"> 3,300 <span> 원</span>
															</b>
														</div>
														<span class="volume">(190ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="443"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0073155"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/451?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges"></div>
													<div class="thumb">
														<img
															src="/file/download/product/b56b1b50-26e0-43c9-828b-0409a183c294.jpg"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> 비트 품은 진한 여주&amp;돼지감자 </b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"> 2,500 <span> 원</span>
															</b>
														</div>
														<span class="volume">(100ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="451"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0073274"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/312?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges"></div>
													<div class="thumb">
														<img
															src="/file/download/product/f9534e63-ccc8-4dc8-8e07-1d7243c308de.png"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> 식물성유산균 오메가&amp;치아씨드 </b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"> 2,500 <span> 원</span>
															</b>
														</div>
														<span class="volume">(130ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="312"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0070800"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/430?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges"></div>
													<div class="thumb">
														<img
															src="/file/download/product/ecc8e6be-08ba-42a0-a9f9-a620944fe11d.jpg"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> 슈퍼키즈하이 </b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"> 2,000 <span> 원</span>
															</b>
														</div>
														<span class="volume">(130ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="430"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0072840"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div>
										<div class="owl-item" style="width: 308.5px;">
											<div class="prd-area">
												<a href="/product/daily/612?eventIdx=" title="제품 상세페이지로 가기">
													<div class="badges"></div>
													<div class="thumb">
														<img
															src="/file/download/product/abde0d7f-d546-4cc4-acec-99a4b895b9d7.jpg"
															onerror="this.src='/resources/images/common/no_img.png'"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> 아이러브엑스투 </b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"> 3,300 <span> 원</span>
															</b>
														</div>
														<span class="volume">(130ml)</span>
													</div>
												</a>
												<div class="btn-area btn-area-center">
													<button type="button" data-wish-id="612"
														data-wish-type="daily"
														class="btn-round btn-white wishlistBtn ">
														<i class="ico ico-prd-wish"></i> <span class="hide">제품
															찜하기</span>
													</button>
													<button type="button" data-cart-id="0073271"
														data-cart-type="daily" data-cart-event=""
														class="btn-round addCartBtn">
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</div> -->
									</div>
								</div>
<!-- 								<div class="owl-nav"> -->
<!-- 									<button type="button" role="presentation" -->
<!-- 										class="owl-prev disabled"> -->
<!-- 										<span aria-label="Previous">‹</span> -->
<!-- 									</button> -->
<!-- 									<button type="button" role="presentation" class="owl-next"> -->
<!-- 										<span aria-label="Next">›</span> -->
<!-- 									</button> -->
<!-- 								</div> -->
<!-- 								<div class="owl-dots"> -->
<!-- 									<button role="button" class="owl-dot active"> -->
<!-- 										<span></span> -->
<!-- 									</button> -->
<!-- 									<button role="button" class="owl-dot"> -->
<!-- 										<span></span> -->
<!-- 									</button> -->
<!-- 									<button role="button" class="owl-dot"> -->
<!-- 										<span></span> -->
<!-- 									</button> -->
<!-- 									<button role="button" class="owl-dot"> -->
<!-- 										<span></span> -->
<!-- 									</button> -->
<!-- 									<button role="button" class="owl-dot"> -->
<!-- 										<span></span> -->
<!-- 									</button> -->
<!-- 								</div> -->
							</div>
						</div>
					</div>
				</div>
				<form id="searchForm">
					<input type="hidden" name="category" value=""> 
					<input type="hidden" name="tags" value=""> 
					<div class="cbody-wrap">
						<div class="bg-light-gray over-section"
							style="margin-bottom: 120px">
							<div class="container">
								<div class="tag-place">
									<button data-idx="242" type="submit" class="tag-btn item ">유기농</button>
									<button data-idx="7"   type="button" class="tag-btn item ">융복합녹즙</button>
									<button data-idx="478" type="button" class="tag-btn item ">케일</button>
									<button data-idx="479" type="button" class="tag-btn item ">양배추</button>
									<button data-idx="262" type="button" class="tag-btn item ">식물성유산균</button>
									<button data-idx="327" type="button" class="tag-btn item ">발효유</button>
									<button data-idx="395" type="button" class="tag-btn item ">식사대용</button>
									<button data-idx="457" type="button" class="tag-btn item ">이달의녹즙</button>
								</div>
								<div class="tab-content" id="tab-content-depth2">
									<div class="prd-list-head">
										<p class="count">
											총 <em>${fn:length(list) }</em>건의 상품이 있습니다.
										</p>
									</div>
									<div class="prd-list wrap" data-list-object="append" id="product-items">
									<c:forEach var="dto" items="${list }">
 										<div class="prd-area">
											<a href="/product/daily/${dto.products_tag }?eventIdx=" title="제품 상세페이지로 가기">
												<div class="badges">
													<span class="badge">BEST</span>
												</div>
												<div class="thumb">
													<img src="/file/download/product/${dto.system_name }" alt="제품명">
												</div>
												<div class="prd-info">
													<div class="prd-title-wrapper">
														<b class="prd-title"> ${dto.products_name } </b>
													</div>
													<div class="price-info" style="margin-bottom: 5px;">
														<b class="now-price"><fmt:formatNumber value="${dto.price }" pattern="#,###"/>  
														<span> 원</span>														
														</b>
													</div>
													<span class="volume">(${dto.products_size })</span>
												</div>
											</a>
											<div class="btn-area btn-area-center">
												<button type="button" data-wish-id="${dto.products_tag }"
													data-wish-type="daily"
													class="btn-round btn-white wishlistBtn ">
													<i class="ico ico-prd-wish"></i> <span class="hide">제품
														찜하기</span>
												</button>
												<button type="button" data-cart-id="${dto.products_no }"
													data-cart-type="daily" data-cart-event=""
													class="btn-round addCartBtn">
													<i class="ico ico-prd-cart"></i> 
													<span class="hide">장바구니에 담기</span>
												</button>
											</div>
										</div>								
									</c:forEach>
<!-- 										<div class="prd-area">
											<a href="/product/daily/278?eventIdx=" title="제품 상세페이지로 가기">
												<div class="badges">
													<span class="badge">BEST</span>
												</div>
												<div class="thumb">
													<img
														src="/file/download/product/517eebaa-b721-4dba-b620-76689d2a25ab.jpg"
														onerror="this.src='/resources/images/common/no_img.png'"
														alt="제품명">
												</div>
												<div class="prd-info">
													<div class="prd-title-wrapper">
														<b class="prd-title"> 러브미 케일&amp;셀러리녹즙 </b>
													</div>
													<div class="price-info" style="margin-bottom: 5px;">
														<b class="now-price"> 2,100 <span> 원</span>
														</b>
													</div>
													<span class="volume">(130ml)</span>
												</div>
											</a>
											<div class="btn-area btn-area-center">
												<button type="button" data-wish-id="278"
													data-wish-type="daily"
													class="btn-round btn-white wishlistBtn ">
													<i class="ico ico-prd-wish"></i> <span class="hide">제품
														찜하기</span>
												</button>
												<button type="button" data-cart-id="0070680"
													data-cart-type="daily" data-cart-event=""
													class="btn-round addCartBtn">
													<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
														담기</span>
												</button>
											</div>
										</div>
										<div class="prd-area">
											<a href="/product/daily/273?eventIdx=" title="제품 상세페이지로 가기">
												<div class="badges">
													<span class="badge">BEST</span>
												</div>
												<div class="thumb">
													<img
														src="/file/download/product/a5e4ffc9-e98f-49a2-9371-2f2b9952dd9c.jpg"
														onerror="this.src='/resources/images/common/no_img.png'"
														alt="제품명">
												</div>
												<div class="prd-info">
													<div class="prd-title-wrapper">
														<b class="prd-title"> 오! 생즙 </b>
													</div>
													<div class="price-info" style="margin-bottom: 5px;">
														<b class="now-price"> 2,700 <span> 원</span>
														</b>
													</div>
													<span class="volume">(130ml)</span>
												</div>
											</a>
											<div class="btn-area btn-area-center">
												<button type="button" data-wish-id="273"
													data-wish-type="daily"
													class="btn-round btn-white wishlistBtn ">
													<i class="ico ico-prd-wish"></i> <span class="hide">제품
														찜하기</span>
												</button>
												<button type="button" data-cart-id="0072348"
													data-cart-type="daily" data-cart-event=""
													class="btn-round addCartBtn">
													<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
														담기</span>
												</button>
											</div>
										</div>
										<div class="prd-area">
											<a href="/product/daily/280?eventIdx=" title="제품 상세페이지로 가기">
												<div class="badges"></div>
												<div class="thumb">
													<img
														src="/file/download/product/42f32473-d37b-4ef8-8fe7-7358a4ec4bd5.jpg"
														onerror="this.src='/resources/images/common/no_img.png'"
														alt="제품명">
												</div>
												<div class="prd-info">
													<div class="prd-title-wrapper">
														<b class="prd-title"> 마시는새싹 발효녹즙 </b>
													</div>
													<div class="price-info" style="margin-bottom: 5px;">
														<b class="now-price"> 2,400 <span> 원</span>
														</b>
													</div>
													<span class="volume">(130ml)</span>
												</div>
											</a>
											<div class="btn-area btn-area-center">
												<button type="button" data-wish-id="280"
													data-wish-type="daily"
													class="btn-round btn-white wishlistBtn ">
													<i class="ico ico-prd-wish"></i> <span class="hide">제품
														찜하기</span>
												</button>
												<button type="button" data-cart-id="0071823"
													data-cart-type="daily" data-cart-event=""
													class="btn-round addCartBtn">
													<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
														담기</span>
												</button>
											</div>
										</div>
										<div class="prd-area">
											<a href="/product/daily/270?eventIdx=" title="제품 상세페이지로 가기">
												<div class="badges"></div>
												<div class="thumb">
													<img
														src="/file/download/product/84556e6b-4304-4462-83ab-9d1bb7fda93d.jpg"
														onerror="this.src='/resources/images/common/no_img.png'"
														alt="제품명">
												</div>
												<div class="prd-info">
													<div class="prd-title-wrapper">
														<b class="prd-title"> 유기케일녹즙 </b>
													</div>
													<div class="price-info" style="margin-bottom: 5px;">
														<b class="now-price"> 2,600 <span> 원</span>
														</b>
													</div>
													<span class="volume">(130ml)</span>
												</div>
											</a>
											<div class="btn-area btn-area-center">
												<button type="button" data-wish-id="270"
													data-wish-type="daily"
													class="btn-round btn-white wishlistBtn ">
													<i class="ico ico-prd-wish"></i> <span class="hide">제품
														찜하기</span>
												</button>
												<button type="button" data-cart-id="0015701"
													data-cart-type="daily" data-cart-event=""
													class="btn-round addCartBtn">
													<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
														담기</span>
												</button>
											</div>
										</div>
										<div class="prd-area">
											<a href="/product/daily/430?eventIdx=" title="제품 상세페이지로 가기">
												<div class="badges"></div>
												<div class="thumb">
													<img
														src="/file/download/product/ecc8e6be-08ba-42a0-a9f9-a620944fe11d.jpg"
														onerror="this.src='/resources/images/common/no_img.png'"
														alt="제품명">
												</div>
												<div class="prd-info">
													<div class="prd-title-wrapper">
														<b class="prd-title"> 슈퍼키즈하이 </b>
													</div>
													<div class="price-info" style="margin-bottom: 5px;">
														<b class="now-price"> 2,000 <span> 원</span>
														</b>
													</div>
													<span class="volume">(130ml)</span>
												</div>
											</a>
											<div class="btn-area btn-area-center">
												<button type="button" data-wish-id="430"
													data-wish-type="daily"
													class="btn-round btn-white wishlistBtn ">
													<i class="ico ico-prd-wish"></i> <span class="hide">제품
														찜하기</span>
												</button>
												<button type="button" data-cart-id="0072840"
													data-cart-type="daily" data-cart-event=""
													class="btn-round addCartBtn">
													<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
														담기</span>
												</button>
											</div>
										</div>
										<div class="prd-area">
											<a href="/product/daily/452?eventIdx=" title="제품 상세페이지로 가기">
												<div class="badges"></div>
												<div class="thumb">
													<img
														src="/file/download/product/bebdb68e-2fbb-4e9c-ae25-f35a9a47f9de.jpg"
														onerror="this.src='/resources/images/common/no_img.png'"
														alt="제품명">
												</div>
												<div class="prd-info">
													<div class="prd-title-wrapper">
														<b class="prd-title"> 케일&amp;사과 </b>
													</div>
													<div class="price-info" style="margin-bottom: 5px;">
														<b class="now-price"> 2,100 <span> 원</span>
														</b>
													</div>
													<span class="volume">(130ml)</span>
												</div>
											</a>
											<div class="btn-area btn-area-center">
												<button type="button" data-wish-id="452"
													data-wish-type="daily"
													class="btn-round btn-white wishlistBtn ">
													<i class="ico ico-prd-wish"></i> <span class="hide">제품
														찜하기</span>
												</button>
												<button type="button" data-cart-id="0073140"
													data-cart-type="daily" data-cart-event=""
													class="btn-round addCartBtn">
													<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
														담기</span>
												</button>
											</div>
										</div>
										<div class="prd-area">
											<a href="/product/daily/438?eventIdx=" title="제품 상세페이지로 가기">
												<div class="badges"></div>
												<div class="thumb">
													<img
														src="/file/download/product/7bad52bc-f656-493c-856e-8ed41dc487dc.jpg"
														onerror="this.src='/resources/images/common/no_img.png'"
														alt="제품명">
												</div>
												<div class="prd-info">
													<div class="prd-title-wrapper">
														<b class="prd-title"> 채소습관 케일 </b>
													</div>
													<div class="price-info" style="margin-bottom: 5px;">
														<b class="now-price"> 1,600 <span> 원</span>
														</b>
													</div>
													<span class="volume">(130ml)</span>
												</div>
											</a>
											<div class="btn-area btn-area-center">
												<button type="button" data-wish-id="438"
													data-wish-type="daily"
													class="btn-round btn-white wishlistBtn ">
													<i class="ico ico-prd-wish"></i> <span class="hide">제품
														찜하기</span>
												</button>
												<button type="button" data-cart-id="0072976"
													data-cart-type="daily" data-cart-event=""
													class="btn-round addCartBtn">
													<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
														담기</span>
												</button>
											</div>
										</div> -->
									</div>
									<div class="button-set mb60" data-list-more="#product-items" data-param="2">
								 	  <button type="button" class="basic-big-button">더보기</button>
									</div>
								</div>
							</div>
							E:2depth 탭 컨텐츠
						</div>
					</div>
					E:cbody
				</form>
				<!--  <script>
  $(function(){

    axios.get('/user_summary/default').then(function (response) {

      const {info, customerVo} = response.data.RESULT_MSG;

		const ec = ( !info.overEnd) && (info.complex||info.hasHp) && customerVo.phiCustomerVo.intfacId == '0' && customerVo.phiCustomerVo.dlvyCustYn==='Y'
        if(ec&&customerVo){
          $('#quickChangeDrink').attr('href', `/mypage/drink/drink/change/${customerVo.custnumber}/${customerVo.prtnId}`)
          $('#quickChangeSchedule').attr('href', `/mypage/drink/drink/pause/${customerVo.custnumber}/${customerVo.prtnId}`)
        }else {
          $('#quickChangeDrink').attr('href', `/mypage?with=01`)
          $('#quickChangeSchedule').attr('href', `/mypage?with=01`)
        }
        console.log(window.innerWidth)
        if(window.innerWidth>1450){
          $('#mini-side-nav').show();
        }
    }).catch(function (error) {
      if(window.innerWidth>1450) {
        $('#mini-side-nav').show()
      }
	});
    window.addEventListener('resize', function(){
	  if(window.innerWidth>1450){
		$('#mini-side-nav').show();
	  }else {
		$('#mini-side-nav').hide();
	  }
	})

  })
</script> -->
				<div style="display: none" id="mini-side-nav">
					<a href="/mypage/drink/drink"><img
						src="/resources/assets/images/quick1.png" alt=""></a> <a
						id="quickChangeDrink" href="/mypage/drink/drink"><img
						src="/resources/assets/images/quick2.png" alt=""></a> <a
						id="quickChangeSchedule" href="/mypage/drink/drink"><img
						src="/resources/assets/images/quick3.png" alt=""></a> <a
						href="/mypage/drink/bill"><img
						src="/resources/assets/images/quick4.png" alt=""></a> <a
						href="#"><img src="/resources/assets/images/quickTop.png"
						alt=""></a>
				</div>
			</div>
		</main>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>
	</div>
</body>
</html>
