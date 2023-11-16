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
<link rel="stylesheet"
	href="/resources/assets/css/owl.theme.default.css">
<script src="/resources/assets/js/owl.carousel.min.js"></script>
<script src="/resources/assets/js/design.js"></script>
<link rel="stylesheet" href="/resources/assets/css/list.css">
<link rel="stylesheet" href="/resources/assets/css/style.css">
<script>            
      window.is_signed = true;
      window.kakaoSimpleData = {"memberId":"aaaaaaaa","name":"임재석","recommenderCode":"XQNGV"};                 
</script>
<script>
	window.dataLayer = window.dataLayer || [];

	function gtag() {
		dataLayer.push(arguments);
	}

	gtag('js', new Date());

	gtag('config', 'UA-150666346-1');

	var timer = undefined
</script>
</head>
<body>
	<div class="wrapper">

		<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
		<main class="page forum">
			<div class="breadcrumb-style">
				<div class="container">
					<ul>
						<li><a href="/">홈</a></li>
						<li><a href="/mypage.do">MY녹즙</a></li>
						<li><a class="" href="">활동정보</a></li>
						<li><a class="active" href="">찜한상품</a></li>
					</ul>
				</div>
			</div>
			<div class="container aside-layout" style="padding-bottom: 120px;">


				<div class="aside" id="mypage_lnb">
					<h2 class="title">MY녹즙</h2>
					<ul class="lnb-style">
						<li class="indepth"><a>매일배송 음용내역</a>
							<ul class="sub-navigation">
								<li><a href="/mypage/drink/drink">음용내역</a></li>
								<li><a href="/mypage/drink/bill">영수증조회</a></li>
							</ul></li>
						<li><a href="/mypage/order/box">택배배송 주문내역</a></li>
						<li><a href="/mypage/benefit/taste">시음선물내역</a></li>
						<li><a href="/mypage/benefit/coupon">쿠폰</a></li>
						<li class="indepth active"><a>활동정보</a>
							<ul class="sub-navigation">
								<li class="active"><a href="/mypage/action/interest">찜한상품</a></li>
								<li><a href="/mypage/action/counsel">1:1 문의</a></li>
								<li><a href="/mypage/action/review">리뷰</a></li>
							</ul></li>
						<li class="indepth"><a>개인정보</a>
							<ul class="sub-navigation">
								<li><a href="/mypage/personal/address">주소록</a></li>
								<li><a href="/mypage/personal/info">개인정보 변경</a></li>
								<li><a href="/mypage/drink/paymethod">결제수단 관리</a></li>
								<li><a href="/mypage/personal/refund">환불계좌 관리</a></li>
							</ul></li>
					</ul>
				</div>
				<script>
  $(document).on("click", "#mypage_lnb .indepth>a", function (e) {
    var parent = $(this).parents("li");
    if (parent.hasClass("active")) {
      parent.removeClass("active");
    } else {
      parent.addClass("active");
    }
    e.preventDefault();
    return false;
  });
  $(document).ready(function () {
    var item = undefined;
    $("#mypage_lnb .sub-navigation a").each(function (ix, elem) {
      var el = $(elem);
      if (location.pathname.startsWith(el.attr("href")) && !item) {
        item = el;
      }
    })
    if (!item) {
      $("#mypage_lnb .lnb-style>li>a").each(function (ix, elem) {
        var el = $(elem);
        if (el.attr("href") && location.pathname.startsWith(el.attr("href")) && !item) {
          item = el;
        }
      })
    }
    if (item) {
      item.parents("li").addClass("active");
      item.parents(".indepth").addClass("active");
    }
  })
</script>
				<div class="container">
					<div class="border-wrapper">
						<h2 class="container-title">찜한 상품</h2>
					</div>
					<div class="page-addiction-wrapper"
						style="align-items: center; margin-bottom: 17px;">
						<div class="info-copy description" style="margin-top: 7px;">
							<p style="padding: 0;">
								총 <b class="cnt">2</b>건
							</p>
						</div>
					</div>
					<div class="box-partition"
						style="margin-bottom: 12px; padding: 0 20px; height: 60px; display: flex; justify-content: space-between; align-items: center">
						<label style="margin-bottom: 14px" class="check-type"> <input
							class="chk-all" id="chk-all" name="chk-all" type="checkbox">
							<span
							style="font-size: 16px; margin-bottom: 4px; padding-left: 51px;">전체선택</span>
						</label>
						<button type="button" id="deleteBtn" class="button-text">선택삭제</button>
					</div>
					<div class="box-partition" style="border: unset">

						<ul class="drinkchange-list favorite" id="pagable-items"
							data-list-object="append"
							style="border: 1px solid #e5e5e5; border-radius: 10px">


							<li data-idx="21958"><label class="item-wrapper"> <input
									name="chk-prd1" type="checkbox">
									<div class="item">
										<a data-url="/product/daily/315"
											onclick="event.preventDefault();hrefMove(this)"
											data-issale="Y" style="display: flex">
											<div class="thumb">
												<img
													src="/file/download//product/2476a7ea-a06c-4af4-a117-1666a39fe56f.jpg"
													onerror="this.src='/resources/images/common/no_img.png'"
													alt="">
											</div>
											<div class="contents">
												<p class="prd-title">식물성유산균 위&amp;캡슐</p>
												<b class="price">2,500<span> 원(130ml)</span>
												</b>
											</div>
										</a>
									</div>

									<button type="button" data-idx="21958" class="btn-delete">
										<i class="ico ico-prd-delete"></i> <span class="hide">카트에서
											삭제</span>
									</button>
							</label></li>


							<li data-idx="21957"><label class="item-wrapper"> <input
									name="chk-prd1" type="checkbox">
									<div class="item">
										<a data-url="/product/daily/281"
											onclick="event.preventDefault();hrefMove(this)"
											data-issale="Y" style="display: flex">
											<div class="thumb">
												<img
													src="/file/download//product/f1dfce0b-663c-4486-a7a3-188f199ba502.jpg"
													onerror="this.src='/resources/images/common/no_img.png'"
													alt="">
											</div>
											<div class="contents">
												<p class="prd-title">위러브플러스</p>
												<b class="price">2,900<span> 원(130ml)</span>
												</b>
											</div>
										</a>
									</div>

									<button type="button" data-idx="21957" class="btn-delete">
										<i class="ico ico-prd-delete"></i> <span class="hide">카트에서
											삭제</span>
									</button>
							</label></li>

						</ul>


					</div>


				</div>
			</div>
		</main>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>
	</div>
	<%@ include file="/WEB-INF/views/ui/modal.jsp"%>
	<script>
	
	let currentCate = `${param.category}`;
	if( ${param.category == null || param.category == ""} ) currentCate = "전체";  
	$(".inquiry-cate-select .dropdown-toggle").text(currentCate);
	$(".inquiry-cate-select .dropdown-item").on("click", function(){
		let val = $(this).data("value");
		if( val != "" ) {
			location.href = `/mypage/inquiry/list.do?category=\${ val }`;		
		}else {
			location.href = "/mypage/inquiry/list.do";
			
		}
	})
</script>

</body>
</html>
