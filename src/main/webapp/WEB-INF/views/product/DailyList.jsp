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
<link rel="stylesheet" href="/resources/assets/css/style.css">
<script src="/resources/assets/js/jquery-2.1.4.min.js"></script>
<script src="/resources/assets/js/jquery.form.min.js"></script>
<script src="/resources/assets/js/design.js"></script>	
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
<link rel="stylesheet" href="/resources/assets/css/list.css">
</head>
<body>
<script type="text/javascript">
var category = "${param.category}";
var pbtn = "${param.tags}";
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
// 	location.replace(location.pathname + "?category=" + category + "&tags=" + idxs.join(","));
});

	$(document).ready(function() {
		$(".visual-area").fddCarousel({
			auto : 5000
		});
		$("#head-items").owlCarousel({
			items : 4,
			nav : true,
		});		
		var ppbtn = pbtn.split(",");			
			for(var i=0; i<8; i++){
				for(var j=0; j<8; j++){
					if(ppbtn[j] == $(".tag-btn").eq(i).attr("data-idx")){				
						$(".tag-btn").eq(i).addClass('active');
					}					
				}
		}					
	});
</script>
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
						<a class="item"
							href="/product/daily/view.do?tag=732"
							title="제품 상세페이지로 가기" style="background-color: #111111"> <img
							src="/file/download/banner/84c3f8d0-5ae5-462b-9fea-cac7bc1d34fd.png"
							alt="">
						</a> <a class="item"
							href="https://greenjuice.pulmuone.com/product/search?searchKeyword=%ED%95%B8%EB%94%94%EB%B0%80"
							title="제품 상세페이지로 가기" style="background-color: #ffffff"> <img
							src="/file/download/banner/35b19bec-324b-41d6-812d-cdf8f00eb6cb.png"
							alt="">
						</a> <a class="item"						
							href="/product/daily/dailylist.do?category=&amp;tags=478"
							title="제품 상세페이지로 가기" style="background-color: #ffffff"> <img
							src="/file/download/banner/67c0a15e-a321-4513-8015-a973651fb8e8.png"
							alt="">
						</a> <a class="item" target="_blank"
							href="/product/daily/view.do?tag=315"
							title="제품 상세페이지로 가기" style="background-color: #111111"> <img
							src="/file/download/banner/6c036b45-96cf-4189-812a-82f2b36f7bcb.png"
							alt="">
						</a> <a class="item"
							href="/product/daily/view.do?tag=430"
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
										<c:forEach var="dto" items="${bestlist }">
											<div class="owl-item active" style="width: 308.5px;">
												<div class="prd-area">
													<a href="/product/daily/view.do?tag=${dto.products_tag }&eventIdx="
														title="제품 상세페이지로 가기">
														<div class="badges">
															<span class="badge">BEST</span>
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
						<div class="bg-light-gray over-section" style="margin-bottom: 120px">
							<div class="container">
								<div class="tag-place">
									<button data-idx="242"  type="button" class="tag-btn item">유기농</button>	
									<button data-idx="7"    type="button" class="tag-btn item">융복합녹즙</button>
									<button data-idx="478"  type="button" class="tag-btn item">케일</button>
									<button data-idx="479"  type="button" class="tag-btn item">양배추</button>
									<button data-idx="262"  type="button" class="tag-btn item">식물성유산균</button>
									<button data-idx="327"  type="button" class="tag-btn item">발효유</button>
									<button data-idx="395"  type="button" class="tag-btn item">식사대용</button>
									<button data-idx="457"  type="button" class="tag-btn item">이달의녹즙</button> 
<%-- 								 	<a href="/product/daily/dailylist.do?category=${param.category }&tags=242"><button data-idx="242" value="242" type="button" class="tag-btn item">유기농</button></a> --%>
<%-- 									<a href="/product/daily/dailylist.do?category=${param.category }&tags=7">  <button data-idx="7" value="7"   type="button" class="tag-btn item">융복합녹즙</button></a> --%>
<%-- 									<a href="/product/daily/dailylist.do?category=${param.category }&tags=478"><button data-idx="478" value="478" type="button" class="tag-btn item">케일</button></a> --%>
<%-- 									<a href="/product/daily/dailylist.do?category=${param.category }&tags=479"><button data-idx="479" value="479" type="button" class="tag-btn item">양배추</button></a> --%>
<%-- 									<a href="/product/daily/dailylist.do?category=${param.category }&tags=262"><button data-idx="262" value="262" type="button" class="tag-btn item">식물성유산균</button></a> --%>
<%-- 									<a href="/product/daily/dailylist.do?category=${param.category }&tags=327"><button data-idx="327" value="327" type="button" class="tag-btn item">발효유</button></a> --%>
<%-- 									<a href="/product/daily/dailylist.do?category=${param.category }&tags=395"><button data-idx="395" value="395" type="button" class="tag-btn item">식사대용</button></a> --%>
<%-- 									<a href="/product/daily/dailylist.do?category=${param.category }&tags=457"><button data-idx="457"value="457" type="button" class="tag-btn item">이달의녹즙</button></a>									 --%>
									
								</div>
								<div class="tab-content" id="tab-content-depth2">
									<div class="prd-list-head">
										<p class="count">
										<c:choose>
										<c:when test="${fn:length(searchlist)>0 }">
											총 <em>${fn:length(searchlist) }</em>건의 상품이 있습니다.
										</c:when>
										<c:otherwise>
											총 <em>${fn:length(list) }</em>건의 상품이 있습니다.
										</c:otherwise>
										</c:choose>
										</p>
									</div>
									<div class="prd-list wrap" data-list-object="append" id="product-items">
									<c:choose>
									<c:when test="${fn:length(searchlist)>0 }">
										<c:forEach var="dto" items="${searchlist }">
											<div class="prd-area">
												<a href="/product/daily/${dto.products_tag }?eventIdx="
													title="제품 상세페이지로 가기">
													<div class="badges">
														<span class="badge">BEST</span>
													</div>
													<div class="thumb">
														<img src="/file/download/product/${dto.system_name }"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> ${dto.products_name } </b>
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
										</c:when>
										<c:otherwise>
										<c:forEach var="dto" items="${list }">
											<div class="prd-area">
												<a href="/product/daily/view.do?tag=${dto.products_tag }&eventIdx="
													title="제품 상세페이지로 가기">
													<div class="badges">
														<span class="badge">BEST</span>
													</div>
													<div class="thumb">
														<img src="/file/download/product/${dto.system_name }"
															alt="제품명">
													</div>
													<div class="prd-info">
														<div class="prd-title-wrapper">
															<b class="prd-title"> ${dto.products_name } </b>
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
										</c:otherwise>
									</c:choose>
									</div>
									<div class="button-set mb60" data-list-more="#product-items" data-param="1">									
									<c:if test="${fn:length(searchlist)>12 } or ${fn:length(list)>12 }">
										<button type="button" class="basic-big-button">더보기</button>										
									</c:if>																		
									</div>
								</div>
							</div>
						</div>
					</div>
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
				<!-- <div style="display: none" id="mini-side-nav">
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
						</div> -->
			</div>
		</main>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>
	</div>
</body>
</html>
