<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="domain.order.box.BoxOrderProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layouts/head.jsp"%>  
<body>
	<div class="wrapper"> 
    	<%@ include file="/WEB-INF/views/layouts/header.jsp"%> 
        <main class="page order">
        	<div class="container">

				<div class="contents-area">
                	<form id="orderForm">
                    	<input type="hidden" name="cardValidation" id="cardValidation" value="N">
                    	<input type="hidden" name="payMethod" value="CARD">
                    	<input type="hidden" name="payPrice" value="195000">
                  
                  		<div class="location">
                        	<a href="/">홈</a> <a href="/">장바구니</a> <a href="/">주문서 작성</a>
                     	</div>
                  
                     	<div class="cont-checkout-area">
                        	<div class="title-tab-area">
                           		<h2 class="cont-title">주문서 작성</h2>
                        </div>
                  
                        <div class="prd-cart-area" style="padding-bottom: 50px;">
                           <div class="prd-cart-list-area">
                              <div class="checkout-prd-list">
                                 <div class="checkout-title-area">
	                                 <%
	                                    String [] prod = request.getParameterValues("productsNo");
	                                    int prdCnt = prod.length;
	                                 %>
                                    <strong class="list-amount">주문상품 <em class="prd-count" style="padding: 0 16px; margin-left: 2px"><%= prdCnt %></em></strong>
                                    <button type="button" class="btn-down">
                                       <i class="ico ico-down"><span class="hide">주문서 닫기</span></i>
                                    </button>
                                 </div>

                                 <ul style="padding: 0px 20px;" class="prd-cart-list cart-box-list box-list-type2" id="order_targets">
                                    
                                    <c:forEach items="${ productList }" var="prd">
                                       <li class="order-item" data-itemcode="${ prd.productsNo }" data-origin-price="${ prd.price }" data-price="${ prd.eventPrice }" style="padding: 20px 0 18px;">
                                          <div class="prd-cart-info-area">
                                             <div class="flex-l">
                                                <a class="thumb">
                                                   <img src="${ prd.imgPath }/${ prd.originName }" alt="${ prd.productsName }">
                                                </a>
                                                <div class="prd-info-select-amount">
                                                   <a href="/product/box/728?eventIdx=" class="prd-info">
                                                      <em>${ prd.productsType }</em> <b class="prd-title">${ prd.productsName }</b>
                                                      <span class="volume">(${ prd.productsSize })</span>
                                                   </a>
                                                   <input type="hidden" data-count="0" value="${ param.productsCnt }">
                                                   <div class="prd-select-amount">
                                                      <em>${ param.productsCnt }</em>개
                                                   </div>
                                                </div>
                                             </div>
            
                                             <div class="prd-cart-btn-price">
                                                <div></div>
                                                <div class="price-info">
                                                   <em class="before-price">
                                                      <em data-print-price="${ prd.price * param.productsCnt }">
                                                         <fmt:formatNumber value="${ prd.price * param.productsCnt }" type="number"></fmt:formatNumber>
                                                      </em>
                                                      <span>원</span>
                                                   </em>
                                                   <b class="now-price">
                                                      <b data-print-price="${ prd.eventPrice * param.productsCnt }">
                                                         <fmt:formatNumber value="${ prd.eventPrice * param.productsCnt }" type="number"></fmt:formatNumber>
                                                      </b>
                                                      <span>원</span>
                                                   </b>
                                                </div>
                                             </div>
                                          </div>
                                       </li>
                                    </c:forEach>
                                    
                                 </ul>
                              </div>

                              <%@ include file="/WEB-INF/views/layouts/addrInputForm.jsp"%>

                              <div class="checkout-input-area" style="padding-bottom: 32px" id="coupon-pane">
                                 <div class="checkout-input-title-area" style="margin-bottom: 17px">
                                    <h3 class="checkout-input-title">쿠폰적용</h3>
                                 </div>
                                 
                                 <div class="checkout-input-box">
                                    <div class="form-input">
                                       <dl>
                                          <dt>
                                             <label for="input01">쿠폰선택</label>
                                          </dt>
                                          <dd>
                                             <select id="coupon-selector" class="form-select form-select-lg">
                                                <c:choose>
                                                   <c:when test="${ empty couponList }">
                                                      <option value="" selected>사용 가능한 쿠폰이 없습니다.</option>
                                                      <script>
                                                         $("#coupon-selector").prop("disabled", true);
                                                      </script>
                                                   </c:when>
                                                   <c:otherwise>
                                                      <option value="" selected>쿠폰을 선택하세요.</option>
                                                      <c:forEach items="${ couponList }" var="coupon">
                                                         <c:choose>
                                                            <c:when test="${ coupon.discount > 1 }">
                                                               <option value="${ coupon.couponNo }" data-duplicate="${ coupon.duplication }" data-max-discount="${ coupon.maxDiscount }" data-discount="${coupon.discount}" data-coupon-name="${ coupon.couponName }">
                                                                  ${coupon.couponName}&nbsp;&nbsp;/&nbsp;&nbsp;<fmt:formatNumber value="${coupon.discount}" type="number"></fmt:formatNumber>원 할인
                                                               </option>
                                                            </c:when>
                                                            <c:otherwise>
                                                               <fmt:formatNumber value="${ coupon.discount }" type="percent"/>
                                                               <option value="${ coupon.couponNo }" data-duplicate="${ coupon.duplication }" data-max-discount="${ coupon.maxDiscount }" data-discount="${coupon.discount * 100}" data-coupon-name="${ coupon.couponName }">
                                                                  ${coupon.couponName}&nbsp;&nbsp;/&nbsp;&nbsp;<fmt:formatNumber value="${coupon.discount}" type="percent"></fmt:formatNumber> 할인
                                                               </option>
                                                            </c:otherwise>
                                                         </c:choose>
                                                      </c:forEach>
                                                   </c:otherwise>
                                                </c:choose>
                                             </select>
                                          </dd>
                                       </dl>
                                    </div>
                                    <ul class="file-list-area" id="apply-coupon-list">
                                    </ul>
                                 </div>
                              </div>
                              
                              <div class="checkout-input-area">
                                 <div class="checkout-input-title-area">
                                    <h3 class="checkout-input-title">결제정보</h3>
                                 </div>
                                 <div class="select-checkout-area">
                                    <ul class="nav nav-tabs nav-justified" id="myTab-area" role="tablist">
                                       <li class="nav-item" role="presentation">
                                          <a href="#checkout-type1" class="nav-link active" id="checkout-type-tab1" data-target="#checkout-type1" data-value="Card" data-toggle="tab" role="tab" aria-controls="checkout-type1" aria-selected="true">
                                             <span>카드결제</span>
                                          </a>
                                       </li>
                                       <li class="nav-item" role="presentation">
                                          <a href="#checkout-type2" class="nav-link" data-value="DirectBank" id="checkout-type-tab2" data-target="#checkout-type2" data-toggle="tab" role="tab" aria-controls="checkout-type2" aria-selected="false">
                                             <span>실시간 계좌이체</span>
                                          </a>
                                       </li>
                                       <li class="nav-item" role="presentation">
                                          <a href="#checkout-type3" class="nav-link" data-value="VBank" id="checkout-type-tab3" data-target="#checkout-type3" data-toggle="tab" role="tab" aria-controls="checkout-type3" aria-selected="false">
                                             <span>가상계좌</span>
                                          </a>
                                       </li>
                                    </ul>
                                    <div>
                                       <div id="checkout-type1"></div>
                                       <div id="checkout-type2"></div>
                                       <div id="checkout-type3"></div>
                                    </div>
                                 </div>
                              </div>
                           </div>

                           <div class="prd-checkout-area creat-checkout2">
                              <dl>
                                 <dt>
                                    <span>상품 판매가 </span> <b>
                                       <div class="now-price">
                                          <b data-price-view="origin"></b> <span>원</span>
                                       </div>
                                    </b>
                                 </dt>
                                 <dd>
            
                                    <span>상품 할인 판매가</span> <b>
                                       <div class="now-price">
                                          <b data-price-view="sale" class="minus"></b><span>원</span>
                                       </div>
                                    </b>
                                 </dd>
            
                                 <dd>
                                    <span>쿠폰 할인 금액</span>
                                    <b>
                                       <div class="now-price minus">
                                          <b data-price-view="coupon">0</b><span>원</span>
                                       </div>
                                    </b>
                                 </dd>
                                 <dd>
                                    <span>배송비</span>
                                    <b>
                                       <div class="now-price">
                                          <b data-price-view="delivery">0</b><span>원</span>
                                       </div>
                                    </b>
                                 </dd>
            
                                 <dd class="checkout-sum">
                                    <span>최종 결제금액</span>
                                    <b>
                                       <div class="now-price">
                                          <b data-price-view="payment"></b><span>원</span>
                                       </div>
                                    </b>
                                 </dd>
                              </dl>
                              <div class="checkbox chk-type4">
                                 <input type="checkbox" id="agree-11" name="chk-agree-condition">
                                    <label for="agree-11">구매조건 확인 및 결제진행 동의</label>
                              </div>
            
                              <div class="checkout-text" style="margin-top: 20px">
                                 <p>개인 변심에 의한 반품 또는 교환 시 별도 배송비가 청구됩니다.</p>
                                 <p>냉장 상품은 상품 특성 상 개인 변심에 의한 반품/ 교환이 불가합니다.</p>
                                 <p>상품에 따라 출고 지연이 발생할 수 있으며, 출고 지연 시 개별적으로 안내 드립니다.</p>
                                 <p>회원 본인은 위 내용을 확인하였으며, 구매조건, 결제대행 서비스 및 결제에 동의합니다.</p>
                              </div>
            
                              <button type="button" id="allOrderBtn" class="btn-default">주문하기</button>
                           </div>
                        </div>
                     </div>
                  </form>
               </div>

         </main>

		<div class="modal" id="addressModal" tabindex="-1" aria-labelledby="addressModal" aria-modal="true" style="display: none;" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="emailPolicyLabel">주소록</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
					</div>
	
					<div class="modal-body" style="max-height: 80vh; overflow-y: scroll">
						<div class="drinking-list address" style="margin: 0">
						</div>
						<div style="padding: 20px">
		                    <button class="btn-default btn-white" style="width: 100%">더보기</button>
		                </div>
					</div>
					
				</div>
			</div>
		</div>
		</div>
		<div id="mini-side-nav">
			<a href="/mypage/drink/drink"><img src="/resources/assets/images/ui/quick1.png" alt=""></a>
			<a id="quickChangeDrink" href="/mypage/drink/drink"><img src="/resources/assets/images/ui/quick2.png" alt=""></a>
			<a id="quickChangeSchedule" href="/mypage/drink/drink"><img src="/resources/assets/images/ui/quick3.png" alt=""></a>
			<a href="/mypage/drink/bill"><img src="/resources/assets/images/ui/quick4.png" alt=""></a>
			<a href="#"><img src="/resources/assets/images/ui/quickTop.png" alt=""></a>
		</div>
		<button id="top_move_pointer" class="top-nav">
			<img src="/resources/assets/images/ui/left_short_arrow.png">
			<p>TOP</p>
		</button> 
         <%@ include file="/WEB-INF/views/layouts/footer.jsp"%> 
      </div>

	<script>
         // 영수증
         $(function () {
            let bpEm = $("em.before-price");
            let npB = $("b.now-price");
            let bp = 0;
            let np = 0;
            // 모든 상품 가격 합산
            for (var i = 0; i < bpEm.length; i++) {
               bp += parseInt(bpEm.children("em").text().replaceAll(",", ""));
               np += parseInt(npB.children("b").text().replaceAll(",", ""));
            } // for
            
            let bpStr = bp.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            let npStr = np.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            
            // 출력
            $("b[data-price-view=origin]").text(bpStr);
            $("b[data-price-view=sale]").text(npStr);
            $("b[data-price-view=payment]").text(npStr);
         })
    </script>

	<script>
         $("#coupon-selector").on("change", function() {
            let index = $(this).prop("selectedIndex");
            if (index == 0) return;   // 쿠폰을 선택하세요. 선택 시
            
            // 선택된 option 태그 -> 쿠폰 정보 가져오기
            let opts = $(this).find("option");
            let opt = opts.eq(index);
            let couponNo = opt.val();										// 쿠폰 번호
            let couponName = opt.attr("data-coupon-name");					// 쿠폰 이름
            let duplication = opt.attr("data-duplicate");					// 중복 사용 가능 여부
            let maxDiscount = parseInt(opt.attr("data-max-discount"));		// 최대 할인 가능 가격
            let discount = parseInt(opt.attr("data-discount"));   			// 쿠폰 가격/할인율
            let isWon = opt.attr("data-discount") > 100 ? true : false;
            let salePrice = parseInt($("b[data-price-view=sale]").text().replace(",", ""));     // 현재 상품의 할인 적용가
            let discountVal = isWon ? discount : salePrice*(discount/100);  // 쿠폰 할인량
            
            // 선택한 쿠폰 -> li 추가
            let str = '<li data-coupon-idx="'+couponNo+'" data-coupon-name="'+couponName+'" data-duplicate="'+duplication+'" data-max-discount="'+maxDiscount+'" data-discount="'+discount+'">'
                     + '<input type="hidden" name="couponIdx" value="'+couponNo+'">'
                     + '<div>'
                        + '<em>'+couponName+'</em>'
                        + '<button type="button" class="coupon-remove btn-pop-close"><i class="ico-close ico");"></i></button>'
                     + '</div>';
            if (isWon) str += '<div class="now-price">'+discount.toLocaleString()+'<span>원</span></div>'
            else str += '<div class="now-price">'+discount.toLocaleString()+'<span>%</span></div>'
            str += '</li>';
            $("#apply-coupon-list").append(str);
            
            // 선택한 쿠폰 -> option 제거
            opt.remove();
            
         	// 영수증 - 쿠폰 할인가 수정
            let viewCoupon = $("b[data-price-view=coupon]");
            viewCoupon.addClass("minus");
            
            let currDiscount = parseInt(viewCoupon.text().replace(",", ""));   	// 현재 영수증의 쿠폰 할인 값
            let couponsDiscount = currDiscount-discountVal;						// 선택한 쿠폰들의 총 할인 값
            couponsDiscount = -salePrice > couponsDiscount ? -salePrice : couponsDiscount;		// 총 할인가가 현재 상품의 할인 적용가보다 작다면 할인 적용가로 고정
            viewCoupon.text(couponsDiscount.toLocaleString());
            
            // 영수증 - 결제 가격 수정
            $("b[data-price-view=payment]").text((salePrice+couponsDiscount).toLocaleString());
			$("input[name='payPrice']").val(salePrice+couponsDiscount);
			
            // 쿠폰을 전부 다 선택했다면
            if ($(this).find("option").length == 1) {
               $(this).find("option").text("사용 가능한 쿠폰이 없습니다.");
               $("#coupon-selector").prop("disabled", true);
            } // if
            
            // 중복 쿠폰 처리.....
			
         });
         
		// if (couponPrice == 0) viewCoupon.removeClass("minus");
    </script>
	<script>
			/* var type = "box";
		  	var gap = type == 'daily' ? 4 : 1;
		  	var dayOfWeekVal = ['A', 'B', 'C', 'D', 'E']
				
		  	var reqItems = [];
		  	var nfsItem = "".split(",").filter(v=>!!v);
		  	var nfsList = "".split(",").filter(v=>!!v);
				
		  	try {
		    	var items = decodeURIComponent("{&quot;item&quot;:[{&quot;itemCode&quot;:&quot;0072964&quot;,&quot;qty&quot;:&quot;1&quot;,&quot;eventIdx&quot;:&quot;&quot;}]}").replace(/\&quot;/g, '"');
		    	reqItems = JSON.parse(items).item;
		    	reqItems = reqItems.filter(x => !nfsList.includes(x.itemCode));
		    	console.log({reqItems})
		  	} catch (e) {
				console.log(e)
		  	}
		  	$(document).on("click", ".dropdown-menu .dropdown-item", function (e) {
		    	$(this).parent().prev().click();
		  	})
				
		  	console.log({nfsItem}) */
	</script>
	
	<script>
		var root = $('#addressModal .modal-body > .address');
		function showAddress(pageNo) {
			$('#addressModal').addClass("loading");
			$.ajax({
					url: '/order/addressBook.do'
					, dataType: "json"
					, cache: false
					, type:"GET"
					, data: { pageNo: pageNo }
					, success: function(response){
						const a = response.addrArr;
						if (a.length > 0) {
							var tpl = null;
					        $.each(a, function (i, addr) {
						    	tpl = '<div class="item" style="margin: 0 ; border-radius: 0">'
											+ '<div class="head">'
												+ '<div class="nickname-format xl">'
													+ '<label>기본</label>'
													+ '<h5>'+ addr.addrName +'</h5>'
										     	+ '</div>'
										    	+ '<ul class="info" style="margin-top:15px; padding-left:1px;">'
										       		+ '<li>'
										        		+ '<p>'+addr.name+'</p>'
										        	+ '</li>'
										        	+ '<li>'
										          		+ '<p>'+addr.tel+'</p>'
										        	+ '</li>'
										        	+ '<li>'
										          		+ '<p>('+addr.zipCode+') '+addr.addr +" "+ addr.addrDetail+'</p>'
										          		+ '<p style="display: none">'+addr.addr+'</p>'
										          		+ '<p style="display: none">'+addr.addrDetail+'</p>'
										          		+ '<p style="display: none">'+addr.memo+'</p>'
										        	+ '</li>'
										      	+ '</ul>'
										    + '</div>'
										    + '<div class="tail">'
										    	+ '<button type="button" class="adapt-address rounded-button">선택</button>'
										    + '</div>'
										+ '</div>';
								var el = $(tpl).data("item", addr);
						        if (addr.defaultAddr != '1') {
						        	el.find("label").remove();
								} // if
								root.append(el);
							});
					        
					        root.find(".adapt-address").on("click", function () {
								$('#addressModal').modal('hide');
								let pTags = $(this).parent().parent().find("p");
					            $("#receiver").val(pTags.eq(0).text());      // 수령인
					            $("#tel").val(pTags.eq(1).text());            // 전화번호
					            $("#zipcode").val(pTags.eq(2).text().substr(1, 5));   // 우편번호
					            $("#addrRoad").val(pTags.eq(3).text());
					            $("#addrDetail").val(pTags.eq(4).text());
					            $("#memo").val(pTags.eq(5).text());
							});
					        
					        var hasNext = a[0].totalCount > $('#addressModal').find('.item').length;
					        if (hasNext) {
					        	root.next().show().click(function () {
					            	showAddress(pageNo + 1);
								});
					        } else {
					        	root.next().hide();
					        } // if
							$('#addressModal').removeClass("loading")
						} else if (pageNo == 0) {
					    	alert('등록된 주소록이 없습니다.');
							$b('#addressModal').modal("hide");
						} // if
					} // success
					, error : function () {
						alert("error");
					} // error
			}) // ajax
			
			$('body').addClass("modal-open");
			$('#addressModal').addClass("show");
		} // showAddress
		
		$("#addressBtn").on("click", function() {
			root.empty();
			showAddress(0);
		});
	</script>

	<script>
		$(function(){
	    	window.addEventListener('resize', function(){
		  		if(window.innerWidth>1450){
					$('#mini-side-nav').show();
		  		} else {
					$('#mini-side-nav').hide();
		  		} // if
			}) 
	  	})
	  	
	  	$(window).scroll(function() {
			if ($(window).scrollTop() > 0) {
		    	if (!$("#top_move_pointer").hasClass("st")) {
		        	$("#top_move_pointer").addClass("st");
		      	} // if
		    } else {
		      	if ($("#top_move_pointer").hasClass("st")) {
		        	$("#top_move_pointer").removeClass("st");
		      	} // if
		    } // if
		})
		$(document).on("click", "#top_move_pointer", function() {
			$(document).scrollTop(0);
		});
	</script>

</body>
</html>