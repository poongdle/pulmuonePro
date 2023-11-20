<%@page import="servlets.order.domain.BoxOrderProductDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="servlets.mypage.dto.BoxOrderListDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layouts/head.jsp" %>

<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
		<main class="page">
			<div id="container-wrapper" class="container-wrapper">

<script>
	$(function (){
        $('.invoice').click(function () {
            $('#sweet').find('#t_code').val($(this).data('courier'))
            $('#sweet').find('#t_invoice').val($(this).data('invo').toString().replaceAll('-',''))
            $('#sweet').submit()
        })
	})
</script>

<div class="breadcrumb-style">
	<div class="container">
		<ul>
			<li><a href="/">홈</a></li>
			<li><a href="/mypage">MY녹즙</a></li>
			<li><a class="" href="/mypage/box/orderBox.do">택배배송 주문내역</a></li>
			<li><a class="active" href="/mypage/box/orderBoxView.do">택배배송 주문내역 상세</a></li>
		</ul>
	</div>
</div>

<div class="container aside-layout" style="padding-bottom:120px; ">
	<%@ include file="/WEB-INF/views/layouts/mypage/aside.jsp" %>

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
			<h2 class="container-title">택배배송 주문내역</h2>
		</div>
		<div class="page-addiction-wrapper" style="align-items: center; margin-bottom:25px;">
			<div class="info-copy" style="padding-left:2px; padding-top:9px;">
				<p class="detailsinfo">${ boxOrder.boxOrderDate.substring(0, 10) }</p>
				<p class="detailsinfo"><label>주문번호</label>${ param.boxOrderNo }</p>
			</div>
		</div>
		<div class="box-partition">
			<div class="delivery-order-list details">
				<ul>
					<%
						BoxOrderListDTO order = (BoxOrderListDTO) request.getAttribute("boxOrder");
						ArrayList<BoxOrderProductDTO> prdList = order.getProductList();
						
						DecimalFormat decimalFormat = new DecimalFormat("#,###");
						int orderStatus = -1;
						String oStatus = null;
						
						Iterator<BoxOrderProductDTO> ir = prdList.iterator();
						while(ir.hasNext()) {
							BoxOrderProductDTO prd = ir.next();
					%>
						<li>
							<div class="item-wrapper">
								<a class="item" href="/product/box/672">
									<div class="thumb">
										<img src="/<%= prd.getImgPath() %>/<%= prd.getOriginName() %>" alt="">
									</div>
									<div class="contents">
										<div class="product" style="padding-top:1px;">
											<label class="category"><%= prd.getProductsType() %></label>
											<p class="title"><%= prd.getProductsName()  %><span><%= prd.getProductsSize() %></span></p>
											<div class="span-tie">
												<span>수량 <%= prd.getProductsCnt() %>개</span>
					<% 
									orderStatus = order.getBoxOrderStatus();
								    switch (orderStatus) {
								        case -1:
								        	oStatus = "주문취소";
								            break;
								        case 0:
								            oStatus = "결제대기-(가상계좌)";
								            break;
								        case 1:
								            oStatus = "결제완료";
								            break;
								        case 2:
								            oStatus = "배송준비중";
								            break;
								        case 3:
								            oStatus = "배송중";
								            break;
								        case 4:
								            oStatus = "배송완료";
								            break;
								    } // switch
					%>
												<span class="status"><%= oStatus %></span>
											</div>
										</div>
										<div class="info">
					<%
							int price = prd.getPrice();
							int salePrice = prd.getEventPrice();
							int cnt = Integer.parseInt(prd.getProductsCnt());
							price *= cnt;
							salePrice *= cnt;
							if(prd.getPrice() != prd.getEventPrice() && prd.getEventPrice() != 0) {
					%>
										<div style="margin-bottom: -1px; padding-left:2px;" class="before-price-tag">
											<p class="value origin" style="color:#333;"><%= decimalFormat.format(price) %></p>
											<span class="unit">원</span>
										</div>
										<div style="margin-bottom: -1px; padding-left:2px;" class="price-tag right sm">
											<p class="value" style="color:#333;"><%= decimalFormat.format(salePrice) %></p>
											<span class="unit">원</span>
										</div>
					<%
							} else {
					%>
										<div style="margin-bottom: -1px; padding-left:2px;" class="price-tag right sm">
											<p class="value" style="color:#333;"><%= decimalFormat.format(price) %></p>
											<span class="unit">원</span>
										</div>
					<%
							} // if
					%>
										</div>
									</div>
								</a>
								
								<div class="button-area">
									<button class="btn-default btn-white" onclick="location.href='/forum/inquiry/write.do">1:1 문의</button><!-- 왜 안되지? -->
					<%
							switch (order.getBoxOrderStatus()) {
								 case -1:
					%>
												<button class="btn-default btn-black" style="background: grey" onclick="alert('주문취소된 상품입니다.')">주문취소</button>
					<%
									break;
								case 0: case 1:
					%>
												<button class="btn-default btn-black" data-status="0" data-order-no="<%= order.getBoxOrderNo() %>">주문취소</button>
					<%
									break;
								case 2: case 3: case 4:
					%>
												<form action="http://info.sweettracker.co.kr/tracking/5" method="post">
										            <div class="form-group" style="display: none">
										              <label for="t_key">API key</label>
										              <input type="text" class="form-control" id="t_key" name="t_key" placeholder="제공받은 APIKEY" value="Ppgk5mfovfq2cMhSjFOnYA">
										            </div>
										            <div class="form-group" style="display: none">
										              <label for="t_code">택배사 코드</label>
										              <input type="text" class="form-control" name="t_code" id="t_code" placeholder="택배사 코드" value="04">
										            </div>
										            <div class="form-group" style="display: none">
										              <label for="t_invoice">운송장 번호</label>
										              <input type="text" class="form-control" name="t_invoice" id="t_invoice" placeholder="운송장 번호" value="<%= prd.getTrackingNo() %>">
										            </div>
										            <button class="btn-default invoice btn-black" data-invo="<%= prd.getTrackingNo() %>" data-status="2" >배송조회</button>
										        </form>
					<%
									break;
							} // switch
					%>
								</div>
							</div>
						</li>
					<%
						} // while
					%>
				</ul>
			</div>
		</div>
		
		<div class="dual-layout sm do" style="margin-top:30px">
			<div>
				<div class="box-partition">
					<div class="part">
						<div class="part-head">
							<h5>배송지정보</h5>
						</div>
						<ul class="vertical-info-list">
							<li>
								<label>받으시는 분</label>
								<p>${ boxShip.boxReceiver }</p>
							</li>
							<li>
								<label>연락처</label>
								<p data-call-text="">${ boxShip.boxTel }</p>
							</li>
							<li>
								<label>주소</label>
								<p>[${ boxShip.boxZipCode }]${ boxShip.boxAddr }, ${ boxShip.boxAddrDetail }</p>
							</li>
							<li>
								<label>배송메모</label>
								<p>${ boxShip.boxMemo }</p>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			<div>
				<div class="box-partition">
					<div class="part" style="padding-bottom:33px;">
						<div class="part-head">
							<h5>결제정보</h5>
						</div>
						<ul class="horizontal-info-list">
							<li>
								<label>상품 판매가</label>
								<div class="price-tag xs">
									<p class="value" style="color:#333;">
										<fmt:formatNumber value="${ boxPay.boxPrice }" type="number"></fmt:formatNumber>
									</p>
									<span class="unit">원</span>
								</div>
							</li>
							
							<li>
								<label>상품 할인 판매가</label>
								<div class="price-tag xs">
									<c:choose>
										<c:when test="${ boxPay.boxPrice eq boxPay.boxSalePrice or boxPay.boxSalePrice eq 0 }">
											<p class="value" style="color:#333;">
												<fmt:formatNumber value="${ boxPay.boxSalePrice }" type="number"></fmt:formatNumber>
											</p>
										</c:when>
										<c:otherwise>
											<p class="value" style="color:#db2929;">
												<fmt:formatNumber value="${ boxPay.boxSalePrice }" type="number"></fmt:formatNumber>
											</p>
										</c:otherwise>
									</c:choose>
									<span class="unit">원</span>
								</div>
							</li>
							
							<li>
								<label>쿠폰 할인 금액</label>
								<div class="price-tag xs">
									<c:choose>
										<c:when test="${ boxPay.boxDiscountPrice eq 0 }">
											<p class="value" style="color:#333;">0</p>
										</c:when>
										<c:otherwise>
											<p class="value" style="color:#db2929;">
												<fmt:formatNumber value="${ boxPay.boxDiscountPrice }" type="number"></fmt:formatNumber>
											</p>
										</c:otherwise>
									</c:choose>
									<span class="unit">원</span>
								</div>
							</li>
							
							<li>
								<label>배송비</label>
								<div class="price-tag xs">
									<p class="value" style="color:#333;">
										<fmt:formatNumber value="${ boxPay.boxShippingFee }" type="number"></fmt:formatNumber>
									</p>
									<span class="unit">원</span>
								</div>
							</li>
							
							<li>
								<label>결제수단</label>
								<c:choose>
									<c:when test="${ boxPay.boxPayMethod eq 0 }">
										<p>신용카드</p>
									</c:when>
									<c:when test="${ boxPay.boxPayMethod eq 1 }">
										<p>실시간 계좌이체</p>
									</c:when>
									<c:otherwise>
										<p>가상계좌</p>
									</c:otherwise>
								</c:choose>
							</li>
							
							<li style="margin-top:14px;" class="bigger">
								<label>최종 결제금액</label>
								<div class="price-tag sm">
									<p class="value" style="color:#7acc12;">
										<fmt:formatNumber value="${ boxPay.boxFinalPrice }" type="number"></fmt:formatNumber>
									</p>
									<span class="unit">원</span>
								</div>
							</li>
						</ul>
						
						<ul class="horizontal-info-list">
							<li style="align-items: flex-start;">
								<label style="margin-bottom:0; margin-top:3px;font-size: 16px;color: #333">사용된 쿠폰</label>
							</li>
							
							<c:choose>
								<c:when test="${ empty couponList }">
									<li style="margin-top:13px;">
										<label style="margin-bottom:3px;">없음</label>
										<div class="price-tag xs" style="margin-top:4px;">
											<p class="value" style="color:#333;"></p>
											<span class="unit"></span>
										</div>
									</li>
								</c:when>
								<c:otherwise>
									<c:forEach items="${ couponList }" var="c">
										<li style="margin-top:13px;">
											<label style="margin-bottom:3px;">${ c.couponName }</label>
											<div class="price-tag xs" style="margin-top:4px;">
												<c:choose>
													<c:when test="${ c.discount <= 1 }">
														<p class="value" style="color:#333;">
															<fmt:formatNumber value="${ c.discount*100 }" type="number"></fmt:formatNumber>
														</p>
														<span class="unit">%</span>
													</c:when>
													<c:otherwise>
														<p class="value" style="color:#333;">
															<fmt:formatNumber value="${ c.discount }" type="number"></fmt:formatNumber>
														</p>
														<span class="unit">원</span>
													</c:otherwise>
												</c:choose>
											</div>
										</li>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							
							
						</ul>
						
					</div>
				</div>
			</div>
		</div>
		<div class="alert-area lg" style="padding-top:38px;">
			<h4>유의사항</h4>
			<ul>
				<li>주문 내역은 MY녹즙을 통해 최근 1년간 열람이 가능합니다.</li>
				<li>냉장 상품은 상품 특성 상 개인 변심에 의한 교환/반품이 불가하며, 상품에 문제가 있을 시 1:1 고객센터를 통해 문의 가능합니다.</li>
			</ul>
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

			<div style="display: none;" id="mini-side-nav">
				<a href="/mypage/drink/drink"><img src="/resources/assets/images/ui/quick1.png" alt=""></a>
				<a id="quickChangeDrink" href="/mypage/drink/drink/change/230000234094/23812"><img src="/resources/assets/images/ui/quick2.png" alt=""></a>
				<a id="quickChangeSchedule" href="/mypage/drink/drink/pause/230000234094/23812"><img src="/resources/assets/images/ui/quick3.png" alt=""></a>
				<a href="/mypage/drink/bill"><img src="/resources/assets/images/ui/quick4.png" alt=""></a>
				<a href="#"><img src="/resources/assets/images/ui/quickTop.png" alt=""></a>
			</div>

		</div>
	</main>		
</div>

<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>

<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="alertModalLabel"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">주문취소된 상품입니다.</div>
			<button type="button" class="modal-footer" data-dismiss="modal">확인</button>
		</div>
	</div>
</div>

<script>
	$("div.button-area > button").on("click", function() {
		let status = $(this).attr("data-status");
		if(status == 0) {	// 주문 취소
			let orderNo = $(this).attr("data-order-no");
			location.href = "/mypage/order/box/cancel.do?orderNo=" + orderNo;
		} // if
		if(status == 2) {	// 배송조회
			alert("배송조회");
		} // if
	});
</script>

<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="confirmModalLabel"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<button type="button" class="cancel" data-dismiss="modal">취소</button>
				<button type="button" class="confirm">확인</button>
			</div>
		</div>
	</div>
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
  /*
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
  */
</script>

</body>
</html>