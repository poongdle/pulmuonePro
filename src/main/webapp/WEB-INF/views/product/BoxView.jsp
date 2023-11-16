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
	<script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'UA-150666346-1');
</script>
	<script>
	var formatter = new Intl.NumberFormat();
	var days = ["A", "B", "C", "D", "E"];

	var itemType = "box";
	var itemCode = "0073165";
	var eventIdx = "";

	$(document).ready(function () {
        document.addEventListener("contextmenu", function (e){
            e.preventDefault();
        }, false);

		//region 리스트 이미지
		$('.sub-thumb li button').click(function () {
			const src = $(this).find('img').attr('src')
			$(this).parent().addClass('active').siblings().removeClass('active')
			$('.main-thumb').find('img').attr('src', src);
		})

		$('.sub-thumb li:first button').click()
		//endregion


        $('input[name=coupon]').click(function () {
            const li = $(this).closest('li');
            li.toggleClass('active', this.checked)
            const data = li.data('prop')
            const ul = $(this).closest('ul');

            var currentAmt = parseInt('');

            var checked = ul.children().filter((i,v)=>$(v).hasClass('active'));

            checked = checked.map((i,v)=>$(v).data('prop')).toArray().sort((a,b)=>{
                if(a.benefitType===b.benfitType)return 0;
                if(a.benfitType==='C'&&b.benfitType==='P'){
                    return -1
                }else {
                    return 1
                }
            });

            const totalDiscountPrice = checked.reduce((a,b)=>{
                let discountPrice = 0;
                if(b.benefitType==='P'){
                    discountPrice = currentAmt * parseInt(b.benefitAmt) / 100;
                    if(discountPrice>parseInt(b.maxDiscountAmt)){
                        discountPrice = parseInt(b.maxDiscountAmt)
                    }
                    currentAmt = currentAmt-discountPrice;

                }else {
                    discountPrice = parseInt(b.benefitAmt);

                    currentAmt = currentAmt-discountPrice;
                }
                a+=discountPrice;
                return a;
            },0)
            console.log(totalDiscountPrice)
            console.log(currentAmt)
            if(currentAmt<0){
                return alert('실시간 금액보다 할인 금액이 클 수 없습니다.',()=>{
                    $(this).removeAttr('checked');
                    $(this).closest('li').removeClass('active');
                })
            }


            // region duplicateYn
            if (data.duplicateYn === 'Y') {
                if(ul.children().filter((i, v) => $(v).find('input').prop('checked')&&$(v).data('prop').duplicateYn === 'Y').length=== 0){

                    ul.children().filter((i, v) =>
                        $(v).data('prop').duplicateYn === 'N'
                    ).toggleClass('disabled',false).find('input').removeAttr('disabled')

                }else {
                    ul.children().not(li).filter((i, v) =>
                        $(v).data('prop').duplicateYn === 'N'
                    ).toggleClass('disabled', true).find('input').attr('disabled', true)
                }

            } else {
                ul.children().not(li).toggleClass('disabled', this.checked).find('input').attr('disabled', this.checked)
            }
            //	endregion
            $('.discount-price').find('em').text(formatter.format(totalDiscountPrice));



            //    region salePrice

            //    endRegion
            //    region useBtn

            //    endregion
        })
		//region 제품 담기
		$("#cartBtn").click(function () {
			if (itemType != "daily") {
				// 택배배송
				var qty = parseInt($('.box-qty').text());
				addCart("box", itemCode, {qty, eventIdx});
				return;
			}

			// 매일배송
			var input = $('input[name=r1]:checked');
			if (input.hasClass('none-package')) {
				// 배송요일 선택 시
				var checkedDay = input.next().find('input[type=checkbox]:checked');
				if (checkedDay.length === 0) {
					return alert("배송요일을 선택해주세요");
				}
				console.log(checkedDay)
				const selectedDays = checkedDay.map(function (i, x) {
					return parseInt($(x).val()) - 1;
				}).toArray();
				const dayQty = days.map(function (x, i) {
					return selectedDays.includes(i) ? 1 : 0;
				});

				addCart("daily", itemCode, {dayQty, eventIdx});
			} else {
				// 추천 패키지 선택 시
				var itemCodes = [];
				var items = {};
				input.next().find('.product-set').children().each(function (i, data) {
					var itemCode = $(data).attr('data-itemcode');
					var dayQty = items[itemCode] || [0, 0, 0, 0, 0];
					dayQty[i] += 1;
					items[itemCode] = dayQty;
					itemCodes.push(itemCode);
				});

				var orderItems = [];
				for (var key of Object.keys(items)) {
					orderItems.push({itemCode: key, qty: items[key]});
				}

				orderItems.sort(function (a, b) {
					var a1 = itemCodes.indexOf(a.itemCode);
					var b1 = itemCodes.indexOf(b.itemCode);
					return a1 > b1 ? 1 : a1 < b1 ? -1 : 0;
				})

				addCarts("daily", orderItems, eventIdx);
			}
		});
		//endregion

		//region 바로 구매
		$("#orderBtn").click(function () {
			if (itemType != "daily") {
				// 택배배송
				var args = { item: [{itemCode, qty: ($('.box-qty').text()) || "1", eventIdx: ""}] };
				location.href = "/order/box/step1?item=" + encodeURIComponent(JSON.stringify(args));
				return;
			}

			// 매일배송
			var input = $('input[name=r1]:checked');

			if (input.hasClass('none-package')) {
				// 배송요일 선택 시
				var checkedDay = input.next().find('input[type=checkbox]:checked');
				if (checkedDay.length === 0) {
					return alert("배송요일을 선택해주세요");
				}
				console.log(checkedDay)
				const selectedDays = checkedDay.map(function (i, x) {
					return parseInt($(x).val()) - 1;
				}).toArray();
				const dayQty = days.map(function (x, i) {
					return selectedDays.includes(i) ? 1 : 0;
				});

				window.orderProcess({ item: [{itemCode, dayQty}] });
			} else {
				// 추천 패키지 선택 시
				var items = {};
				var itemCodes = [];
				input.next().find('.product-set').children().each(function (i, data) {
					var itemCode = $(data).attr('data-itemcode');
					var dayQty = items[itemCode] || [0, 0, 0, 0, 0];
					dayQty[i] += 1;
					items[itemCode] = dayQty;
					itemCodes.push(itemCode);
				});

				var orderItems = [];

				for (var key of Object.keys(items)) {
					orderItems.push({itemCode: key, dayQty: items[key]});
				}

				orderItems.sort(function (a, b) {
					var a1 = itemCodes.indexOf(a.itemCode);
					var b1 = itemCodes.indexOf(b.itemCode);
					return a1 > b1 ? 1 : a1 < b1 ? -1 : 0;
				})

				window.orderProcess({ item: orderItems });
			}
		});
		//endregion
	});

