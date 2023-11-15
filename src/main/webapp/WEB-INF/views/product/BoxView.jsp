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
<script src="/resources/assets/js/design.js"></script>
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
<link rel="stylesheet" href="/resources/assets/css/proview.css">
<link rel="stylesheet" href="/resources/assets/css/list.css">
<link rel="stylesheet" href="/resources/assets/css/style.css">
</head>
<body>
<script type="text/javascript">
    $().ready(function () {
        $('#removeBanner').click(function (){
                var setCookie = function(name, value, exp) {
                    var date = new Date();
                    var midnight = new Date(date.getFullYear(), date.getMonth(), date.getDate(), 23, 59, 59);
                    document.cookie = name + '=' + value + ';expires=' + midnight + ';path=/';
                };

                setCookie('dontShowTopBanner', 'Y', 1);


            $(this).closest('.highlight-bn').remove();
        })
    });
    function toggleMenu() {
      if ($("#gnb-item").css("display") == "block") {
        $("#gnb-item").slideUp();
      }
      else {
        $("#gnb-item").slideDown();
      }
    }
    $('.logout-btn').click(function (){
        if(confirm('로그아웃 하시겠습니까?')){

        }
    })
    $(document).ready(function(){
        $('.welcome b').hover(function() {
            $('.logout-btn').stop().fadeIn('500');
        }, function(){
            $('.logout-btn').stop().fadeOut('500');
        });
    });
</script>
<script type="text/javascript">
	var itemType = "box";
	var formatter = new Intl.NumberFormat();
	var limitSize = parseInt("-1" || "-1", 10);

	function calculateBoxPrice() {
		const qty = $('.box-qty').text()
		const price = '19000'
		$('#totalPrice b').text(formatter.format(qty * price))

	}
    $().ready(function () {
        // region 가격
        $("input[name=r1]").change(function () {
            if ($(this).is(":checked")) {
                var totalPrice = 0;
                if ($(this).hasClass('none-package')) {
                    $('input[name=c1]').removeAttr('disabled');
                    $('.check-list').find('input[type=checkbox]:not(:checked)').click()
                    const cnt = $('input[name=c1]:checked').length
                    const price = '19000'
                    totalPrice = cnt * price * 4;

                } else {
                    $('.check-list').find('input[type=checkbox]:checked').click()
                    $('input[name=c1]').attr('disabled', 'disabled');
                    totalPrice = $(this).data("total-price") * 4;
                }
                $("#totalPrice b").text(formatter.format(totalPrice));
            }
        });
        $('input[name=c1]').change(function () {
            if ($("input[name=r1]:checked").hasClass('none-package')) {
                const cnt = $('input[name=c1]:checked').length
                const price = '19000'
                $("#totalPrice b").text(formatter.format(cnt * price * 4));
            }
        })     
        calculateBoxPrice()        

        $('.btn-plus').click(function () {
            var qty = $('.box-qty').text()
			var beSize = parseInt(qty, 10) + 1;
			if (limitSize >= 0 && beSize > limitSize) {
				alert("해당 상품은 한정수량 판매입니다.");
				return;
			}
            $('.box-qty').text(beSize)
            calculateBoxPrice()
        })
        $('.btn-minus').click(function () {
            const qty = $('.box-qty').text()
            if (qty > 1) {
                $('.box-qty').text(parseInt(qty) - 1)
                calculateBoxPrice()
            }
        })
        //endregion
        //    region 추천 패키지
        $('.package-more').click(function () {
			$(this).hide().parents(".select-package").addClass("show-all");
        })

        $('.none-package').click();
		//    endregion
    });
