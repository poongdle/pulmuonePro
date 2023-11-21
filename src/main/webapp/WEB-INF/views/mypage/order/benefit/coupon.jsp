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
			<h2 class="container-title">
				쿠폰
			</h2>
			<div class="page-tab">

				<a href="/mypage/benefit/coupon" class="active">전체</a>
				<a href="/mypage/benefit/coupon?type=CPTP012">매일배송</a>
				<a href="/mypage/benefit/coupon?type=CPTP013">택배배송</a>
				<button style="margin-left: 20px;color: #7acc12" onclick="openWindowPop('/resources/images/common/couponGuide.png','popup')" target="img">쿠폰사용가이드</button>
			</div>
		</div>
		<div class="coupon-srch">
			<form id="registCoupon">
			<div class="form-input none-dt">
				<dl>
					<dt><label>쿠폰번호</label></dt>
					<dd>
						<input type="text" name="code" placeholder="쿠폰번호를 입력하세요.">
						<button class="btn-square">쿠폰등록</button>
					</dd>
				</dl>
			</div>
			</form>
		</div>
		<div class="page-addiction-wrapper" style="align-items: center; margin-bottom:2px;">
			<div class="info-copy">

			</div>
			<div class="price-tag coupon right">
				<label>사용가능한 쿠폰</label>
				<p class="value">2</p>
			</div>
		</div>
		<div class="coupon-item-list">
			
			<ul id="pagable-list" data-list-object="append">
			
				<li>
					
					<div class="item ">
						<div style="min-height: 175px" class="body">
							<div style="display: flex;justify-content: space-between;min-height: 35px">
								<h4>웰컴쿠폰</h4>
								
									<a style="padding: 0 18px; font-size: 13px;height: 34px" href="/mypage/drink/bill" class="rounded-button">사용하러가기</a>

								


							</div>
							<div class="date">
								<p>2023.10.23 ~ 2024.01.25</p>
								
								<span>
									
									66일남음
								</span>
							</div>
							<ul>
								<li>
									
									중복사용가능
								</li>
								<li class="prtn">

									
										전 매일배송상품 사용가능
									
									

									
										&nbsp;&nbsp;/&nbsp;&nbsp;
										
											전 가맹점 사용가능
										
										
									
								</li>
							</ul>
						</div>
						<div class="foot">
							
							
								<p class="price">5,000<span>원</span></p>
							

							<p class="out">
								
								
								
								
							</p>
						</div>
					</div>
				</li>
			
				<li>
					
					<div class="item ">
						<div style="min-height: 175px" class="body">
							<div style="display: flex;justify-content: space-between;min-height: 35px">
								<h4>11월 녹녹데이 택배배송 쿠폰</h4>
								


							</div>
							<div class="date">
								<p>2023.11.11 ~ 2024.01.25</p>
								
								<span>
									
									66일남음
								</span>
							</div>
							<ul>
								<li>
									
									중복사용가능
								</li>
								<li class="prtn">

									
										전 택배배송상품 사용가능
									
									

									
								</li>
							</ul>
						</div>
						<div class="foot">
							
								<p class="price">11<span>%</span></p>
							
							

							<p class="out">
								
								
								
								
							</p>
						</div>
					</div>
				</li>
			
			</ul>
			
		</div>

		<div class="alert-area lg between" style="padding-top:38px; margin-top: 30px">
			<h4 style="margin-bottom:17px;">유의사항</h4>
			<ul>
				<li>
					매일 배송 상품에 사용 가능한 쿠폰은 매 월 25일까지 스마트청구서에서 적용 가능합니다.
				</li>
				<li>
					스마트청구서는 MY녹즙&gt;매일배송음용내역&gt;영수증조회에서 확인 가능합니다.
				</li>
				<li>
					스마트청구서에서 사용한 쿠폰은 사용 취소가 불가합니다.
				</li>
				<li>
					가맹점 사정에 따라 일부 쿠폰은 사용이 불가할 수 있습니다.
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