// 	var data = {"feature":"\u003cdiv style\u003d\"text-align: center;\" align\u003d\"center\"\u003e\u003cimg src\u003d\"/editor/download/5463\" title\u003d\"231114_프레시스무디_크리스마스에디션_그리너지,토마토.png\" class\u003d\"180b2488-e436-4a42-8b70-8b54e3038889.png\"\u003e\u003cbr style\u003d\"clear:both;\"\u003e\u003cimg src\u003d\"/editor/download/4497\" title\u003d\"221125_프레시스무디_토마토(1140).png\" class\u003d\"a5d2ad8f-8d66-4182-b712-21e1c01e7733.png\"\u003e\u0026nbsp;\u003c/div\u003e\u003cdiv style\u003d\"text-align: center;\" align\u003d\"center\"\u003e\u0026nbsp;\u003c/div\u003e","featureMobile":"\u003cdiv style\u003d\"text-align: center;\" align\u003d\"center\"\u003e\u003cimg src\u003d\"/editor/download/5463\" title\u003d\"231114_프레시스무디_크리스마스에디션_그리너지,토마토.png\" class\u003d\"180b2488-e436-4a42-8b70-8b54e3038889.png\"\u003e\u003cbr style\u003d\"clear:both;\"\u003e\u003cimg src\u003d\"/editor/download/4497\" title\u003d\"221125_프레시스무디_토마토(1140).png\" class\u003d\"a5d2ad8f-8d66-4182-b712-21e1c01e7733.png\"\u003e\u0026nbsp;\u003c/div\u003e\u003cdiv style\u003d\"text-align: center;\" align\u003d\"center\"\u003e\u0026nbsp;\u003c/div\u003e","nutrition":"{\"foodType\":{\"label\":\"식품의 유형\",\"value\":\"상세 참조\",\"sort\":1},\"producer\":{\"label\":\"생산지 및 소재지\",\"value\":\"상세 참조\",\"sort\":2},\"expirationDate\":{\"label\":\"제조연월일/유통기한 또는 품질유지기한\",\"value\":\"상세 참조\",\"sort\":3},\"packagingCapacity\":{\"label\":\"용량\",\"value\":\"상세 참조\",\"sort\":4,\"unit\":\"ml\"},\"packagingQty\":{\"label\":\"수량\",\"value\":\"상세 참조\",\"sort\":5},\"material\":{\"label\":\"원재료 및 함량\",\"value\":\"상세 참조\",\"sort\":6},\"nutrition\":{\"label\":\"영양성분\",\"value\":\"상세 참조\",\"sort\":7},\"geneticallyModifiedFood\":{\"label\":\"유전자변형식품 여부\",\"value\":\"해당 사항 없음\",\"sort\":11},\"importedFoodYn\":{\"label\":\"수입신고여부\",\"value\":\"해당 사항 없음\",\"sort\":13},\"consumerSafety\":{\"label\":\"소비자안전을 위한 주의사항\",\"value\":\"상세 참조\",\"sort\":12},\"csCallNum\":{\"label\":\"소비자 상담번호\",\"value\":\"080-800-0393\",\"sort\":14}}","detailImage1":"/product/20231114/8303f4fa-bb4a-4a32-b969-b094180ee1c0.png","limitSize":-1,"totalCount":0,"idx":637,"goodType":"BOX","itemCode":"0073165","thumbnail":"/product/20231114/8c0582a0-3868-4901-9987-2f6f9b707a00.png","productName":"프레시스무디 토마토 과채주스 6입","readNum":"6037","capacity":"190","unit":"ml","price":"27000","isHot":"Y","interestIdx":0,"slogan":"생기있는 아침을 위한 프레시 토마토 ","freebYn":"N","freebSloganYn":"N","freebQty":1,"isIce":"Y","unitBoxQty":"6","unitBox":"병","pkgIdx":0};
// 	if (data.price) {
// 		data.price = data.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
// 	}
// 	if (data.thumbnail) {
// 		data.thumbnail = location.origin + "/file/download" + data.thumbnail;
// 	}
// 	if (data.detailImage1) {
// 		data.detailImage1 = location.origin + "/file/download" + data.detailImage1;
// 	}