</script>
	<script>
  var nowArgs = undefined;
  window.orderProcess = function (args) {
    if (!window.is_signed) {
      alertWithRedirect("로그인 후 이용가능합니다.", "/member/login?redirectUrl=" + location.href)
      return;
    }
    nowArgs = args;

    var codes = [];
    for (var item of args.item) {
      if (!item.itemCode) continue;
      codes.push(item.itemCode);
    }

    $("#orderModal ul").html("");
    $("#orderModal").addClass("loading").modal("show");

    axios.post(`/product_available`, { ids: codes }).then(function (r) {
      var o = r.data.RESULT_MSG;
      if (o.fails.length) {
        var itemCodes = o.fails.map(v => v.itemCode);
        var args2 = {
          item: args.item.filter(v => !itemCodes.includes(v.itemCode))
        };
        nowArgs = args2;
        $("#orderModal").modal("hide").removeClass("loading");
        showNotAvailModal(o.fails, function () {
          $("#orderModal ul").html("");
          $("#orderModal").addClass("loading").modal("show");

          if (o.fails.length == codes.length) {
            $("#orderModal").removeClass("loading").modal("hide");
            return;
          }

          get({url: '/order/daily/check/option'}, function (r) {
            if (typeof r.RESULT_MSG == 'object' && r.RESULT_MSG.length > 0) {
              let customerList = r.RESULT_MSG
              if (customerList.length > 5) {
                customerList = customerList.slice(0, 5)
              }

              var latno = 0;
              $.each(customerList, function (i, data) {
                var tpl = $("#orderPosLi").text();
                var nickname = data.nickname;
                if (!nickname) {
                  if (latno == 0) {
                    latno = customerList.filter(v => !!v.nickname).length
                  }
                  nickname = "음용 " + latno;
                  latno++;
                }
                tpl = tpl.replace(/\{nickname\}/g, nickname);
                tpl = tpl.replace(/\{custnumber\}/g, data.custnumber);
                tpl = tpl.replace(/\{prtnId\}/g, data.phiCustomerVo.prtnId);
                $("#orderModal ul").append(tpl);
              })
              $('#orderModal input[name=custnum]:first').click()
              $("#orderModal").removeClass("loading")
            } else {
              location.href = "/order/daily/step1?item=" + encodeURIComponent(JSON.stringify(args2));
            }
          });
        });
      }
      else {
        get({url: '/order/daily/check/option'}, function (r) {
          if (typeof r.RESULT_MSG == 'object' && r.RESULT_MSG.length > 0) {
            let customerList = r.RESULT_MSG
            if (customerList.length > 5) {
              customerList = customerList.slice(0, 5)
            }
            var latno = 0;
            $.each(customerList, function (i, data) {
              var tpl = $("#orderPosLi").text();
              var nickname = data.nickname;
              if (!nickname) {
                if (latno == 0) {
                  latno = customerList.filter(v => !!v.nickname).length
                }
                nickname = "음용 " + latno;
                latno++;
              }
              tpl = tpl.replace(/\{nickname\}/g, nickname);
              tpl = tpl.replace(/\{custnumber\}/g, data.custnumber);
              tpl = tpl.replace(/\{prtnId\}/g, data.phiCustomerVo.prtnId);
              $("#orderModal ul").append(tpl);
            })
            $('#orderModal input[name=custnum]:first').click()
            $("#orderModal").removeClass("loading")
          } else {
            location.href = "/order/daily/step1?item=" + encodeURIComponent(JSON.stringify(args));
          }
        });
      }
    });

  }
  $(document).on("click", "#orderModal button", function (e) {
    var type = $(this).attr("data-type");
    var p = encodeURIComponent(JSON.stringify(nowArgs));;
    if (type === "new") {
      location.href = "/order/daily/step1?item=" + p
    } else if (type === "continue") {
      var c = $("input[name='custnum']:checked");
      var custNumber = c.val();
      var prtnId = c.attr("data-prtn-id");
      location.href = "/mypage/drink/drink/change/" + custNumber + "/" + prtnId + "?item=" + p;
    }
  })
