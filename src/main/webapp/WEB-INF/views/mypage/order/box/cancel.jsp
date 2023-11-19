<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layouts/head.jsp" %>
<script src="/resources/assets/js/owl.carousel.min.js"></script>
<script src="/resources/assets/js/clipboard.min.js"></script>
<script src="/resources/assets/js/fdd.js"></script>
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
			<div id="container-wrapper" class="container-wrapper"> <!-- TODO : 회원쪽 페이지들은 <div class="container-wrapper member"> -->

<script>
	var formatter = new Intl.NumberFormat();

	$(function () {

		if(false){
			alert("주문내역 중 취소가 불가능한 상품이 있습니다. 고객센터에 문의해주세요.",function (){
				location.href='/mypage/order/box';
			});
		}
		$('input[name=select-product]').prop('checked', true);
		$('input[name=select-product-all]').prop('checked', true);

		$('#select-all').click(function (){
			$('input[name=select-product]').prop('checked', $(this).is(':checked'));
			$('input[name=select-product-all]').prop('checked', $(this).is(':checked'));
		})

		$('input[name=select-product]').change(function () {
			var item = $('input[name=select-product]').length
			var checkItem = $('input[name=select-product]:checked').length

			if(item === checkItem){
				console.log(1)
				$('#select-all').prop('checked','checked')
			} else {
				$('#select-all').prop('checked',false)
			}
		})


		$("#cancelBtn").click(function(){
			const checked = $('input[name=select-product]:checked');
			if(checked.length===0){
				return alert('취소할 상품을 선택해주세요');
			}
			var payMethod = 'VBank'
			var cancelCauseCode = 'BOCA002'
			var payPrice = '200873'
			if(payMethod==='VBANK'){
				cancelCauseCode = 'BOCA003'
			}

			const data = checked.map((i,v)=>({payPrice, cancelCauseCode, cancelCode:$(v).data('status'),ordDtlNo:$(v).data('ordernum'),qty:parseInt($(v).closest('.item-wrapper').find('.box-qty').text())})).toArray();
			confirmDesign('','선택하신 상품 주문을 취소 하시겠습니까?',function (){
				newPost({url:'/mypage/order/box/cancel/13195',data},function (r){
					let test = '13195';
					if(r.RESULT_MSG){
						let url =  "/mypage/order/box/cancel/finish/13195?orderNums=";
						url+= r.RESULT_MSG.join('&orderNums=')
						alert('취소가 완료되었습니다.');
						location.href = url
					}
				})
			})
		})

		// 쵀대값일 경우 + disabled

		$('.btn-plus').click(function () {
			alert("부분취소는 고객센터에 문의해주세요.");
			return;

			const maxQty = $(this).siblings('.box-qty').data('max-qty');
			const qty = $(this).siblings('.box-qty').text()
			// console.log(maxQty, qty)
			if(maxQty===parseInt(qty)){
				$(this).prop('disabled','disabled')
				return;
			}
			$(this).siblings('.box-qty').text(parseInt(qty) + 1)
			calculateBoxPrice($(this))
		})
		$('.btn-minus').click(function () {
			alert("부분취소는 고객센터에 문의해주세요.");
			return;

			$('.btn-plus').prop('disabled',false)
			const qty = $(this).siblings('.box-qty').text()
			if (qty > 1) {
				$(this).siblings('.box-qty').text(parseInt(qty) - 1)
				calculateBoxPrice($(this))
			}
		})

		$('.item').click(function(){
			var orders = 2;
			// 택배배송리스트 1개인 경우
			if(orders == 1){
				$(".select-product-checkbox.each").prop("disabled", false);
			}else{
				alert("부분취소는 고객센터에 문의해주세요.");
			}

		})
	})
	function calculateBoxPrice(propThis) {
		let qty;
		if(propThis.is('.btn-plus')){
			qty = propThis.prev().text();
		}else if(propThis.is('.btn-minus')){
			qty = propThis.next().text();
		}

		// 가격 변동
		const eachPrice = propThis.parent().parent().parent().find('.value.origin').data('eachprice');
		propThis.parent().parent().parent().find('.value.origin').text(formatter.format(eachPrice * qty));

		// 세일가격 변동
		if(propThis.parent().parent().parent().find('.value').is('.value.sale')){
			const eachSalePrice = propThis.parent().parent().parent().find('.value.sale').data('eachprice');
			propThis.parent().parent().parent().find('.value.sale').text(formatter.format((eachPrice * qty)-(eachSalePrice * qty)));
		}

		// const qty = $(this).find('.box-qty').text()
		// $("[data-price]").each(function () {
		// 	var $t = $(this);
		// 	var p = parseInt($t.attr("data-price"), 10) * qty;
		// 	$t.text(numberFormat(p));
		// });

	}
