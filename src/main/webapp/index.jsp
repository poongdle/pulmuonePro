<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="/resources/assets/js/jquery-2.1.4.min.js"></script>
<script src="/resources/assets/js/clipboard.min.js"></script>
<script src="/resources/assets/js/fdd.js"></script>
<script src="/resources/assets/js/design.js"></script>
<script src="/resources/assets/js/owl.carousel.min.js"></script>
<link rel="stylesheet" href="/resources/assets/css/owl.theme.default.css">
<link rel="stylesheet" href="/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/assets/css/style.css">
</head>
<body>
	<script type="text/javascript">
	$(document).ready(function () {
        $(".visual-area").fddCarousel({ auto: 5000 });
		$(".event-area").fddCarousel({ auto: 5000, activeClick: true });
		$('.prd-list.owl-carousel').owlCarousel({
            items: 4,
            nav: true,
		  loop:false
		});		
	});
	window.onload = function(){
// 		clk.click();
	}
		
</script>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
		<main class="page">
			<div class="container">
			<a id="clk" href="/main.do"></a>
				<div class="visual-area">
					<div class="controller">
						<button class="arrow left" data-carousel="prev">
							<span></span> <span></span>
						</button>
						<div class="number">
							<p data-carousel="current">1</p>
							<span></span>
							<p data-carousel="max">6</p>
						</div>
						<button class="arrow right" data-carousel="next">
							<span></span> <span></span>
						</button>
					</div>
					<div class="vis-list" data-carousel="items">

						<a class="item active"
							href="https://greenjuice.pulmuone.com/event/event/view/3058"
							target="_blank" title="11월 브랜드데이"
							style="background-color: #ffffff"> <img
							src="/file/download//banner/0d3bc825-0970-4f85-9f7d-295f9d54e857.png"
							alt="">
						</a> <a class="item right"
							href="https://greenjuice.pulmuone.com/event/event/view/2957"
							title="키즈프리 한 달 야채 프로젝트" style="background-color: #111111"> <img
							src="/file/download//banner/e637a24e-8db2-47f2-8f0d-68b3d62529b9.png"
							alt="">
						</a> <a class="item"
							href="https://greenjuice.pulmuone.com/product/daily/view.do?tag=743"
							title="비타맥스 엑스투" style="background-color: #ffffff"> <img
							src="/file/download//banner/846fc1e1-4818-4eef-80ff-94b7f47daca1.png"
							alt="">
						</a> <a class="item"
							href="https://greenjuice.pulmuone.com/event/event/view/3020"
							title="키즈프리 유기농 주스" style="background-color: #111111"> <img
							src="/file/download//banner/896f670f-2e4c-44d3-9fbd-5b823b20c679.png"
							alt="">
						</a> <a class="item"
							href="https://greenjuice.pulmuone.com/event/event/view/2997"
							title="풀무원녹즙 쿠폰 사용 가이드" style="background-color: #ffffff"> <img
							src="/file/download//banner/39447d58-8d60-4a85-b4b6-c3622ca41825.png"
							alt="">
						</a> <a class="item left"
							href="https://greenjuice.pulmuone.com/taste/taste" title="시음선물"
							style="background-color: #ffffff"> <img
							src="/file/download//banner/cf57865c-d559-4193-bce1-075b28c60a61.png"
							alt="">
						</a>
					</div>
				</div>
				<div class="recommend-area section-area">
					<h2 class="section-area-title">추천 상품</h2>						
					<div class="prd-list">
						<div id="head-items" class="owl-carousel owl-loaded owl-drag">
							<div class="owl-stage-outer">
								<div class="owl-stage"
									style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 6170px;">
									<c:forEach var="dto" items="${mainbestlist }">
										<div class="owl-item active" style="width: 308.5px;">
											<div class="prd-area">
												<a
													href="/product/daily/view.do?tag=${dto.products_tag }&eventIdx="
													title="제품 상세페이지로 가기">
													<div class="badges">
														<c:if
															test="${dto.products_no eq 0071654 or dto.products_no eq 0073019 or dto.products_no eq 0070680}">
															<span class="badge">BEST</span>
														</c:if>
													</div>
													<div class="thumb">
														<img src="/file/download/product/${dto.system_name }"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title">${dto.products_name }</b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"><fmt:formatNumber
																	value="${dto.price }" pattern="#,###" /><span>
																	원</span></b>
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
								</div>
							</div>
						</div>
					</div>
				</div>
		</main>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>

	</div>
</body>
</html>
