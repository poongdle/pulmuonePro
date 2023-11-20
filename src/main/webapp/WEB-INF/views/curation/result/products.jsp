<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/WEB-INF/views/layouts/head.jsp"%>
<body>

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
            location.href = '/member/login.do?redirectUrl=' + encodeURIComponent(location.href);
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
var title = "${dto.products_name}";
var data = {
		mobilehost: "http://localhost",
		webhost: "http://localhost/",
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

	<script type="text/javascript">
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
            location.href = "/daily/order/step1.do?item=" + encodeURIComponent(JSON.stringify(args2));
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
          location.href = "/order/daily/step1.do?item=" + encodeURIComponent(JSON.stringify(args));
        }
      });
    }
  });

}
$(document).on("click", "#orderModal button", function (e) {
  var type = $(this).attr("data-type");
  var p = encodeURIComponent(JSON.stringify(nowArgs));;
  if (type === "new") {
    location.href = "/order/daily/step1.do?item=" + p
  } else if (type === "continue") {
    var c = $("input[name='custnum']:checked");
    var custNumber = c.val();
    var prtnId = c.attr("data-prtn-id");
    location.href = "/mypage/drink/drink/change/" + custNumber + "/" + prtnId + "?item=" + p;
  }
})
</script>

	<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
	<main class="products">
		<!--S:container-wrapper -->
		<div id="container-wrapper" class="container-wrapper">
			<!-- TODO : 회원쪽 페이지들은 <div class="container-wrapper member"> -->


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
							당신에게 추천드리는 <b>맞춤 상품</b>
						</h3>
					</div>

					<%
					int[] no = { 1, 2, 3, 4, 5, 6, 7, 8 };
					%>
					<div class="card-item">
						<c:set value="<%=new int[] { 1, 2, 3, 4, 5, 6, 7, 8 }%>" var="arr"></c:set>
						<div class="product-wrapper">
							<c:forEach var="n" items="arr">
								<p>${list[0].program_name }</p>
							</c:forEach>
							<c:forEach var="dto" items="${list}">
								<div class="product-radio-group">
									<label data-item-index="0" data-item-link="/"
										data-item-image="/file/download/product/${dto.img_no}"
										data-item-title="${dto.products_name }" data-item-desc="2100">
										<input value="${dto.products_no }" name="itemCode"
										type="checkbox" />
										<div class="check-display"></div>
										<div class="thumb" data-product-preview="${dto.img_no}">
											<img src="/file/download/product/${dto.system_name }" alt="">
										</div>
										<p data-product-preview="278">${dto.products_name }</p>
									</label>
								</div>
							</c:forEach>
						</div>
					</div>

					<div class="button-set sm" style="margin: 20px 0px">
							<button id="cartBtn" class="button-basic black">장바구니</button>
							<form action="/daily/order/step1.do" method="GET">
								<c:forEach var="dto" items="${list }">
									<input type="hidden" name="item"
										value='{"item":[{"itemCode":"${dto.products_no}","dayQty":[1,1,1,1,1]}]'>
								</c:forEach>
								<button id="orderBtn" class="button-basic primary">주문하기</button>
							</form>
						</div>
					</div>

					<div class="result-text">${list[0].program_content }</div>
					<div class="alert-area">
						<h4>생활습관 바꾸기</h4>
						<ul>
							<li data-type="bmi">${list[0].lifestyle_change01 }</li>
							<li>대표적인 건강 위험 요인인 흡연! 자신과 사랑하는 사람들을 위해 금연을 시작합니다.</li>
						</ul>
					</div>
					<div class="button-set">
						'
						<button class="button-basic border bottles prefix"
							onclick="location.href='/customer/product/result/programs.do?singleYn=N'">
							<i class="ico"></i> <i class="ico"></i> 내게 맞는 프로그램 추천
						</button>

						<button class="button-basic kakao prefix"
							onclick="javascript:sendKakao()">
							<i class="ico"></i> 카카오톡으로 공유
						</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal show" id="productPreviewModal" tabindex="-1"
			style="display: none; padding-right: 17px;" aria-modal="true"
			role="dialog">
			<div class="modal-dialog modal-dialog-centered" style="width: 430px;">
				<div class="modal-content modal-product">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close"></button>
						<div class="thumb-normal">

							<c:forEach var="dto" items="${list }">
								<img src="/file/download/product/${dto.system_name }">
							</c:forEach>


						</div>
					</div>
					<div class="modal-body">
						<div class="info-area">
							<c:forEach var="dto" items="${list }">
								<h2>${dto.products_name }</h2>
								<p>${dto.products_sub_name }</p>
								<div class="product-addiction" style="border-bottom: none">
									<div class="price-item">

										<p>${dto.price }<span>원</span>
										</p>
										<span>(${dto.products_size })</span>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="button-set">
							<c:forEach var="dto" items="${list }">
								<a href="${dto.products_tag }" class="button-basic primary">상세보기</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>

	</main>
	<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>
	<%@ include file="/WEB-INF/views/ui/footermodal.jsp"%>
	<%@ include file="/WEB-INF/views/ui/cartmodal.jsp"%>
	<%@ include file="/WEB-INF/views/ui/wishmodal.jsp"%>
</body>
</html>