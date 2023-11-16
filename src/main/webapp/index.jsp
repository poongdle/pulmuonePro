<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/resources/assets/js/owl.carousel.min.js"></script>
<script src="/resources/assets/js/clipboard.min.js"></script>
<script src="/resources/assets/js/fdd.js"></script>
<%@ include file="/WEB-INF/views/layouts/head.jsp"%>
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
</script>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
		<main class="page">
			<div class="container">
				<div id="container-wrapper" class="container-wrapper">
					<!-- TODO : 회원쪽 페이지들은 <div class="container-wrapper member"> -->

					<script type="text/javascript">
(function($) {
	$(document).ready(function () {
        $(".visual-area").fddCarousel({ auto: 5000 });
		$(".event-area").fddCarousel({ auto: 5000, activeClick: true });
		$('.prd-list.owl-carousel').owlCarousel({
            items: 4,
            nav: true,
		  loop:false
		});


        $("#mainPopupTodayBtn").click(function(){
            var setCookie = function(name, value, exp) {
                var date = new Date();
                var midnight = new Date(date.getFullYear(), date.getMonth(), date.getDate(), 23, 59, 59);
                document.cookie = name + '=' + value + ';expires=' + midnight + ';path=/';
            };

            setCookie('dontShowPopup', 'Y', 1);
            $('.pop-mainPopup').hide();
        })

		if (is_signed) {
			axios.get('/user_summary').then(function (r) {
				var data = $(r.data.trim());

				$("[data-summary-view]").each(function () {
					var el = data.find($(this).attr("data-summary-view"));
					$(this).html(el.html());
				})
			})
		}
	})
})(jQuery);
</script>
					<!--S: 메인 비주얼-->
					<div class="visual-area">
						<div class="controller">
							<button class="arrow left" data-carousel="prev">
								<span></span> <span></span>
							</button>
							<div class="number">
								<p data-carousel="current">2</p>
								<span></span>
								<p data-carousel="max">6</p>
							</div>
							<button class="arrow right" data-carousel="next">
								<span></span> <span></span>
							</button>
						</div>
						<div class="vis-list" data-carousel="items">

							<a class="item left"
								href="https://greenjuice.pulmuone.com/event/event/view/3058"
								target="_blank" title="11월 브랜드데이"
								style="background-color: #ffffff"> <img
								src="/file/download//banner/0d3bc825-0970-4f85-9f7d-295f9d54e857.png"
								alt="">
							</a> <a class="item active"
								href="https://greenjuice.pulmuone.com/event/event/view/2957"
								title="키즈프리 한 달 야채 프로젝트" style="background-color: #111111">
								<img
								src="/file/download//banner/e637a24e-8db2-47f2-8f0d-68b3d62529b9.png"
								alt="">
							</a> <a class="item right"
								href="https://greenjuice.pulmuone.com/product/daily/743"
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
							</a> <a class="item"
								href="https://greenjuice.pulmuone.com/taste/taste" title="시음선물"
								style="background-color: #ffffff"> <img
								src="/file/download//banner/cf57865c-d559-4193-bce1-075b28c60a61.png"
								alt="">
							</a>

						</div>
					</div>
					<!--E: 메인 비주얼-->

					<!--S:로그인 전 -->
					<div class="personal-bg">
						<div class="container">
							<!--S:개인화 영역 -->

							<div class="personal-area">
								<!-- 비로그인 (https://zpl.io/6NeDXpW) -->
								<div class="member-area">
									<div class="personal-login">
										<img src="/resources/assets/images/common/ico_member02.png" alt="">
										<strong> <b>로그인</b>하시고 <br>
										<span>맞춤 서비스</span>를 누리세요!
										</strong> <a href="/member/login" class="btn-login" title="로그인하기">
											로그인하기 <i class="ico ico-arr-right6"></i>
										</a>
									</div>
								</div>
								<!--S:개인화 메뉴-->
								<ul class="personal-menu" data-summary-view="#member_menu">
									<li class="item"><a href="/mypage/drink/drink"
										title="해당페이지로 가기" data-require-login="">
											<div class="cover">
												<i class="ico ico-personal-01"></i>
											</div> <span>음용내역보기</span>
									</a></li>
									<li class="item"><a href="/mypage/drink/drinks/{}/{}"
										data-require-login="">
											<div class="cover">
												<i class="ico ico-personal-02"></i>
											</div> <span>음용상품변경</span>
									</a></li>
									<li class="item"><a href="/mypage/drink/drinks/{}/{}"
										data-require-login="">
											<div class="cover">
												<i class="ico ico-personal-03"></i>
											</div> <span>배송일정변경</span>
									</a></li>
									<li class="item"><a href="/mypage/action/interest"
										data-require-login="">
											<div class="cover">
												<i class="ico ico-personal-04"></i>
											</div> <span>찜한상품</span>
									</a></li>
								</ul>
							</div>
							<!-- // 비로그인 (https://zpl.io/6NeDXpW) -->


							<!--E:개인화 영역 -->

							<!--S:추천제품-->
							<div class="recommend-area section-area">
								<h2 class="section-area-title">추천 상품</h2>
								<div class="prd-list owl-carousel owl-loaded owl-drag"
									style="margin: 0px;">





































































































									<div class="owl-stage-outer">
										<div class="owl-stage"
											style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 3000px;">
											<div class="owl-item active" style="width: 300px;">
												<div class="prd-area">
													<a href="/product/daily/726?eventIdx=" title="제품 상세페이지로 가기">
														<div class="badges"></div>
														<div class="thumb">
															<img
																src="/file/download/product/1c884ddf-10fc-4cb8-854e-792ba5bc4875.png"																
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
											<div class="owl-item active" style="width: 300px;">
												<div class="prd-area">
													<a href="/product/daily/442?eventIdx=" title="제품 상세페이지로 가기">
														<div class="badges"></div>
														<div class="thumb">




															<img
																src="/file/download/product/685a5aac-588c-4366-82c4-217f17b38067.jpg"
																
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
											<div class="owl-item active" style="width: 300px;">
												<div class="prd-area">
													<a href="/product/daily/723?eventIdx=" title="제품 상세페이지로 가기">
														<div class="badges"></div>
														<div class="thumb">




															<img
																src="/file/download/product/c4e38bfb-9926-4cfc-bb92-973a4401c609.png"
																
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
											<div class="owl-item active" style="width: 300px;">
												<div class="prd-area">
													<a href="/product/box/678?eventIdx=" title="제품 상세페이지로 가기">
														<div class="badges"></div>
														<div class="thumb">




															<img
																src="/file/download/product/f091526d-01f6-44da-a356-88d5e86e5b0d.png"
																
																alt="제품명">
														</div>
														<div class="prd-info">
															<div class="prd-title-wrapper">
																<b class="prd-title"> 프레시업 석류어때요 7입 </b>
															</div>



															<div class="price-info" style="margin-bottom: 5px;">
																<b class="now-price"> 34,300 <span> 원</span>
																</b>
															</div>
															<span class="volume">(190ml X 7병)</span>


														</div>
													</a>
													<div class="btn-area btn-area-center">
														<button type="button" data-wish-id="678"
															data-wish-type="box"
															class="btn-round btn-white wishlistBtn ">
															<i class="ico ico-prd-wish"></i> <span class="hide">제품
																찜하기</span>
														</button>




														<button type="button" data-cart-id="0072969"
															data-cart-type="box" data-cart-event=""
															class="btn-round addCartBtn">
															<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
																담기</span>
														</button>



													</div>

												</div>
											</div>
											<div class="owl-item" style="width: 300px;">
												<div class="prd-area">
													<a href="/product/daily/281?eventIdx=" title="제품 상세페이지로 가기">
														<div class="badges">

															<span class="badge">BEST</span>



														</div>
														<div class="thumb">




															<img
																src="/file/download/product/f1dfce0b-663c-4486-a7a3-188f199ba502.jpg"
																
																alt="제품명">
														</div>
														<div class="prd-info">
															<div class="prd-title-wrapper">
																<b class="prd-title"> 위러브플러스 </b>
															</div>



															<div class="price-info" style="margin-bottom: 5px;">
																<b class="now-price"> 2,900 <span> 원</span>
																</b>
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
											<div class="owl-item" style="width: 300px;">
												<div class="prd-area">
													<a href="/product/daily/440?eventIdx=" title="제품 상세페이지로 가기">
														<div class="badges"></div>
														<div class="thumb">




															<img
																src="/file/download/product/4cf0398b-fb18-45f9-97c4-be8b5bd2edd6.jpg"
																
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
											<div class="owl-item" style="width: 300px;">
												<div class="prd-area">
													<a href="/product/daily/278?eventIdx=" title="제품 상세페이지로 가기">
														<div class="badges">

															<span class="badge">BEST</span>



														</div>
														<div class="thumb">




															<img
																src="/file/download/product/517eebaa-b721-4dba-b620-76689d2a25ab.jpg"																
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
											<div class="owl-item" style="width: 300px;">
												<div class="prd-area">
													<a href="/product/daily/612?eventIdx=" title="제품 상세페이지로 가기">
														<div class="badges"></div>
														<div class="thumb">




															<img
																src="/file/download/product/abde0d7f-d546-4cc4-acec-99a4b895b9d7.jpg"
																
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
											</div>
											<div class="owl-item" style="width: 300px;">
												<div class="prd-area">
													<a href="/product/box/654?eventIdx=" title="제품 상세페이지로 가기">
														<div class="badges">

															<span class="badge">BEST</span>



														</div>
														<div class="thumb">




															<img
																src="/file/download/product/8d374e34-5708-4a2a-a638-b72c89288df4.png"
																
																alt="제품명">
														</div>
														<div class="prd-info">
															<div class="prd-title-wrapper">
																<b class="prd-title"> 키즈프리 멀티비타민 면역 탱글젤리 </b>
															</div>



															<div class="price-info" style="margin-bottom: 5px;">
																<b class="now-price"> 18,000 <span> 원</span>
																</b>
															</div>
															<span class="volume">(20g X 15포)</span>


														</div>
													</a>
													<div class="btn-area btn-area-center">
														<button type="button" data-wish-id="654"
															data-wish-type="box"
															class="btn-round btn-white wishlistBtn ">
															<i class="ico ico-prd-wish"></i> <span class="hide">제품
																찜하기</span>
														</button>




														<button type="button" data-cart-id="0073136"
															data-cart-type="box" data-cart-event=""
															class="btn-round addCartBtn">
															<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
																담기</span>
														</button>



													</div>

												</div>
											</div>
											<div class="owl-item" style="width: 300px;">
												<div class="prd-area">
													<a href="/product/daily/273?eventIdx=" title="제품 상세페이지로 가기">
														<div class="badges">

															<span class="badge">BEST</span>



														</div>
														<div class="thumb">




															<img
																src="/file/download/product/a5e4ffc9-e98f-49a2-9371-2f2b9952dd9c.jpg"
																
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
											</div>
										</div>
									</div>
									<div class="owl-nav">
										<button type="button" role="presentation"
											class="owl-prev disabled">
											<span aria-label="Previous">‹</span>
										</button>
										<button type="button" role="presentation" class="owl-next">
											<span aria-label="Next">›</span>
										</button>
									</div>
									<div class="owl-dots">
										<button role="button" class="owl-dot active">
											<span></span>
										</button>
										<button role="button" class="owl-dot">
											<span></span>
										</button>
										<button role="button" class="owl-dot">
											<span></span>
										</button>
									</div>
								</div>
							</div>
							<!--E:추천제품-->
						</div>
					</div>

					<!--S:띠배너 슬라이드-->
					<div class="banner-area survey">
						<div class="banner-list">
							<a class="item" href="/customer/product" title="해당 페이지로 가기"
								style="background-color: #4d54e7"> <img
								src="/resources/assets/images/contents/banner_item01.jpg"> <span
								class="hide">어떤 녹즙을 드셔야 할까요? 간단한 설문을 통해 풀무원녹즙이 제안하는 추천
									프로그램을 확인해 보세요 설문 시작하기</span>
							</a>
						</div>
					</div>
					<!--E:띠배너 슬라이드-->

					<!--E:이벤트 슬라이드-->

					<div class="bg-w">
						<div class="container">
							<div class="event-area section-area">
								<h2 class="section-area-title title-more-btn">
									녹즙 시음을 선물해보세요! <a href="/taste/taste" class="btn-more">
										전체보기 <i class="ico ico-arr-right6"></i>
									</a>
								</h2>

								<div class="event-list" data-carousel="items">

									<a class="item"
										href="https://greenjuice.pulmuone.com/taste/taste?pkgIdx=56"
										title="베스트 녹즙"> <img
										src="/file/download//banner/4d1a4dd5-821c-41db-a0d6-3535adb53a8e.png"
										alt="">
									</a> <a class="item left"
										href="https://greenjuice.pulmuone.com/taste/taste?pkgIdx=54"
										title="건강한 한 끼"> <img
										src="/file/download//banner/b9842c83-f89d-4687-8351-c71beeba16e4.png"
										alt="">
									</a> <a class="item active"
										href="https://greenjuice.pulmuone.com/taste/taste?pkgIdx=53"
										title="아이사랑"> <img
										src="/file/download//banner/20230601/57d7c4a5-9e5f-4158-9067-f8e2746a2ee8.png"
										alt="">
									</a> <a class="item right"
										href="https://greenjuice.pulmuone.com/product/daily/743"
										title="이달의 녹즙(비타맥스 엑스투)"> <img
										src="/file/download//banner/c4f1a598-5bf4-4cb9-9acf-c733f86d3faf.png"
										alt="">
									</a> <a class="item"
										href="https://greenjuice.pulmuone.com/taste/taste?pkgIdx=58 "
										title="융복합"> <img
										src="/file/download//banner/ba6cd618-ea64-4c9e-a6ed-18186f895d6b.png"
										alt="">
									</a>

								</div>
								<ul class="event-list-dot" data-carousel="dot">

									<li class=""></li>

									<li class=""></li>

									<li class="active"></li>

									<li class=""></li>

									<li class=""></li>

								</ul>
							</div>
						</div>
					</div>


					<div class="gray-line-bg">
						<div class="container">
							<div class="price-area section-area">


								<!--S:특가 슬라이드-->
								<h2 class="section-area-title">오늘의 풀무원녹즙 특가</h2>
								<div class="prd-list owl-carousel owl-loaded owl-drag"
									style="margin: 0px;">























































									<div class="owl-stage-outer">
										<div class="owl-stage"
											style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 1200px;">
											<div class="owl-item active" style="width: 300px;">
												<div class="prd-area">
													<a href="/event/event/view/2957" title="제품 상세페이지로 가기">
														<div class="badges">


															<span class="badge badge-new">NEW</span> <span
																class="badge badge-sale">SALE</span>

														</div>
														<div class="thumb">




															<img
																src="/file/download/product/572a54ab-0586-425d-a9b8-648033959a6e.png"
																
																alt="제품명">
														</div>
														<div class="prd-info">
															<div class="prd-title-wrapper">
																<b class="prd-title"> 키즈프리 전 품목 패키지 </b>
															</div>


															<div class="price-info" style="margin-bottom: 5px;">
																<b class="before-price" style="margin-bottom: 0px;">
																	72,000 <span> 원</span>
																</b> <b class="now-price"> 43,200 <span> 원</span>
																</b>


															</div>
															<span class="volume">(4ml X 10포)</span>



														</div>
													</a>
													<div class="btn-area btn-area-center">
														<button type="button" data-wish-id="736"
															data-wish-type="box"
															class="btn-round btn-white wishlistBtn ">
															<i class="ico ico-prd-wish"></i> <span class="hide">제품
																찜하기</span>
														</button>




														<button type="button" data-cart-id="0074025"
															data-cart-type="box" data-cart-event="2957"
															class="btn-round addCartBtn">
															<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
																담기</span>
														</button>



													</div>






													<button type="button" data-buy-id="0074025"
														data-buy-type="box" data-buy-event="2957"
														data-price="72000" class="btn-default event-btn ">
														바로구매</button>



												</div>
											</div>
											<div class="owl-item active" style="width: 300px;">
												<div class="prd-area">
													<a href="/event/event/view/3020" title="제품 상세페이지로 가기">
														<div class="badges">

															<span class="badge">BEST</span> <span
																class="badge badge-sale">SALE</span>

														</div>
														<div class="thumb">




															<img
																src="/file/download/product/28541fc8-234b-42d8-902e-f189956419c8.png"
																
																alt="제품명">
														</div>
														<div class="prd-info">
															<div class="prd-title-wrapper">
																<b class="prd-title"> 유기농주스 유기농 키즈프리 톡톡오렌지 </b>
															</div>


															<div class="price-info" style="margin-bottom: 5px;">
																<b class="before-price" style="margin-bottom: 0px;">
																	19,000 <span> 원</span>
																</b> <b class="now-price"> 9,500 <span> 원</span>
																</b>


															</div>
															<span class="volume">(100ml X 10포)</span>



														</div>
													</a>
													<div class="btn-area btn-area-center">
														<button type="button" data-wish-id="620"
															data-wish-type="box"
															class="btn-round btn-white wishlistBtn ">
															<i class="ico ico-prd-wish"></i> <span class="hide">제품
																찜하기</span>
														</button>




														<button type="button" data-cart-id="0072907"
															data-cart-type="box" data-cart-event="3020"
															class="btn-round addCartBtn">
															<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
																담기</span>
														</button>



													</div>






													<button type="button" data-buy-id="0072907"
														data-buy-type="box" data-buy-event="3020"
														data-price="19000" class="btn-default event-btn ">
														바로구매</button>



												</div>
											</div>
											<div class="owl-item active" style="width: 300px;">
												<div class="prd-area">
													<a href="/event/event/view/3020" title="제품 상세페이지로 가기">
														<div class="badges">

															<span class="badge">BEST</span> <span
																class="badge badge-sale">SALE</span>

														</div>
														<div class="thumb">




															<img
																src="/file/download/product/1de28f0b-13f4-4348-a839-f4f1c956c47b.png"
																
																alt="제품명">
														</div>
														<div class="prd-info">
															<div class="prd-title-wrapper">
																<b class="prd-title"> 유기농주스 유기농키즈프리 튼튼사과 </b>
															</div>


															<div class="price-info" style="margin-bottom: 5px;">
																<b class="before-price" style="margin-bottom: 0px;">
																	19,000 <span> 원</span>
																</b> <b class="now-price"> 9,500 <span> 원</span>
																</b>


															</div>
															<span class="volume">(100ml X 10포)</span>



														</div>
													</a>
													<div class="btn-area btn-area-center">
														<button type="button" data-wish-id="619"
															data-wish-type="box"
															class="btn-round btn-white wishlistBtn ">
															<i class="ico ico-prd-wish"></i> <span class="hide">제품
																찜하기</span>
														</button>




														<button type="button" data-cart-id="0072906"
															data-cart-type="box" data-cart-event="3020"
															class="btn-round addCartBtn">
															<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
																담기</span>
														</button>



													</div>






													<button type="button" data-buy-id="0072906"
														data-buy-type="box" data-buy-event="3020"
														data-price="19000" class="btn-default event-btn ">
														바로구매</button>



												</div>
											</div>
											<div class="owl-item active" style="width: 300px;">
												<div class="prd-area">
													<a href="/event/event/view/3020" title="제품 상세페이지로 가기">
														<div class="badges">

															<span class="badge">BEST</span> <span
																class="badge badge-sale">SALE</span>

														</div>
														<div class="thumb">




															<img
																src="/file/download/product/3380bfd0-91b8-4cec-9410-1a745f5f4dba.png"
																
																alt="제품명">
														</div>
														<div class="prd-info">
															<div class="prd-title-wrapper">
																<b class="prd-title"> 유기농주스 유기농 키즈프리 반짝포도 </b>
															</div>


															<div class="price-info" style="margin-bottom: 5px;">
																<b class="before-price" style="margin-bottom: 0px;">
																	19,000 <span> 원</span>
																</b> <b class="now-price"> 9,500 <span> 원</span>
																</b>


															</div>
															<span class="volume">(100ml X 10포)</span>



														</div>
													</a>
													<div class="btn-area btn-area-center">
														<button type="button" data-wish-id="634"
															data-wish-type="box"
															class="btn-round btn-white wishlistBtn ">
															<i class="ico ico-prd-wish"></i> <span class="hide">제품
																찜하기</span>
														</button>




														<button type="button" data-cart-id="0072905"
															data-cart-type="box" data-cart-event="3020"
															class="btn-round addCartBtn">
															<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
																담기</span>
														</button>



													</div>






													<button type="button" data-buy-id="0072905"
														data-buy-type="box" data-buy-event="3020"
														data-price="19000" class="btn-default event-btn ">
														바로구매</button>



												</div>
											</div>
										</div>
									</div>
									<div class="owl-nav disabled">
										<button type="button" role="presentation"
											class="owl-prev disabled">
											<span aria-label="Previous">‹</span>
										</button>
										<button type="button" role="presentation"
											class="owl-next disabled">
											<span aria-label="Next">›</span>
										</button>
									</div>
									<div class="owl-dots disabled">
										<button role="button" class="owl-dot active">
											<span></span>
										</button>
									</div>
								</div>
								<!--E:특가 슬라이드-->



								<!--S:띠배너 슬라이드-->

								<div class="banner-area this-prd" style="margin-top: 60px;">
									<div class="banner-list">
										<a class="item"
											href="https://greenjuice.pulmuone.com/product/daily/743"
											title="월간녹즙 비타맥스 엑스투" style="background-color: #"> <img
											src="/file/download//banner/f523748f-14ef-4844-a30d-5e97ff7c6456.png"
											alt="">
										</a>
									</div>
								</div>

								<!--E:띠배너 슬라이드-->

								<!--S:쿠폰 영역-->
								<div class="coupon-guide section-area">
									<div class="coupon-area">
										<a href="/event/event/view/benefit" title="해당 페이지로 가기">
											<div>
												<strong>가입혜택</strong> <b>3,6,9 쿠폰 증정</b> <span>음용할수록
													늘어나는 혜택! <br>3,6,9개월마다 쿠폰증정, 시음선물까지
												</span>
											</div> <img src="/resources/assets/images/contents/coupon_item01.png"
											alt="가입혜택">
										</a> <a href="/event/event/view/friends" title="해당 페이지로 가기">
											<div>
												<strong>친구초대</strong> <b>친구 초대 쿠폰 증정</b> <span>풀무원녹즙에
													친구를 초대하면 <br>나도 친구도 5천원씩 쿠폰 증정
												</span>
											</div> <img src="/resources/assets/images/contents/coupon_item02.png"
											alt="친구초대">
										</a>
									</div>

									<div class="guide-area">
										<a href="/info/foundation" title="해당 페이지로 가기" class="bg-green">
											<span>풀무원녹즙 <br>고객기쁨센터
										</span> <img src="/resources/assets/images/ui/ico-bag01.png" alt="">
										</a> <a href="/search/branch" title="해당 페이지로 가기" class="bg-purple">
											<span>매일배송 <br>가능지역검색
										</span> <img src="/resources/assets/images/ui/ico-map01.png" alt="">
										</a>
									</div>
								</div>
								<!--E:쿠폰 영역-->
							</div>
						</div>
					</div>
					<!--S:공지사항, 고객센터, 배달가능지역검색-->
					<div class="notice-area">
						<div class="container">
							<div class="notice-cont">
								<h2 class="sub-h2">공지사항</h2>
								<ul>
									<li><a href="/forum/notice/2139" title="해당 게시글로 가기">'명일엽'
											원료 공급 부족으로 인한 제품 배송 지연 안내</a></li>
								</ul>
							</div>
							<a href="/forum/notice" class="btn-more" title="해당 페이지로 가기">
								<i class="ico ico-more"></i>
							</a>
						</div>
					</div>		
				</div>
			</div>
		</main>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>
	</div>
</body>
</html>