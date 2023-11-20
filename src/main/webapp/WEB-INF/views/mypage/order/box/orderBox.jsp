<%@page import="java.text.DecimalFormat"%>
<%@page import="servlets.order.domain.BoxOrderProductDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="servlets.mypage.dto.BoxOrderListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layouts/head.jsp" %>
<script src="/resources/assets/js/owl.carousel.min.js"></script>
<script src="/resources/assets/js/clipboard.min.js"></script>
<script src="/resources/assets/js/fdd.js"></script>
<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
		<main class="page">
			<div id="container-wrapper" class="container-wrapper">

			<div class="breadcrumb-style">
				<div class="container">
					<ul>
						<li><a href="/">홈</a></li>
						<li><a href="/mypage.do">MY녹즙</a></li>
						<li><a class="" href="/mypage/order/box.do">택배배송 주문내역</a></li>
					</ul>
				</div>
			</div>
			
			<div class="container aside-layout" style="padding-bottom:120px; ">
	
				<%@ include file="/WEB-INF/views/layouts/mypage/aside.jsp" %>

				<div class="container">
					<div class="border-wrapper">
						<h2 class="container-title">택배배송 주문내역</h2>
					</div>
				
					<div class="page-addiction-wrapper" style="align-items: center; margin-bottom:20px;">
						<div class="info-copy description">
							<p>총 <b>${ boxOrderCnt }</b>건</p>
						</div>
					
						<div class="form-input select none-dt" style="width:228px;">
							<dl>
								<dt>문의유형</dt>
								<dd>
									<div class="dropdown">
										<a class="btn dropdown-toggle" href="javascript:void(0);" role="button" data-value="3m" data-toggle="dropdown" aria-expanded="false" style="height: 60px; padding-left:19px; padding-top:2px;">
											최근 3개월
										</a>
										<div class="dropdown-menu">
											<a class="dropdown-item 3m" data-value="3m" href="javascript:void(0);">최근 3개월</a>
											<a class="dropdown-item 6m" data-value="6m" href="javascript:void(0);">최근 6개월</a>
											<a class="dropdown-item 1y" data-value="1y" href="javascript:void(0);">최근 1년</a>
										</div>
									</div>
								</dd>
							</dl>
						</div>
					
						<div class="form-input period sm none-dt date-complex" style="margin-left:10px;">
							<dl class="date" style="height: 60px">
								<dt>기간 설정</dt>
								<dd style="width:308px;">
									<input type="text" name="daterange" placeholder="기간을 선택하세요" autocomplete="off" id="datepicker">
								</dd>
							</dl>
						</div>
						
						<div class="btn-wrap">
							<button style="margin-left: 5px; height:60px; display: none" id="searchBtn" class="btn-square btn-black" type="button">조회</button>
						</div>
					</div>
				
					<form id="searchForm" style="display: none" action="/mypage/order/box.do">
						<input type="hidden" name="searchMonth" id="searchMonth" value="3m">
						<input type="text" name="startSearchDate" value="2023.09.18">
						<input type="text" name="endSearchDate" value="2023.11.18">
					</form>
					
					<div class="delivery-order-list">
						<ul id="post-items" data-list-object="append">
							<%
								ArrayList<BoxOrderListDTO> orderList = (ArrayList<BoxOrderListDTO>) request.getAttribute("boxOrderList");
								if(orderList != null) {
									Iterator<BoxOrderListDTO> oIr = orderList.iterator();
									BoxOrderListDTO order = null;
									ArrayList<BoxOrderProductDTO> prdList = null;
									Iterator<BoxOrderProductDTO> pIr = null;
									BoxOrderProductDTO prd = null;
									int orderStatus = -1;
									String oStatus = null;
									
									DecimalFormat decimalFormat = new DecimalFormat("#,###");
									
									while(oIr.hasNext()) {
										order = oIr.next();
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
								<li>
									<div class="addiction">
										<div class="copy">
											<span><%= order.getBoxOrderDate().substring(0, 10) %></span>
											<span><label>주문번호</label><%= order.getBoxOrderNo() %></span>
										</div>
										<div class="status">
											<a style="width:115px; padding:2px 0 0; height:41px;" href="/mypage/order/box/orderBoxView.do?boxOrderNo=<%= order.getBoxOrderNo() %>" class="rounded-button">주문내역조회</a>
										</div>
									</div>
							<%
										prdList = order.getProductList();
										pIr = prdList.iterator();
										while(pIr.hasNext()) {
											prd = pIr.next();
							%>
									<div class="box-item">
										<div class="item-wrapper">
											<div class="thumb">
												<img src="/<%= prd.getImgPath() %>/<%= prd.getOriginName() %>" alt="">
											</div>
										<div class="contents">
											<a href="/product/box/<%= prd.getProductsNo() %>" class="prd-info">
												<div class="product">
													<label class="category"><%= prd.getProductsType() %></label>
													<div style="display:flex;justify-content: space-between">
														<p class="title"><%= prd.getProductsName() %></p>
													</div>
													<span class="size"><%= prd.getProductsSize() %></span>
												</div>
											</a>
											<div class="info" style="margin-bottom:-2px;">
												<div class="span-tie">
													<span style="padding-bottom:4px;">수량 <%= prd.getProductsCnt() %> 개</span>
													<span style="font-weight:600; color:#7acc12;"><%= oStatus %></span>
												</div>
												<%
													if(prd.getPrice() != prd.getEventPrice() && prd.getEventPrice() != 0) {
												%>
												<div class="before-price-tag">
													<p class="value" style="color:#333;"><%= decimalFormat.format(prd.getPrice()) %></p>
													<span class="unit">원</span>
												</div>
												<div class="price-tag right sm">
													<p class="value" style="color:#333;"><%= decimalFormat.format(prd.getEventPrice()) %></p>
													<span class="unit">원</span>
												</div>
												<%
													} else {
												%>
												<div class="price-tag right sm">
													<p class="value" style="color:#333;"><%= decimalFormat.format(prd.getPrice()) %></p>
													<span class="unit">원</span>
												</div>
												<%
													} // if
												%>
											</div>
										</div>
											<div class="button-area">
												<button class="btn-default btn-white" onclick="location.href='/forum/inquiry/write.do">1:1 문의</button><!-- 왜 안되지? -->
												<%
													switch (orderStatus) {
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
												<!-- <button class="btn-default invoice btn-black" data-invo="6813-2692-9623" data-status="2" >배송조회</button> -->
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
									</div>
							<%
										} // while
									} // while
								} // if
							%>
								</li>
						</ul>
					</div>
				</div>
			</div>

			<div style="" id="mini-side-nav">
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

<script>
  	$(function () {
		let searchMonth = '';
		if(searchMonth != "" && searchMonth != undefined){
			$("#searchMonth").val(searchMonth);
			let target = "." + searchMonth;
			$('.dropdown-toggle').data('value', searchMonth)
			$('.dropdown-toggle').text($(target).text())
		} // if
			
		$(document).on('click','.invoice',function () {
		    $('#sweet').find('#t_code').val($(this).data('courier'))
		    $('#sweet').find('#t_invoice').val($(this).data('invo').toString().replaceAll('-',''))
		    $('#sweet').submit()
		})
			
		$('.dropdown-item').click(function () {
			const value = $(this).data('value');
			const text = $(this).text();
			$('.dropdown-toggle').data('value', value)
			$('.dropdown-toggle').text(text)
			
			if (value === '3m') {
			    var startDate = new Date();
			    var endDate = new Date();
			    startDate.setMonth(startDate.getMonth() - 3);
			} else if (value === '6m') {
				$("#searchMonth").val("6m");
			    var startDate = new Date();
			    var endDate = new Date();
			    startDate.setMonth(startDate.getMonth() - 6);
			} else {
				$("#searchMonth").val("1y");
			    var startDate = new Date();
			    var endDate = new Date();
			    startDate.setMonth(startDate.getMonth() - 12);
			}
			$('input[name="daterange"]').daterangepicker({startDate, endDate});
			$("#searchBtn").click();
		})
			
		$(document).on('click', '.applyBtn', function () {
			$("#searchBtn").click();
		});
		
		var startDate = new Date();
		var endDate = new Date();
		startDate.setMonth(startDate.getMonth() - 3);
		
		$('input[name="daterange"]').daterangepicker({
			opens: 'left',
			startDate,
			endDate
		}, function (start, end, label) {
			console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
		});
			
		$('#searchBtn').click(function () {
			const selectedRange = $('input[name=daterange]').val()
			console.log(selectedRange)
			$('input[name=startSearchDate]').val(selectedRange.split('~')[0].trim().replaceAll(' ', ''))
			$('input[name=endSearchDate]').val(selectedRange.split('~')[1].trim().replaceAll(' ', ''))
			$('#searchForm').submit();
		})
	});
</script>
</body>
</html>