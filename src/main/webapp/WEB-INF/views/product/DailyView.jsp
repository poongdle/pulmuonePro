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
<link rel="stylesheet"
	href="/resources/assets/css/owl.theme.default.css">
<script src="/resources/assets/js/owl.carousel.min.js"></script>
<link rel="stylesheet" href="/resources/assets/css/proview.css">
<link rel="stylesheet" href="/resources/assets/css/list.css">
</head>
<body>
	<script>
	var formatter = new Intl.NumberFormat();
	var days = ["A", "B", "C", "D", "E"];
	var itemType = "daily";
	var itemCode = "${dto.products_no}";
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

	var data = {"feature":"\u003cp\u003e\u003cimg src\u003d\"/editor/download/5403\" title\u003d\"비타맥스엑스투(1140).png\" class\u003d\"8d4e7339-2e48-4c36-9cd8-6fe8e5bab379.png\"\u003e\u003cbr style\u003d\"clear:both;\"\u003e\u0026nbsp;\u003c/p\u003e\u003cp\u003e\u003cspan style\u003d\"font-size: 18.6667px;\"\u003e\u003cb\u003e\r\n\r\n\u003c/b\u003e\u003c/span\u003e\u003c/p\u003e\u003cdiv style\u003d\"text-align: center;\" align\u003d\"center\"\u003e\u003cb\u003e\u003cb style\u003d\"font-size: 16px;\"\u003e\u003cb style\u003d\"text-indent: 0in; font-size: 12px;\"\u003e\u003cspan style\u003d\"font-size: 36pt;\"\u003e\u003cbr\u003e\u003c/span\u003e\u003c/b\u003e\u003c/b\u003e\u003c/b\u003e\u003c/div\u003e\u003cdiv style\u003d\"text-align: center;\" align\u003d\"center\"\u003e\u003cb\u003e\u003cb style\u003d\"font-size: 16px;\"\u003e\u003cb style\u003d\"text-indent: 0in; font-size: 12px;\"\u003e\u003cspan style\u003d\"font-size: 36pt;\"\u003e제품 구성\u003c/span\u003e\u003c/b\u003e\u003c/b\u003e\u003cb style\u003d\"font-size: 16px;\"\u003e\u003cb style\u003d\"text-indent: 0in; font-size: 12px;\"\u003e\u003cspan style\u003d\"font-size: 36pt;\"\u003e\u0026nbsp;\u003c/span\u003e\u003c/b\u003e\u003c/b\u003e\u003c/b\u003e\u003c/div\u003e\u003cdiv style\u003d\"text-align: center;\" align\u003d\"center\"\u003e\u003cb\u003e\u003cb style\u003d\"font-size: 16px;\"\u003e\u003cb style\u003d\"text-indent: 0in; font-size: 12px;\"\u003e\u003cspan style\u003d\"font-size: 36pt;\"\u003e\u003cimg src\u003d\"/editor/download/5404\" title\u003d\"비타맥스엑스투.png\" class\u003d\"51c56f1d-2b05-4243-8951-89256480522f.png\"\u003e\u003c/span\u003e\u003c/b\u003e\u003c/b\u003e\u003c/b\u003e\u003c/div\u003e\u003cdiv style\u003d\"text-align: center;\" align\u003d\"center\"\u003e\u003cb\u003e\u003cb style\u003d\"font-size: 16px;\"\u003e\u003cb style\u003d\"text-indent: 0in; font-size: 12px;\"\u003e\u003cspan style\u003d\"font-size: 36pt; color: rgb(0, 0, 0);\"\u003e제품 정보 및 주의사항\u003c/span\u003e\u003c/b\u003e\u003c/b\u003e\u003c/b\u003e\u003c/div\u003e\u003cdiv style\u003d\"text-align: center;\" align\u003d\"center\"\u003e\u003cb\u003e\u003cb style\u003d\"font-size: 16px;\"\u003e\u003cb style\u003d\"text-indent: 0in; font-size: 12px;\"\u003e\u003cspan style\u003d\"font-size: 36pt;\"\u003e\u003cimg src\u003d\"/editor/download/5405\" title\u003d\"비타맥스엑스투.png\" class\u003d\"c424f176-361e-43f5-acee-1c4c59623bdb.png\"\u003e\u003c/span\u003e\u003c/b\u003e\u003c/b\u003e\u003c/b\u003e\u003c/div\u003e","featureMobile":"\u003cp\u003e\u003cimg src\u003d\"/editor/download/5403\" title\u003d\"비타맥스엑스투(1140).png\" class\u003d\"8d4e7339-2e48-4c36-9cd8-6fe8e5bab379.png\"\u003e\u003cbr style\u003d\"clear:both;\"\u003e\u0026nbsp;\u003c/p\u003e\u003cp\u003e\u003cspan style\u003d\"font-size: 18.6667px;\"\u003e\u003cb\u003e\r\n\r\n\u003c/b\u003e\u003c/span\u003e\u003c/p\u003e\u003cdiv style\u003d\"text-align: center;\" align\u003d\"center\"\u003e\u003cb\u003e\u003cb style\u003d\"font-size: 16px;\"\u003e\u003cb style\u003d\"text-indent: 0in; font-size: 12px;\"\u003e\u003cspan style\u003d\"font-size: 36pt;\"\u003e\u003cbr\u003e\u003c/span\u003e\u003c/b\u003e\u003c/b\u003e\u003c/b\u003e\u003c/div\u003e\u003cdiv style\u003d\"text-align: center;\" align\u003d\"center\"\u003e\u003cb\u003e\u003cb style\u003d\"font-size: 16px;\"\u003e\u003cb style\u003d\"text-indent: 0in; font-size: 12px;\"\u003e\u003cspan style\u003d\"font-size: 36pt;\"\u003e제품 구성\u003c/span\u003e\u003c/b\u003e\u003c/b\u003e\u003cb style\u003d\"font-size: 16px;\"\u003e\u003cb style\u003d\"text-indent: 0in; font-size: 12px;\"\u003e\u003cspan style\u003d\"font-size: 36pt;\"\u003e\u0026nbsp;\u003c/span\u003e\u003c/b\u003e\u003c/b\u003e\u003c/b\u003e\u003c/div\u003e\u003cdiv style\u003d\"text-align: center;\" align\u003d\"center\"\u003e\u003cb\u003e\u003cb style\u003d\"font-size: 16px;\"\u003e\u003cb style\u003d\"text-indent: 0in; font-size: 12px;\"\u003e\u003cspan style\u003d\"font-size: 36pt;\"\u003e\u003cimg src\u003d\"/editor/download/5404\" title\u003d\"비타맥스엑스투.png\" class\u003d\"51c56f1d-2b05-4243-8951-89256480522f.png\"\u003e\u003c/span\u003e\u003c/b\u003e\u003c/b\u003e\u003c/b\u003e\u003c/div\u003e\u003cdiv style\u003d\"text-align: center;\" align\u003d\"center\"\u003e\u003cb\u003e\u003cb style\u003d\"font-size: 16px;\"\u003e\u003cb style\u003d\"text-indent: 0in; font-size: 12px;\"\u003e\u003cspan style\u003d\"font-size: 36pt; color: rgb(0, 0, 0);\"\u003e제품 정보 및 주의사항\u003c/span\u003e\u003c/b\u003e\u003c/b\u003e\u003c/b\u003e\u003c/div\u003e\u003cdiv style\u003d\"text-align: center;\" align\u003d\"center\"\u003e\u003cb\u003e\u003cb style\u003d\"font-size: 16px;\"\u003e\u003cb style\u003d\"text-indent: 0in; font-size: 12px;\"\u003e\u003cspan style\u003d\"font-size: 36pt;\"\u003e\u003cimg src\u003d\"/editor/download/5405\" title\u003d\"비타맥스엑스투.png\" class\u003d\"c424f176-361e-43f5-acee-1c4c59623bdb.png\"\u003e\u003c/span\u003e\u003c/b\u003e\u003c/b\u003e\u003c/b\u003e\u003c/div\u003e","nutrition":"{\"foodType\":{\"label\":\"식품의 유형\",\"value\":\"상세 참조\",\"sort\":1},\"producer\":{\"label\":\"제조업소의 명칭과 소재지\",\"value\":\"상세 참조\",\"sort\":2},\"expirationDate\":{\"label\":\"제조연월일/유통기한\",\"value\":\"상세 참조\",\"sort\":3},\"packagingCapacity\":{\"label\":\"용량\",\"value\":\"상세 참조\",\"sort\":4,\"unit\":\"ml\"},\"packagingQty\":{\"label\":\"수량\",\"value\":\"상세 참조\",\"sort\":5},\"material\":{\"label\":\"원재료 및 함량\",\"value\":\"상세 참조\",\"sort\":6},\"nutrition\":{\"label\":\"영양정보\",\"value\":\"상세 참조\",\"sort\":7},\"nutritionFeature\":{\"label\":\"영양정보\",\"value\":\"상세 참조\",\"sort\":8},\"intakeType\":{\"label\":\"섭취량,섭취방법 및 섭취시 주의사항 및 부작용 가능성\",\"value\":\"상세 참조\",\"sort\":9},\"preventiveMedicine\":{\"label\":\"질병의 예방 및 치료를 위한 의약품이 아니라는 내용의 표현\",\"value\":\"해당 사항 없음\",\"sort\":9},\"geneticallyModifiedFood\":{\"label\":\"유전자변형건강기능식품에 해당하는 경우의 표시\",\"value\":\"해당 사항 없음\",\"sort\":11},\"importedFoodYn\":{\"label\":\"수입신고여부\",\"value\":\"해당 사항 없음\",\"sort\":13},\"consumerSafety\":{\"label\":\"소비자안전을 위한 주의사항\",\"value\":\"상세 참조\",\"sort\":12},\"csCallNum\":{\"label\":\"소비자 상담번호\",\"value\":\"080-800-0393\",\"sort\":14}}","detailImage1":"/product/20231101/d13025a6-2fe5-40d6-9d25-90c06e7bde0c.png","limitSize":-1,"totalCount":0,"idx":743,"goodType":"DAILY","itemCode":"0074095","thumbnail":"/product/20231101/b7323a61-8792-488b-9a32-571fe276bcea.png","productName":"비타맥스 엑스투","readNum":"1180","capacity":"137","unit":"g","price":"3500","isNew":"Y","interestIdx":0,"slogan":"한국인을 위한 멀티비타민\u0026미네랄 정제와 유기농 과채한가득 녹즙을 한 번에","freebYn":"Y","freebSloganYn":"N","freebQty":1,"isIce":"Y","unitBox":"포","pkgIdx":0};
	if (data.price) {
		data.price = data.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	if (data.thumbnail) {
		data.thumbnail = location.origin + "/file/download" + data.thumbnail;
	}
	if (data.detailImage1) {
		data.detailImage1 = location.origin + "/file/download" + data.detailImage1;
	}

	window.kakaoShareData = {
		key: 84344,
		data: {
			mobilehost: "https://mgreenjuice.pulmuone.com/",
			webhost: "https://greenjuice.pulmuone.com/",
			detailImage1: data.detailImage1,
			weight: "137g",
			path: location.pathname,
			productName: data.productName,
			slogan: data.slogan,
			thumbnail: data.thumbnail,
			price: data.price,
		}
	};


	//    region reviewPopup
	$(document).on('click', '.review-item', function () {
		const title = $(this).find('.title').text();
		const content = $(this).find('.title').next().text();
		const thumbnail = $(this).find('.thumb img').attr('src')
		const nameAndDateEl = $(this).find('.span-tie')

		const reviewModal = $('#reviewModal')
		reviewModal.find('.header h4').text(title)
		reviewModal.find('.thumb-area img').attr('src', thumbnail)
		reviewModal.find('.scrollable p').text(content)
		reviewModal.find('.scrollable .span-tie').replaceWith(nameAndDateEl.clone())
	})
	//    endregion

</script>
	<script type="text/javascript">
	var itemType = "daily";
	var formatter = new Intl.NumberFormat();
	var limitSize = parseInt("-1" || "-1", 10);

	function calculateBoxPrice() {
		const qty = $('.box-qty').text()
		const price = '3500'
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
                    const price = '3500'
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
                const price = '3500'
                $("#totalPrice b").text(formatter.format(cnt * price * 4));
            }
        })    
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
							<div class="buy-option">
								<div class="option-selector">
									<h5>배송요일</h5>
									<div class="select-week" style="margin-bottom: 34px;">
										<label class="radio-item check-list-form"> <input
											name="r1" class="none-package" type="radio">
											<div class="item">
												<ul class="check-list">
													<li><label class="week-item"> <input name="c1"
															value="1" type="checkbox"> <span>월</span>
													</label></li>
													<li><label class="week-item"> <input name="c1"
															value="2" type="checkbox"> <span>화</span>
													</label></li>
													<li><label class="week-item"> <input name="c1"
															value="3" type="checkbox"> <span>수</span>
													</label></li>
													<li><label class="week-item"> <input name="c1"
															value="4" type="checkbox"> <span>목</span>
													</label></li>
													<li><label class="week-item"> <input name="c1"
															value="5" type="checkbox"> <span>금</span>
													</label></li>
												</ul>
												<p>배송을 원하는 날짜를 선택하세요</p>
											</div>
										</label>
									</div>
									<h5>추천패키지 상품</h5>
									<div class="select-package">
										<label class="radio-item package-item item-of-0"> <input
											data-total-price="20600" name="r1" type="radio">
											<div class="item">
												<h6>추천패키지 1</h6>
												<div class="product-set">
													<button data-itemcode="0071928" data-product-preview="307"
														type="button" class="product-item">
														<span>월</span>
														<div class="thumb">
															<img
																src="/file/download/product/20200319/6c0a390a-2fa7-49b7-9ec3-138d7afbe665.jpg"
																alt="">

														</div>
														<div class="txt">
															<p>산이내린녹용과삼의힘</p>
														</div>
													</button>
													<button data-itemcode="0070604" data-product-preview="277"
														type="button" class="product-item">
														<span>화</span>
														<div class="thumb">
															<img
																src="/file/download/product/20210923/83dc1b40-d2da-4fba-9853-0bef12bc65f7.jpg"
																alt="">

														</div>
														<div class="txt">
															<p>돌미나리와민들레</p>
														</div>
													</button>
													<button data-itemcode="0071928" data-product-preview="307"
														type="button" class="product-item">
														<span>수</span>
														<div class="thumb">
															<img
																src="/file/download/product/20200319/6c0a390a-2fa7-49b7-9ec3-138d7afbe665.jpg"
																alt="">

														</div>
														<div class="txt">
															<p>산이내린녹용과삼의힘</p>
														</div>
													</button>
													<button data-itemcode="0070604" data-product-preview="277"
														type="button" class="product-item">
														<span>목</span>
														<div class="thumb">
															<img
																src="/file/download/product/20210923/83dc1b40-d2da-4fba-9853-0bef12bc65f7.jpg"
																alt="">

														</div>
														<div class="txt">
															<p>돌미나리와민들레</p>
														</div>
													</button>
													<button data-itemcode="0071928" data-product-preview="307"
														type="button" class="product-item">
														<span>금</span>
														<div class="thumb">
															<img
																src="/file/download/product/20200319/6c0a390a-2fa7-49b7-9ec3-138d7afbe665.jpg"
																alt="">

														</div>
														<div class="txt">
															<p>산이내린녹용과삼의힘</p>
														</div>
													</button>

												</div>
											</div>
										</label> <label class="radio-item package-item item-of-1"> <input
											data-total-price="20400" name="r1" type="radio">
											<div class="item">
												<h6>추천패키지 2</h6>
												<div class="product-set">
													<button data-itemcode="0071928" data-product-preview="307"
														type="button" class="product-item">
														<span>월</span>
														<div class="thumb">
															<img
																src="/file/download/product/20200319/6c0a390a-2fa7-49b7-9ec3-138d7afbe665.jpg"
																alt="">
														</div>
														<div class="txt">
															<p>산이내린녹용과삼의힘</p>
														</div>
													</button>
													<button data-itemcode="0072348" data-product-preview="273"
														type="button" class="product-item">
														<span>화</span>
														<div class="thumb">
															<img
																src="/file/download/product/20210923/a5e4ffc9-e98f-49a2-9371-2f2b9952dd9c.jpg"
																alt="">
														</div>
														<div class="txt">
															<p>오! 생즙</p>
														</div>
													</button>
													<button data-itemcode="0071928" data-product-preview="307"
														type="button" class="product-item">
														<span>수</span>
														<div class="thumb">
															<img
																src="/file/download/product/20200319/6c0a390a-2fa7-49b7-9ec3-138d7afbe665.jpg"
																alt="">

														</div>
														<div class="txt">
															<p>산이내린녹용과삼의힘</p>
														</div>
													</button>
													<button data-itemcode="0072348" data-product-preview="273"
														type="button" class="product-item">
														<span>목</span>
														<div class="thumb">
															<img
																src="/file/download/product/20210923/a5e4ffc9-e98f-49a2-9371-2f2b9952dd9c.jpg"
																alt="">

														</div>
														<div class="txt">
															<p>오! 생즙</p>
														</div>
													</button>
													<button data-itemcode="0071928" data-product-preview="307"
														type="button" class="product-item">
														<span>금</span>
														<div class="thumb">

															<img
																src="/file/download/product/20200319/6c0a390a-2fa7-49b7-9ec3-138d7afbe665.jpg"
																alt="">
														</div>
														<div class="txt">
															<p>산이내린녹용과삼의힘</p>
														</div>
													</button>

												</div>
											</div>
										</label>
										<div class="button-set b0">
											<button style="width: 100%;"
												class="button-basic border package-more">더보기</button>
										</div>

									</div>
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
			${dto.content }
