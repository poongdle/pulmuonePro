<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String path = request.getContextPath(); %>
<html lang="ko">
<head>
<title>풀무원 녹즙 | 맞춤큐레이션</title>
<meta name="description" content="하루 한 병 건강한 습관 풀무원녹즙, 신선한 채소와 과일의 영양을 매일 아침 배송합니다.">
<meta name="viewport"     content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="/resources/assets/css/curation.css">
<link rel="stylesheet" href="/resources/assets/css/content2.css">
<link rel="stylesheet" href="/resources/assets/css/a-guide.css">
<link rel="stylesheet" href="/resources/assets/css/owl.theme.default.css">
<!-- <link rel="stylesheet" href="/customer/curation_css/bootstrap.min.css"> -->
<link rel="stylesheet" href=/resources/assets/css/layout_style.css">
<link rel="stylesheet" href="/resources/assets/css/style.css">
<link rel="shortcut icon" href="/resources/assets/images/pul_favicon.png">

<script src="/resources/assets/js/fdd.js"></script>
<script src="/resources/assets/js/request.js"></script>
<script src="/resources/assets/js/clipboard.js"></script>
<script src="/resources/assets/js/design.js"></script>
<script src="/resources/assets/js/bootstrap.bundle.min.js"></script>
<script src="/resources/assets/js/owl.carousel.min.js"></script>
<script src="/resources/assets/js/jquery-2.1.4.min.js"></script>
<script src="/resources/assets/js/jquery.form.min.js"></script>

<style type="text/css">
img {
    overflow-clip-margin: content-box;
    overflow: clip;
}
</style>
</head>
<body>
<div class="wrapper">
<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
<main class="products">
<!--S:container-wrapper -->
<div id="container-wrapper" class="container-wrapper"> <!-- TODO : 회원쪽 페이지들은 <div class="container-wrapper member"> -->


<script type="text/javascript">
  var singleYn = 'N' == 'Y';
  $(function () {

    sessionStorage.removeItem('req1');
    sessionStorage.removeItem('req2');
    sessionStorage.removeItem('req3');

    function getItems(lbl) {
      var items = {};
      $("input[name='itemCode']").each(function (i, item) {
        var el = $(item);
        if (el.is(":checked") || el.is("[type='hidden']")) {
          var itemCode = el.val();
          if (singleYn) {
            items[itemCode] = [1, 1, 1, 1, 1];
          } else {
            var d = items[itemCode] || [0, 0, 0, 0, 0];
            d[i] += 1;
            items[itemCode] = d;
          }
        }
      })

      var orderItems = [];
      for (var key of Object.keys(items)) {
        orderItems.push({
          itemCode: key,
          [lbl]: items[key]
        });
      }
      return orderItems;
    }

    $('#orderBtn').click(function () {
      if (!window.is_signed) {
        alert('로그인이 필요한 서비스입니다.', function () {
          location.href = '/member/login?redirectUrl=' + encodeURIComponent(location.href);
        });
        return;
      }

      var orderItems = getItems('dayQty');
      if (orderItems.length === 0) {
        alert("상품을 선택해주세요.");
        return;
      }

      window.orderProcess({ item: orderItems });
    });

    $("#cartBtn").click(function () {
      var orderItems = getItems('qty');
      if (orderItems.length === 0) {
        alert("상품을 선택해주세요.");
        return;
      }
      addCarts("daily", orderItems);
    });

  })
</script>
<script>
  var singleYn = "N" == 'Y';
  var title = "${param.program_name}";
  var data = {
    webhost: "https://greenjuice.pulmuone.com/",
    title,
    result_path: location.pathname + location.search
  };
  $(document).ready(function () {
    $("[data-item-index]").each(function () {
      var subData = $(this).data();
      var ix = subData.itemIndex + 1;
      data["item_0" + ix + "_img"] = subData.itemImage;
      data["item_0" + ix + "_path"] = subData.itemLink;
      data["item_0" + ix + "_title"] = subData.itemTitle;
      data["item_0" + ix + "_desc"] = String(subData.itemDesc).replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";

      console.log("!!!", subData);
    });

    window.kakaoShareData = {
      key: singleYn ? 85888 : 85887,
      data
    };
  })

  function sendKakao() {
    Kakao.Share.sendCustom({
      templateId: window.kakaoShareData.key,
      templateArgs: window.kakaoShareData.data,
    });
  }
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
<textarea id="orderPosLi" style="display: none">
    <li>
        <label class="item-wrapper">
            <input name="custnum" type="radio" value="{custnumber}" data-prtn-id="{prtnId}" />
            <div class="item">
                <div class="contents">
                    <p class="name">
                        {nickname} <span style="margin-left: 0;">{custnumber}</span>
                    </p>
                </div>
            </div>
        </label>
    </li>