// 	window.kakaoShareData = {
// 		key: 84344,
// 		data: {
// 			mobilehost: "https://mgreenjuice.pulmuone.com/",
// 			webhost: "https://greenjuice.pulmuone.com/",
// 			detailImage1: data.detailImage1,
// 			weight: "190ml X 6병",
// 			path: location.pathname,
// 			productName: data.productName,
// 			slogan: data.slogan,
// 			thumbnail: data.thumbnail,
// 			price: data.price,
// 		}
// 	};


	//    region reviewPopup
// 	$(document).on('click', '.review-item', function () {
// 		const title = $(this).find('.title').text();
// 		const content = $(this).find('.title').next().text();
// 		const thumbnail = $(this).find('.thumb img').attr('src')
// 		const nameAndDateEl = $(this).find('.span-tie')

// 		const reviewModal = $('#reviewModal')
// 		reviewModal.find('.header h4').text(title)
// 		reviewModal.find('.thumb-area img').attr('src', thumbnail)
// 		reviewModal.find('.scrollable p').text(content)
// 		reviewModal.find('.scrollable .span-tie').replaceWith(nameAndDateEl.clone())
// 	})
	//    endregion

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
							<li><a href="/product/box/boxlist.do">택배배송</a></li>
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
								<label class="best">BEST</label>
							</div>
							<span class="prd-state">냉장상품</span>
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
							<div class="buy-option"></div>
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
			${dto.content }				
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
						<form action="/box/order/step1.do" method="GET">
					        <input type="hidden" name="productsNo" value="0073561">
							<input type="hidden" name="productsCnt" value="1">
							<button id="cartBtn" class="button-fix black">장바구니</button>
							<button id="orderBtn" class="button-fix primary">바로구매</button>
						</form>


					</div>
				</div>
			</div>
		</main>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>

	</div>
</body>
</html>