</script>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
		<main class="page">
			<div class="bgfff">
				<div class="breadcrumb-style">
					<div class="container">
						<ul>
							<li><a href="/">홈</a></li>
							<li><a href="/product/daily/dailylist.do">매일배송</a></li>
						</ul>
					</div>
				</div>
				<div class="container">
					<div class="product-info-area">
						<div class="thumb-area">
							<c:forEach var="dto" items="${list }" end="0">
								<div class="main-thumb">									
										<img src="/file/download/product/${dto.system_name }">									
								</div>
							</c:forEach>
							<ul class="sub-thumb">
								<c:forEach var="dto" items="${list }" end="4">
									<li class="active">
										<button type="button" class="item">											
												<img src="/file/download/product/${dto.system_name }">											
										</button>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="info-area">
							<div class="label-line">
								<label class="new">NEW</label>
							</div>
							<div style="height: 6px"></div>
							<div class="prd-detail-title-area">
								<div style="flex: 1; padding-right: 10px">									
										<h2>${dto.products_name }</h2>
										<p>${dto.products_sub_name }</p>
								</div>
								<button data-toggle="modal" data-target="#shareModal"
									type="button" class="ellipse-button primary"
									style="margin-top: 8px">
									<i class="ico ico-share-wt"></i> <span class="offscreen">공유하기</span>
								</button>
							</div>
							<div class="product-addiction">
								<div class="price-item">
									<span style="padding-right: 12px; font-size: 22px;">
										(원산지 :상품상세 참조) </span>								
										<p>
											<fmt:formatNumber value="${dto.price }" pattern="#,###" />
											<span>원</span>
										</p>
										<span>(${dto.products_size })</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Nav tabs -->
				<div class="tab-area">
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation"><a href="#home" class="active"
							aria-controls="home" role="tab" data-toggle="tab">상품정보</a></li>
						<li role="presentation"><a href="#info" aria-controls="info"
							role="tab" data-toggle="tab">상품정보제공고시</a></li>
					</ul>
				</div>
			</div>
			<!-- Tab panes -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="home">
					<div class="recommend-product">
						<div class="container">
							<div class="prd-detail-image" style="margin-bottom: 74px">
								<p>
									<c:forEach var="dto" items="${list }" begin="1" end="1">
										<c:if test="${dto.origin_name == 'ViewContent.png' }">
											<img src="/file/download/product/${dto.system_name }"
												title="비타맥스엑스투(1140).png"
												class="8d4e7339-2e48-4c36-9cd8-6fe8e5bab379.png">
											<br style="clear: both;">&nbsp;
									</c:if>
									</c:forEach>
								</p>
								<p>
									<span style="font-size: 18.6667px;"><b> </b></span>
								</p>
								<div style="text-align: center;" align="center">
									<b><b style="font-size: 16px;"><b
											style="text-indent: 0in; font-size: 12px;"><span
												style="font-size: 36pt;"><br></span></b></b></b>
								</div>
								<div style="text-align: center;" align="center">
									<b><b style="font-size: 16px;"><b
											style="text-indent: 0in; font-size: 12px;"><span
												style="font-size: 36pt;">제품 구성</span></b></b><b
										style="font-size: 16px;"><b
											style="text-indent: 0in; font-size: 12px;"><span
												style="font-size: 36pt;">&nbsp;</span></b></b></b>
								</div>
								<div style="text-align: center;" align="center">
									<b><b style="font-size: 16px;"><b
											style="text-indent: 0in; font-size: 12px;"><span
												style="font-size: 36pt;"> <c:forEach var="dto"
														items="${list }" begin="2" end="2">
														<c:if test="${dto.origin_name == 'ViewContent.png' }">
															<img src="/file/download/product/${dto.system_name }"
																title="비타맥스엑스투.png"
																class="51c56f1d-2b05-4243-8951-89256480522f.png">
														</c:if>
													</c:forEach>

											</span></b></b></b>
								</div>
								<div style="text-align: center;" align="center">
									<b><b style="font-size: 16px;"><b
											style="text-indent: 0in; font-size: 12px;"><span
												style="font-size: 36pt; color: rgb(0, 0, 0);">제품 정보 및
													주의사항</span></b></b></b>
								</div>
								<div style="text-align: center;" align="center">
									<b><b style="font-size: 16px;"><b
											style="text-indent: 0in; font-size: 12px;"><span
												style="font-size: 36pt;"> <c:forEach var="dto"
														items="${list }" begin="3" end="3">
														<c:if test="${dto.origin_name == 'ViewContent.png' }">
															<img src="/file/download/product/${dto.system_name }"
																title="비타맥스엑스투.png"
																class="c424f176-361e-43f5-acee-1c4c59623bdb.png">
														</c:if>
													</c:forEach>
											</span></b></b></b>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="info">
					<div class="container">
						<div class="product-spec">
							<ul>
								<li><label>식품의 유형</label>
									<p>상세 참조</p></li>

								<li><label>제조업소의 명칭과 소재지</label>
									<p>상세 참조</p></li>

								<li><label>제조연월일/유통기한</label>
									<p>상세 참조</p></li>

								<li><label>용량</label>
									<p>상세 참조</p></li>

								<li><label>수량</label>
									<p>상세 참조</p></li>

								<li><label>원재료 및 함량</label>
									<p>상세 참조</p></li>

								<li><label>영양정보</label>
									<p>상세 참조</p></li>

								<li><label>영양정보</label>
									<p>상세 참조</p></li>

								<li><label>섭취량,섭취방법 및 섭취시 주의사항 및 부작용 가능성</label>
									<p>상세 참조</p></li>

								<li><label>질병의 예방 및 치료를 위한 의약품이 아니라는 내용의 표현</label>
									<p>해당 사항 없음</p></li>

								<li><label>유전자변형건강기능식품에 해당하는 경우의 표시</label>
									<p>해당 사항 없음</p></li>

								<li><label>수입신고여부</label>
									<p>해당 사항 없음</p></li>

								<li><label>소비자안전을 위한 주의사항</label>
									<p>상세 참조</p></li>

								<li><label>소비자 상담번호</label>
									<p>080-800-0393</p></li>

							</ul>
						</div>
					</div>
				</div>
			</div>
			<a class="faq-product" href="/forum/faq">
				<div class="container">
					<h2 class="part-title">FAQ</h2>
					<p>자주 묻는 질문입니다.</p>
				</div>
			</a>
			<div class="bottom-fixed-layer">
				<div class="container">
					<div class="info">
						<div class="prd-detail-modal-title ">
							<span>4주 예상 주문 금액</span>
							<p id="totalPrice" class="price"
								style="margin-left: 39px; margin-bottom: 8px">
								<b>70,000</b><span>원</span>
							</p>
						</div>
					</div>
					<div class="button-set"
						style="margin-right: -4px; margin-bottom: 7px">
						<button class="button-fix interest-button " data-wish-type="daily"
							data-wish-id="743"></button>
						<!-- 품절용 가이드 추가 -->
						<button id="cartBtn" class="button-fix black">장바구니</button>
						<button id="orderBtn" class="button-fix primary">바로구매</button>


					</div>
				</div>
			</div>
		</main>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>

	</div>
</body>
</html>