</textarea>

<div class="modal" id="orderModal" tabindex="-1" aria-labelledby="orderModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header" style="padding-bottom:8px;">
                <h5 class="modal-title" id="orderModalLabel">선택하세요</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                </button>
            </div>
            <div class="modal-body select-wrapper">
                <ul class="product-content-list order">

                </ul>
            </div>
            <div class="button-set">
                <button type="button" class="button-basic black" data-type="continue">
                    기존 주문에 상품 추가
                </button>
                <button type="button" class="button-basic primary" data-type="new">
                    신규 배송지로 주문
                </button>
            </div>
        </div>
    </div>
</div>

<div class="breadcrumb-style">
    <div class="container">
        <ul>
            <li><a>홈</a></li>
            <li><a class="active">맞춤큐레이션</a></li>
        </ul>
    </div>
</div>

<div class="container curation">
    
        <div class="curation-progress-bar">
            <ul>
                <li class="active"><b>01.</b>건강목표</li>
                <li class="active"><b>02.</b>식이섭취</li>
                <li class="active"><b>03.</b>생활습관</li>
            </ul>
        </div>
    
    <div class="question-part">
        <div class="title">
            
            
                <h3>
                    당신에게 추천드리는
                    
                        <b>맞춤 프로그램</b>
                    
                    
                </h3>
            
        </div>


        
            <div class="card-item">
                <div class="product-wrapper">
                    
                    
                        <p style="margin-bottom: 12px">${dto.program_name }</p>
                    
                    <ul class="product-list" id="order2">
                        
                            <li
                                    data-item-index="0"
                                    data-item-link="product/daily/738"
                                    data-item-image="https://mgreenjuice.pulmuone.com/file/download/product/20230922/201a126e-c493-4599-81fc-c9450a7bb4bb.png"
                                    data-item-title="식물성유산균 아르기닌&비타B"
                                    data-item-desc="2800">
                                <input value="0074008" name="itemCode" type="hidden"/>
                                <a class="item" data-product-preview="738">
                                    <label>월</label>
                                    <div class="thumb"><img src="/file/download//product/20230922/201a126e-c493-4599-81fc-c9450a7bb4bb.png"
                                                            onerror="this.src='/resources/images/common/no_img.png'"
                                                            alt=""></div>
                                    <div class="text-wrapper">
                                        <span>식물성유산균 아르기닌&비타B</span>
                                    </div>
                                </a>
                            </li>
                        
                            <li
                                    data-item-index="1"
                                    data-item-link="product/daily/280"
                                    data-item-image="https://mgreenjuice.pulmuone.com/file/download/product/20210923/42f32473-d37b-4ef8-8fe7-7358a4ec4bd5.jpg"
                                    data-item-title="마시는새싹 발효녹즙"
                                    data-item-desc="2400">
                                <input value="0071823" name="itemCode" type="hidden"/>
                                <a class="item" data-product-preview="280">
                                    <label>화</label>
                                    <div class="thumb"><img src="/file/download//product/20210923/42f32473-d37b-4ef8-8fe7-7358a4ec4bd5.jpg"
                                                            onerror="this.src='/resources/images/common/no_img.png'"
                                                            alt=""></div>
                                    <div class="text-wrapper">
                                        <span>마시는새싹 발효녹즙</span>
                                    </div>
                                </a>
                            </li>
                        
                            <li
                                    data-item-index="2"
                                    data-item-link="product/daily/743"
                                    data-item-image="https://mgreenjuice.pulmuone.com/file/download/product/20231101/b7323a61-8792-488b-9a32-571fe276bcea.png"
                                    data-item-title="비타맥스 엑스투"
                                    data-item-desc="3500">
                                <input value="0074095" name="itemCode" type="hidden"/>
                                <a class="item" data-product-preview="743">
                                    <label>수</label>
                                    <div class="thumb"><img src="/file/download//product/20231101/b7323a61-8792-488b-9a32-571fe276bcea.png"
                                                            onerror="this.src='/resources/images/common/no_img.png'"
                                                            alt=""></div>
                                    <div class="text-wrapper">
                                        <span>비타맥스 엑스투</span>
                                    </div>
                                </a>
                            </li>
                        
                            <li
                                    data-item-index="3"
                                    data-item-link="product/daily/316"
                                    data-item-image="https://mgreenjuice.pulmuone.com/file/download/product/20230417/0512477d-b440-4adf-9cd3-3cc9ca29ab98.png"
                                    data-item-title="식물성유산균쌀요거트"
                                    data-item-desc="2300">
                                <input value="0070445" name="itemCode" type="hidden"/>
                                <a class="item" data-product-preview="316">
                                    <label>목</label>
                                    <div class="thumb"><img src="/file/download//product/20230417/0512477d-b440-4adf-9cd3-3cc9ca29ab98.png"
                                                            onerror="this.src='/resources/images/common/no_img.png'"
                                                            alt=""></div>
                                    <div class="text-wrapper">
                                        <span>식물성유산균쌀요거트</span>
                                    </div>
                                </a>
                            </li>
                        
                            <li
                                    data-item-index="4"
                                    data-item-link="product/daily/723"
                                    data-item-image="https://mgreenjuice.pulmuone.com/file/download/product/20230102/c4e38bfb-9926-4cfc-bb92-973a4401c609.png"
                                    data-item-title="ABC플러스"
                                    data-item-desc="2800">
                                <input value="0073344" name="itemCode" type="hidden"/>
                                <a class="item" data-product-preview="723">
                                    <label>금</label>
                                    <div class="thumb"><img src="/file/download//product/20230102/c4e38bfb-9926-4cfc-bb92-973a4401c609.png"
                                                            onerror="this.src='/resources/images/common/no_img.png'"
                                                            alt=""></div>
                                    <div class="text-wrapper">
                                        <span>ABC플러스</span>
                                    </div>
                                </a>
                            </li>
                        
                    </ul>
                </div>
                <div class="button-set sm" style="margin: 20px 0px">
                    <button id="cartBtn" class="button-basic black">장바구니</button>
                    <button id="orderBtn" class="button-basic primary">주문하기</button>
                </div>
            </div>
        

        

        <div class="result-text">
            상쾌한 하루를 위해 녹즙과 발효유가 골고루 구성된 프로그램입니다. 한국인을 위한 멀티비타민&미네랄 정제와 유기농 과채한가득 녹즙을 한 번에 섭취할 수 있는 '비타맥스 엑스투'를 비롯해 풀무원의 특허받은 발효 유산균 PMO08을 넣어 프로바이오틱 100억 CFU 이상을 보장하는 '식물성유산균 아르기닌&비타B'과 '식물성유산균 쌀요거트' 등을 골고루 만나 볼 수 있어요.
        </div>
        

        
            <div class="alert-area">
                <h4>생활습관 바꾸기</h4>
                <ul>
                    
                    <li data-type="bmi">근육 위주로 체중을 늘려 정상체중이 되도록 영양균형 식사와 규칙적인 운동을 실천합니다.</li>
                    
                    
                        
                            <li>대표적인 건강 위험 요인인 흡연! 자신과 사랑하는 사람들을 위해 금연을 시작합니다.</li>
                        
                    
                        
                    
                </ul>
            </div>
            <div class="button-set">
                
                    <button class="button-basic border bottle prefix"
                            onclick="location.href='/customer/product/result/2?singleYn=Y&bmi=0&questions=7,11,13,14,20'">
                        <i class="ico"></i>
                        내게 맞는 상품 추천
                    </button>
                
                
                <button class="button-basic kakao prefix" onclick="javascript:sendKakao()">
                    <i class="ico"></i>
                    카카오톡으로 공유
                </button>
            </div>
        

    </div>
</div>



<script>
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
<div style="display: none" id="mini-side-nav">
	<a href="/mypage/drink/drink"><img src="/resources/assets/images/quick1.png" alt=""></a>
	<a id="quickChangeDrink" href="/mypage/drink/drink"><img src="/resources/assets/images/quick2.png" alt=""></a>
	<a id="quickChangeSchedule" href="/mypage/drink/drink"><img src="/resources/assets/images/quick3.png" alt=""></a>
	<a href="/mypage/drink/bill"><img src="/resources/assets/images/quick4.png" alt=""></a>
	<a href="#"><img src="/resources/assets/images/quickTop.png" alt=""></a>
</div>
</main>
<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
</div>
</body>
</html>