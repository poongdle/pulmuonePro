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
<link rel="shortcut icon" type="image/x-icon" href="/resources/assets/images/pul_favicon.png">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="/resources/assets/js/jquery-2.1.4.min.js"></script>
<script src="/resources/assets/js/jquery.form.min.js"></script>
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/bootstrap-fdd.css">
<script src="/resources/assets/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/assets/js/clipboard.min.js"></script>
<script src="/resources/assets/js/fdd.js"></script>
<script src="/resources/assets/js/request.js"></script>
<link rel="stylesheet" href="/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/assets/css/owl.theme.default.css">
<script src="/resources/assets/js/owl.carousel.min.js"></script>
<script src="/resources/assets/js/design.js"></script>	
<link rel="stylesheet" href="/resources/assets/css/list.css">
<link rel="stylesheet" href="/resources/assets/css/style.css">
<script>
      window.dataLayer = window.dataLayer || [];

      function gtag() {dataLayer.push(arguments);}

      gtag('js', new Date());

      gtag('config', 'UA-150666346-1');

      var timer = undefined
	</script>
</head>
<body>
<script type="text/javascript">
var category = "${param.category}";
$(document).on("click", ".tag-btn", function () {	
	var idxs = [];		
	$(".tag-btn.active").each(function (i, el) {
		idxs.push($(el).attr("data-idx"));		
	});
	var nowIdx = $(this).attr("data-idx");
	
	if (idxs.includes(nowIdx)) {
		idxs.splice(idxs.indexOf(nowIdx), 1);
	} else {
		idxs.push(nowIdx);
	}	
	location.replace(location.pathname + "?category=" + category + "&tags=" + encodeURIComponent(idxs.join(",")));	
});

	$(document).ready(function() {
		$(".visual-area").fddCarousel({
			auto : 5000
		});
		$("#head-items").owlCarousel({
			items : 4,
			nav : true,
		});		
		var pbtn = "${param.tags}";
		var ppbtn = pbtn.split(",");			
			for(var i=0; i<8; i++){
				for(var j=0; j<8; j++){
					if(ppbtn[j] == $(".tag-btn").eq(i).attr("data-idx")){				
						$(".tag-btn").eq(i).addClass('active');
					}					
				}
		}					
	});
 $(document).ready(function(){
	$(".ico-prd-wish").click(function(){
		$("body").addClass('modal-open');		
		$("#alertModal").addClass('show');		
	});
	$(".ico-prd-cart").click(function(){
		$("body").addClass('modal-open');		
		$("#confirmModal").addClass('show');
	});
}); 
</script>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
		<main class="page-boxlist">
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
							href="/product/box/view.do?tag=734"
							title="제품 상세페이지로 가기" style="background-color: #111111"> <img
							src="/file/download/banner/ed3f2371-dd7a-48fc-844c-b68638b48431.png"
							alt="">
						</a> <a class="item right"
							href="https://greenjuice.pulmuone.com/product/search?searchKeyword=%ED%95%B8%EB%94%94%EB%B0%80"
							title="제품 상세페이지로 가기" style="background-color: #ffffff"> <img
							src="/file/download/banner/f2ef74c2-9c45-4218-84c9-ce5b1d8ace5f.png"
							alt="">
						</a> <a class="item right"
							href="https://greenjuice.pulmuone.com/product/search?searchKeyword=%ED%95%B8%EB%94%94%EB%B0%80"
							title="제품 상세페이지로 가기" style="background-color: #ffffff"> <img
							src="/file/download/banner/a4b8f03b-534c-4fc1-ae12-1cb7e697bd45.png"
							alt="">
						</a> <a class="item" target="_blank"
							href="/product/box/view.do?tag=728"
							title="제품 상세페이지로 가기" style="background-color: #111111"> <img
							src="/file/download/banner/2227741e-b8db-4b79-8b0e-fba88ef415e7.png"
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
										<c:forEach var="dto" items="${bestlist }">
											<div class="owl-item active" style="width: 308.5px;">
												<div class="prd-area">
													<a href="/product/box/view.do?tag=${dto.products_tag }&eventIdx="
														title="제품 상세페이지로 가기">
														<div class="badges">
														<c:if test="${dto.products_no eq 0073561 }">
															<span class="badge">BEST</span>
															<span class="badge badge-sale">SALE</span>
														</c:if>
														<c:if test="${dto.products_no eq 0072964 or dto.products_no eq 0072905 or dto.products_no eq 0072906 or dto.products_no eq 0073136 or dto.products_no eq 0073326 or dto.products_no eq 0073165 or dto.products_no eq 0073324 }">
															<span class="badge">BEST</span>
														</c:if>	
														<c:if test="${dto.products_no eq 0073945 or dto.products_no eq 0073880 or dto.products_no eq 0073573 or dto.products_no eq 0073574 or dto.products_no eq 0072364}">
															<span class="badge badge-new">NEW</span>
														</c:if>
														<c:if test="${dto.products_no eq 0073190}">
															<span class="badge">BEST</span>
															<span class="badge badge-new">NEW</span>
														</c:if>
														<c:if test="${dto.products_no eq 0074025}">															
															<span class="badge badge-new">NEW</span>
															<span class="badge badge-sale">SALE</span>
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
				</div>
				<form id="searchForm">
					<input type="hidden" name="category" value="${param.category}"> 
					<input type="hidden" name="tags" value="${param.tags }">
					<div class="cbody-wrap">
						<div class="bg-light-gray over-section"
							style="margin-bottom: 120px">
							<div class="container">
								<div class="tag-place">
									<button data-idx="335" type="button" class="tag-btn item ">프레시업</button>
									<button data-idx="339" type="button" class="tag-btn item ">프레시스무디</button>
									<button data-idx="341" type="button" class="tag-btn item ">클렌즈주스</button>
									<button data-idx="485" type="button" class="tag-btn item ">양배추</button>
									<button data-idx="343" type="button" class="tag-btn item ">건강즙</button>
									<button data-idx="351" type="button" class="tag-btn item ">건강기능식품</button>
									<button data-idx="347" type="button" class="tag-btn item ">어린이</button>
								</div>
								<div class="tab-content" id="tab-content-depth2">
									<div class="prd-list-head">
										<p class="count">
										<c:choose>
										<c:when test="${param.tags ne null and param.tags > '0' }">
											총 <em>${fn:length(searchcountlist) }</em>건의 상품이 있습니다.
										</c:when>
										<c:otherwise>
											총 <em>${fn:length(list) }</em>건의 상품이 있습니다.
										</c:otherwise>										
										</c:choose>
										</p>
									</div>
									<div class="prd-list wrap" data-list-object="append" id="product-items">
										<c:forEach var="dto" items="${searchlist }">
											<div class="prd-area">											
												<a href="/product/daily/view.do?tag=${dto.products_tag }&eventIdx="
													title="제품 상세페이지로 가기">
													<div class="badges">
													<c:if test="${dto.products_no eq 0071654 or dto.products_no eq 0073019 or dto.products_no eq 0070680 or dto.products_no eq 0072348 }">
														<span class="badge">BEST</span>
													</c:if>
													<c:if test="${dto.products_no eq 0074095 or dto.products_no eq 0074008 or dto.products_no eq 0074033 or dto.products_no eq 0073579 }">
														<span class="badge badge-new">NEW</span>
													</c:if>
													</div>
													<div class="thumb">
														<img src="/file/download/product/${dto.system_name }"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> ${dto.products_name }</b>
														</div>
														<div class="price-info" style="margin-bottom: 5px;">
															<b class="now-price"><fmt:formatNumber
																	value="${dto.price }" pattern="#,###" /> <span>
																	원</span> </b>
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
														<i class="ico ico-prd-cart"></i> <span class="hide">장바구니에
															담기</span>
													</button>
												</div>
											</div>
										</c:forEach>
									</div>
									<div class="button-set mb60" data-list-more="#product-items" data-param="2">									
									<c:choose>
									<c:when test="${fn:length(searchcountlist)>12  }">
									<button type="button" class="basic-big-button">더보기</button>												
									</c:when>												
									</c:choose>																												
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</main>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>
	</div>
</body>
</html>