<!-- 				<div role="tabpanel" class="tab-pane" id="info"> -->
<!-- 					<div class="container"> -->
<!-- 						<div class="product-spec"> -->
<!-- 							<ul> -->
<!-- 								<li><label>식품의 유형</label> -->
<!-- 									<p>상세 참조</p></li> -->

<!-- 								<li><label>제조업소의 명칭과 소재지</label> -->
<!-- 									<p>상세 참조</p></li> -->

<!-- 								<li><label>제조연월일/유통기한</label> -->
<!-- 									<p>상세 참조</p></li> -->

<!-- 								<li><label>용량</label> -->
<!-- 									<p>상세 참조</p></li> -->

<!-- 								<li><label>수량</label> -->
<!-- 									<p>상세 참조</p></li> -->

<!-- 								<li><label>원재료 및 함량</label> -->
<!-- 									<p>상세 참조</p></li> -->

<!-- 								<li><label>영양정보</label> -->
<!-- 									<p>상세 참조</p></li> -->

<!-- 								<li><label>영양정보</label> -->
<!-- 									<p>상세 참조</p></li> -->

<!-- 								<li><label>섭취량,섭취방법 및 섭취시 주의사항 및 부작용 가능성</label> -->
<!-- 									<p>상세 참조</p></li> -->

<!-- 								<li><label>질병의 예방 및 치료를 위한 의약품이 아니라는 내용의 표현</label> -->
<!-- 									<p>해당 사항 없음</p></li> -->

<!-- 								<li><label>유전자변형건강기능식품에 해당하는 경우의 표시</label> -->
<!-- 									<p>해당 사항 없음</p></li> -->

<!-- 								<li><label>수입신고여부</label> -->
<!-- 									<p>해당 사항 없음</p></li> -->

<!-- 								<li><label>소비자안전을 위한 주의사항</label> -->
<!-- 									<p>상세 참조</p></li> -->

<!-- 								<li><label>소비자 상담번호</label> -->
<!-- 									<p>080-800-0393</p></li> -->

<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
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

