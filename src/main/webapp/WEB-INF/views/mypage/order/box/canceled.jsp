<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="servlets.mypage.dto.BoxOrderListDTO"%>
<%@page import="servlets.order.domain.BoxOrderProductDTO"%>
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

<div class="breadcrumb-style">
	<div class="container">
		<ul>
			<li><a href="/">홈</a></li>
			<li><a href="/mypage">MY녹즙</a></li>
			<li><a class="" href="/mypage/order/box.do">택배배송 주문내역</a></li>
			<li><a class="" href="/mypage/order/box/cancel.do">주문취소하기</a></li>
		</ul>
	</div>
</div>

<div class="container aside-layout" style="padding-bottom:120px; ">
	
	<%@ include file="/WEB-INF/views/layouts/mypage/aside.jsp" %>

	<div class="container">
		<div class="border-wrapper">
			<h2 class="container-title">주문취소하기</h2>
		</div>
		
		<div class="page-addiction-wrapper" style="align-items: center; margin-bottom:23px;">
			<div class="info-copy" style="padding-left:2px; padding-top:9px;">
				<p class="detailsinfo"><label>주문번호</label>${ boxOrder.boxOrderNo }</p>
			</div>
			<p class="detailsinfo" align="right">취소접수일자&nbsp&nbsp&nbsp&nbsp
				<script>
					let today = new Date();
					let year = today.getFullYear();
					let month = today.getMonth()+1;
					let date = today.getDate();
					document.write(year+"."+month+"."+date);
				</script>
			</p>
		</div>
		
		<div class="complete-copy-wrapper" style="margin-bottom:20px;">
			<span class="complete-copy">주문취소가 완료되었습니다.</span>
		</div>
		
		<div class="box-partition">
			<div class="delivery-order-list check-style details cancel">
				<ul>
					<%
						BoxOrderListDTO order = (BoxOrderListDTO) request.getAttribute("boxOrder");
						ArrayList<BoxOrderProductDTO> prdList = order.getProductList();
						
						DecimalFormat decimalFormat = new DecimalFormat("#,###");
						
						Iterator<BoxOrderProductDTO> ir = prdList.iterator();
						while(ir.hasNext()) {
							BoxOrderProductDTO prd = ir.next();
					%>
					<li>
						<label class="item-wrapper">
							<div class="item" href="/">
								<a class="thumb">
									<img src="<%= prd.getImgPath() %>/<%= prd.getOriginName() %>" alt="">
								</a>
								<div class="contents">
									<div class="product">
										<label class="category"><%= prd.getProductsType() %></label>
										<a class="title"><%= prd.getProductsName()  %></a>
									</div>
									<span><%= prd.getProductsSize() %></span>
									<div class="info">
										<div class="select-item horizontal">
											<span>수량</span>
											<div class="unit">
												<em data-max-qty="1" class="box-qty"><%= prd.getProductsCnt() %></em>
											</div>
										</div>
					<%
							int price = prd.getPrice();
							int salePrice = prd.getEventPrice();
							int cnt = Integer.parseInt(prd.getProductsCnt());
							price *= cnt;
							salePrice *= cnt;
							if(prd.getPrice() != prd.getEventPrice() && prd.getEventPrice() != 0) {
					 %>
										<div class="before-price-tag" style="margin-left: auto">
											<p class="value origin" style="color:#333;" data-eachprice="<%= price %>"><%= decimalFormat.format(price) %></p>
											<span class="unit">원</span>
										</div>
										<div class="price-tag right sm">
											<p class="value sale" style="color:#333;" data-eachprice="<%= salePrice %>"><%= decimalFormat.format(salePrice) %></p>
											<span class="unit">원</span>
										</div>
					<%
							} else {
					%>
										<div class="price-tag right sm" style="margin-left: auto">
											<p class="value origin" style="color:#333;" data-eachprice="<%= price %>"><%= decimalFormat.format(price) %></p>
											<span class="unit">원</span>
										</div>
					<%
							} // if
					%>
									</div>
								</div>
							</div>
						</label>
						<div class="foot"></div>
					</li>
					<%
						} // while
					%>
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
							<p class="value" style="color:#333;">
								<fmt:formatNumber value="${ boxPay.boxSalePrice }" type="number"></fmt:formatNumber>
							</p>
							<span class="unit">원</span>
						</div>
					</li>
					<c:choose>
						<c:when test="${ boxPay.boxDiscountPrice eq 0 }">
							<li>
								<label>쿠폰할인금액</label>
								<div class="price-tag xs">
									<p class="value" style="black;">0</p>
									<span class="unit">원</span>
								</div>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<label>쿠폰할인금액</label>
								<div class="price-tag xs">
									<p class="value" style="color:red;">
										<fmt:formatNumber value="${ -boxPay.boxDiscountPrice }" type="number"></fmt:formatNumber>
									</p>
									<span class="unit">원</span>
								</div>
							</li>
						</c:otherwise>
					</c:choose>
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
						<label>환불예상금액</label>
						<div class="price-tag xs">
							<p class="value" style="color:#333;">
								<fmt:formatNumber value="${ boxPay.boxFinalPrice }" type="number"></fmt:formatNumber>
							</p>
							<span class="unit">원</span>
						</div>
					</li>
					<li>
						<label>환불 수단</label>
						<c:choose>
							<c:when test="${ boxPay.boxPayMethod eq 0 }">
								<p>카드결제</p>
							</c:when>
							<c:when test="${ boxPay.boxPayMethod eq 1 }">
								<p>실시간 계좌이체</p>
							</c:when>
							<c:otherwise>
								<p>가상계좌</p>
							</c:otherwise>
						</c:choose>
					</li>
				</ul>
			</div>
		</div>
		
		<div class="btn-area-right" style="margin-top:20px;">
			<a style="padding:0; width:140px;" class="btn-default btn-white" onclick="location.href='/mypage/order/box.do'">목록으로</a>
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
	<a href="/mypage/drink/drink"><img src="/resources/assets/images/ui/quick1.png" alt=""></a>
	<a id="quickChangeDrink" href="/mypage/drink/drink"><img src="/resources/assets/images/ui/quick2.png" alt=""></a>
	<a id="quickChangeSchedule" href="/mypage/drink/drink"><img src="/resources/assets/images/ui/quick3.png" alt=""></a>
	<a href="/mypage/drink/bill"><img src="/resources/assets/images/ui/quick4.png" alt=""></a>
	<a href="#"><img src="/resources/assets/images/ui/quickTop.png" alt=""></a>
</div>

</div>
		</main>		
		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
 	</div>
</body>

</html>