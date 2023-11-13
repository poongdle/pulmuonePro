<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<title>풀무원 녹즙 | 맞춤큐레이션</title>
<meta name="description" content="하루 한 병 건강한 습관 풀무원녹즙, 신선한 채소와 과일의 영양을 매일 아침 배송합니다.">
<meta name="viewport"     content="width=device-width,initial-scale=1.0">
<script src="/resources/assets/js/jquery-2.1.4.min.js"></script>
<script src="/resources/assets/js/fdd.js"></script>
<link rel="stylesheet" href="/resources/assets/css/curation.css">
<link rel="stylesheet" href="/resources/assets/css/contents2.css">
<link rel="stylesheet" href="/resources/assets/css/bootstrap-fdd.css">
<link rel="stylesheet" href="/resources/assets/css/a-guide.css">
<link rel="stylesheet" href="/resources/assets/css/owl.theme.default.css">
<link rel="stylesheet" href="/resources/assets/css/owl.carousel.min.css">
<!-- <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="/resources/assets/css/layout_style.css">
<link rel="shortcut icon" href="/resources/assets/images/pul_favicon.png">

<script src="/resources/assets/js/fdd.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js" ></script>
<script src="/resources/assets/js/bootstrap.bundle.min.js"></script>
<script src="/resources/assets/js/request.js"></script>
<script src="/resources/assets/js/clipboard.min.js"></script>
<script src="/resources/assets/js/owl.carousel.min.js"></script>
<script src="/resources/assets/js/jquery.form.min.js"></script>
<link rel="stylesheet" href="/resources/assets/css/daterangepicker.css">

<link rel="stylesheet" href="/resources/assets/css/style.css">

</head>
<body>
<div class="wrapper">
<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
<main class="kids">

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
  var title = "키즈";
  var data = {
    mobilehost: "https://mgreenjuice.pulmuone.com/",
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

//       console.log("!!!", subData);
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

<div class="breadcrumb-style">
    <div class="container">
        <ul>
            <li><a>홈</a></li>
            <li><a class="active">맞춤큐레이션</a></li>
        </ul>
    </div>
</div>

<div class="container curation">
    
    <div class="question-part">
        <div class="title">
            <h3> 당신에게 추천드리는
                    <b>녹즙 프로그램</b>
            </h3>
       </div>
       
  <div class="card-item">
       <div class="product-wrapper">
            <p style="margin-bottom: 12px">키즈</p>
               <ul class="product-list" id="order2">
                    <c:forEach var="dto" items="${list}">
                        <li data-item-index="0" data-item-link="product/daily/430" data-item-image="https://mgreenjuice.pulmuone.com/file/download/product/20210923/ecc8e6be-08ba-42a0-a9f9-a620944fe11d.jpg" 
                            data-item-title="${dto.products_name }" data-item-desc="2000">
                         <input value="${dto.products_no }" name="itemCode" type="hidden">
                            <a class="item" data-product-preview="430">
                              <label>${dto.dayweek }</label>
                               <div class="thumb"><img src="/resources/assets/images/${dto.system_name }" onerror="this.src='/resources/images/common/no_img.png'" alt=""></div>
                                <div class="text-wrapper">  <span>${dto.products_name }</span></div>
                            </a>
                        </li>                            
                  </c:forEach> 
              </ul>
      </div>
 <div class="button-set sm" style="margin: 20px 0px">
         <button id="cartBtn" class="button-basic black">장바구니</button>
         <button id="orderBtn" class="button-basic primary">주문하기</button>
</div>
 </div>

<div class="result-text">
   ${list[0].program_content }
</div>

<div class="button-set">
       <button class="button-basic kakao prefix" onclick="javascript:sendKakao()">
       <i class="ico"></i>
       카카오톡으로 공유
       </button>
</div>
   
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
<div style="display: none;" id="mini-side-nav">
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