</script>

<div class="breadcrumb-style">
	<div class="container">
		<ul>
			<li><a href="/">홈</a></li>
			<li><a href="/mypage">MY녹즙</a></li>
			<li><a class="" href="/mypage/order/box">택배배송 주문내역</a></li>
			<li><a class="" href="/mypage/order/box/">주문취소하기</a></li>
		</ul>
	</div>
</div>
<div class="container aside-layout" style="padding-bottom:120px; ">
	

<div class="aside" id="mypage_lnb">
    <h2 class="title">MY녹즙</h2>
    <ul class="lnb-style">
        <li class="indepth">
            <a>매일배송 음용내역</a>
            <ul class="sub-navigation">
                <li><a href="/mypage/drink/drink">음용내역</a></li>
                <li><a href="/mypage/drink/bill">영수증조회</a></li>
            </ul>
        </li>
        <li class="active">
            <a href="/mypage/order/box">택배배송 주문내역</a>
        </li>
        <li>
            <a href="/mypage/benefit/taste">시음선물내역</a>
        </li>
        <li>
            <a href="/mypage/benefit/coupon">쿠폰</a>
        </li>
        <li class="indepth">
            <a>활동정보</a>
            <ul class="sub-navigation">
                <li><a href="/mypage/action/interest">찜한상품</a></li>
                <li><a href="/mypage/action/counsel">1:1 문의</a></li>
                <li><a href="/mypage/action/review">리뷰</a></li>
            </ul>
        </li>
        <li class="indepth">
            <a>개인정보</a>
            <ul class="sub-navigation">
                <li><a href="/mypage/personal/address">주소록</a></li>
                <li><a href="/mypage/personal/info">개인정보 변경</a></li>
                <li><a href="/mypage/drink/paymethod">결제수단 관리</a></li>
                <li><a href="/mypage/personal/refund">환불계좌 관리</a></li>
            </ul>
        </li>
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
			<h2 class="container-title">
				주문취소하기
			</h2>
		</div>
		<div class="page-addiction-wrapper" style="align-items: center; margin-bottom:23px;">
			<div class="info-copy" style="padding-left:2px; padding-top:9px;">
				<p class="detailsinfo">2023-11-17</p>
				<p class="detailsinfo"><label>주문번호</label>13195</p>
			</div>
		</div>
		<div class="box-partition" style="margin-bottom:12px; padding:0 20px; height:60px;">
			<label class="check-type">
				<input type="checkbox" class="select-product-checkbox" id="select-all" name="select-product-all">
				<span style="font-size:16px; margin-bottom:4px; padding-left:51px;">전체선택</span>
			</label>
		</div>
		<div class="box-partition">
			<div class="delivery-order-list check-style details cancel">
				<ul>
					
					
					
					
						
							
							
							
							
						
						
						
						
						<li>
							<label class="item-wrapper">
								<input name="select-product" class="select-product-checkbox each" data-status="BOCC001" data-ordernum="13148" type="checkbox" disabled="">
								<div class="item" href="/">
									<a class="thumb">
										<img src="/file/download/product/20221110/cd399ead-476f-4c1d-bdcd-8b7868df04f9.png" onerror="this.src='/resources/images/common/no_img.png'" alt="">
									</a>
									<div class="contents">
										<div class="product">
											<label class="category">냉장상품</label>
											
											<a class="title">
													프레시업 5가지맛 혼합 7입
											</a>
										</div>
												<span>190ml X 7병</span>
										<div class="info">
											<div class="select-item horizontal">
												<span>수량</span>
												<div class="unit">

													<em data-max-qty="1" class="box-qty">1</em>

												</div>
											</div>
											
											
												<div class="price-tag right sm" style="margin-left: auto">
													<p class="value origin" style="color:#333;" data-eachprice="30700">
														30,700</p>
													<span class="unit">원</span>
												</div>
											





										</div>
									</div>
								</div>
							</label>
							<div class="foot">
								
							</div>
						</li>
					
						
						
						
							
							
						
						
						<li>
							<label class="item-wrapper">
								<input name="select-product" class="select-product-checkbox each" data-status="BOCC001" data-ordernum="13149" type="checkbox" disabled="">
								<div class="item" href="/">
									<a class="thumb">
										<img src="/file/download/product/20230418/8b4ea79e-9b4a-4be8-9718-4f53a895101e.png" onerror="this.src='/resources/images/common/no_img.png'" alt="">
									</a>
									<div class="contents">
										<div class="product">
											<label class="category">상온상품</label>
											
											<a class="title">
													프리미엄 관절케어, 관절청춘 
											</a>
										</div>
												<span>100ml X 30포</span>
										<div class="info">
											<div class="select-item horizontal">
												<span>수량</span>
												<div class="unit">

													<em data-max-qty="1" class="box-qty">1</em>

												</div>
											</div>
											
												<div class="before-price-tag" style="margin-left: auto">
													<p class="value origin" style="color:#333;" data-eachprice="225000">
														225,000
													</p>
													<span class="unit">원</span>
												</div>
												<div class="price-tag right sm">
													<p class="value sale" style="color:#333;" data-eachprice="195000">
														195,000</p>
													<span class="unit">원</span>
												</div>
											
											





										</div>
									</div>
								</div>
							</label>
							<div class="foot">
								
							</div>
						</li>
					
				</ul>
			</div>
		</div>
		<div class="box-partition rf" style="margin-top:20px;">
			<div class="part" style="padding-left:28px; padding-top:24px; padding-bottom:34px;">
				<div class="part-head">
					<h5>환불안내</h5>
				</div>
				<ul class="horizontal-info-list" style="margin-top:24px;">
					<li>
						<label>최종 상품금액</label>
						<div class="price-tag xs">
							<p class="value" style="color:#333;">225,700</p>

							<span class="unit">원</span>
						</div>
					</li>
					<li>
						<label>쿠폰할인금액</label>
						<div class="price-tag xs">
							<p class="value" style="color:red;">-
								24,827</p>
							<span class="unit">원</span>
						</div>
					</li>
					<li>
						<label>배송비</label>
						<div class="price-tag xs">
							<p class="value" style="color:#333;">0</p>
							<span class="unit">원</span>
						</div>
					</li>
					<li>
						<label>환불예상금액</label>
						<div class="price-tag xs">
							<p class="value" style="color:#333;">200,873</p>
							<span class="unit">원</span>
						</div>
					</li>
					<li>
						<label>환불 수단</label>
						<p>가상계좌</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="btn-area-right" style="margin-top:20px;">
			<a style="padding:0; width:140px;" class="btn-default btn-white" onclick="location.href='/mypage/order/box'">목록으로</a>
			<button id="cancelBtn" type="button" data-toggle="modal" data-target="#pauseModal" style="padding:0; width:140px;" class="btn-default btn-black">취소하기</button>
		</div>
	</div>
</div>

<script>
  var windowRef = null;
  function openWindowPop(url, name){
    var image = document.getElementById('guideImage');
    var w = image.width;
    var h = image.height;
    var options = `width=${w},height=${h}, status=no, menubar=no, toolbar=no, resizable=no`;
	if(windowRef===null|| windowRef.closed){

    windowRef = window.open('', name, options);
    windowRef.document.write(`<img src="${url}" width="${w}" maxWidth=100vw />`);
    windowRef.document.body.style.margin=0;
	}else {
    windowRef.focus();
	}

  }
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
</script>
<div style="" id="mini-side-nav">
	<a href="/mypage/drink/drink"><img src="/resources/images/ui/quick1.png" alt=""></a>
	<a id="quickChangeDrink" href="/mypage/drink/drink"><img src="/resources/images/ui/quick2.png" alt=""></a>
	<a id="quickChangeSchedule" href="/mypage/drink/drink"><img src="/resources/images/ui/quick3.png" alt=""></a>
	<a href="/mypage/drink/bill"><img src="/resources/images/ui/quick4.png" alt=""></a>
	<a href="#"><img src="/resources/images/ui/quickTop.png" alt=""></a>
</div>










</div>
		</main>		
		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
 	</div>
</body>
<!--
<div class="complete-copy-wrapper" style="margin-bottom:20px;">
	<span class="complete-copy">주문취소가 완료되었습니다.</span>
</div>
-->
</html>