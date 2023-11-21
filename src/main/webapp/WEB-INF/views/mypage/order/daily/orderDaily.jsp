<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="servlets.mypage.dto.BoxOrderListDTO"%>
<%@page import="servlets.order.domain.BoxOrderProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<div id="container-wrapper" class="container-wrapper">
			
<script type="text/javascript" src="/resources/assets/js/externalShop.js"></script>
<script type="text/javascript" src="/resources/assets/js/message.js"></script>

<script>
	$(document).ready(function () {
		if (location.search.indexOf("with=01") >= 0) {
			history.replaceState('', null, location.pathname);
			alert("정기주문시 이용할 수 있는 서비스입니다.");
		}
	});

	window.pagableRender = function (parent) {
		$(parent).find("[data-parse-paymethod]").each(function (i, item) {
            var el = $(item);
            var phiCustomerVo = JSON.parse(el.prev().text());
            var info = JSON.parse(el.prev().prev().text());
			console.log(info)
			console.log(phiCustomerVo)


            var isExternal = isExternalShop(phiCustomerVo.acqrSourc)
            console.log(123)
            console.log(phiCustomerVo.rceitKndCd)
            var payMethod = phiCustomerVo.rceitKnd ||'';
            if((!info&&!isExternal)||info.hasHp){
                if (phiCustomerVo.rceitKndCd === '50') {
                    payMethod = '계좌 자동이체'
                    if (phiCustomerVo.bankName) payMethod += '(' + phiCustomerVo.bankName + ')'
                }
                else if (phiCustomerVo.rceitKndCd === '60') {
                    payMethod = '카드 자동결제'
                    if (phiCustomerVo.cardName) payMethod += '(' + phiCustomerVo.cardName + ')'
                }
                else if (phiCustomerVo.rceitKndCd === '10' ||!phiCustomerVo.rceitKndCd ||!phiCustomerVo.rceitKndCd.trim()) {
                    payMethod = '현장결제'
                }else {
                    payMethod = phiCustomerVo.rceitKndCd
                }

            }
            if(info&&info.isComplex){
                payMethod += '<br>'
            }
            if ((info&&info.hasExternal)||isExternal) {
                payMethod += '선결제'
            }
            el.html(payMethod);
		})
	}

	//    주문취소
	$(document).on('click', '.cancelOrder', function () {
		var data = $(this).parents("form").serializeObject();
		let telNo = data.telNo;
		telNo = telNo.replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/, "$1-$2-$3").replace("--", "-");
		const phoneNo = data.phoneNo;
		const prtnNm = data.prtnNm;

		confirmDesign("", "주문을 취소하시겠습니까?", function () {
			post({
				url: '/order/cancel/' + data.custNumber + '/' + data.orderNumber,
				param: {
					telNo,
					phoneNo,
					prtnNm
				}
			}, function (response) {
				alert(response.RESULT_MSG, function () {
					location.href = "/mypage/drink/drink"
				});
			})
		});
	})

	$(function () {
        //region search filter
        $('.dropdown-item').click(function () {
            const value = $(this).data('value');
            $('input[name=drinkingType]').val(value)
            movePage(0);

			// $('#searchText').val(value)
			// $('#searchText').text(value =='N'?'음용중지':'음용중')
        })

        $('#searchText').text("음용중")
        //기본설정
        $(document).on('click', '.set-default', function () {
            const nicknameWrap = $(this).closest('.item').find('.nickname-format');
            const nickname = nicknameWrap.find('h5').text()
            const custNum = nicknameWrap.find('span').text();
            confirmDesign('',`${nickname}(${custNum})을 기본 고객번호로 설정하시겠습니까?`,()=> {
                post({
                    url: "/mypage/drink/drink/default/change/"
                        + custNum,
                    param: {}
                }, function (response) {
                });
            })
        })

        //    endregion

        //    region register customer
        $('#register').click(function () {

            const phoneNumber = $('#phoneNumber').val();
            const custNumber = $('#custNumber').val();
            const nickname = $('#nickname').val();
            post({
                url: '/mypage/drink/customer/direct-regist',
                param: $.param({phoneNumber, custNumber, nickname})
            }, function (response) {
                if (response.RESULT_MSG) {
                    $("#phoneNumber").val("");
                    $("#custNumber").val("");
                    $("#nickname").val("");
                    $("input:checkbox[id='registAgree']").prop("checked", false);
                    confirmDesign('',"고객번호가 등록되었습니다.",()=> {
                        const data = response.RESULT_MSG;
                        return location.href = `/mypage/drink/drinks/${data.custNumber}/${data.prtnId}`;
                        // return location.reload()
                    })
                    ;
                    $('#numberModal').modal('hide');
                } else {
                    alert(message.customer.custNumber.notFind);
                }
            }, function (failResponse) {
                alert(failResponse.RESULT_MSG);
            });
        })
        //    endregion
    })
</script>

			<div class="breadcrumb-style">
				<div class="container">
					<ul>
						<li><a href="/">홈</a></li>
						<li><a href="/mypage">MY녹즙</a></li>
						<li><a class="" href="/mypage/drink/drink">매일배송 음용내역</a></li>
						<li><a class="active" href="/mypage/drink/drink">음용내역</a></li>
					</ul>
				</div>
			</div>			
			
				<div class="container aside-layout" style="padding-bottom:120px; ">
	
					<%@ include file="/WEB-INF/views/layouts/mypage/aside.jsp" %>

	<div class="container">
		
			<div id="container-wrapper" class="container-wrapper">


<div class="container aside-layout" style="padding-bottom:120px; ">
	


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

	<div class="container">
		<div class="border-wrapper">
			<h2 class="container-title">
				음용내역
			</h2>
		</div>
		<form id="searchForm">
			<input name="drinkingType" type="hidden" value="Y">

			<div class="page-addiction-wrapper">
				<div class="info-copy"></div>
				<div class="form-input select" style="width:348px;">
					<dl>
						<dt style="padding-left:20px;">
							<label>음용고객번호</label>
						</dt>
						<dd>

							<div class="dropdown">
								<a id="searchText" class="btn dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">음용중</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" data-value="Y" href="javascript:void(0)">음용중</a>
									<a class="dropdown-item" data-value="N" href="javascript:void(0)">음용중지</a>
								</div>
							</div>
						</dd>
					</dl>
				</div>
			</div>
		</form>

		
		
			<div class="drinking-list" data-list-object="append" id="drink-items">
				
					<form class="item">
						<input type="hidden" name="custNumber" value="230000234094">
						<input type="hidden" name="orderNumber" value="18369285571027001056">

						<input type="hidden" name="prtnNm" value="서초홈가맹점">
						<input type="hidden" name="phoneNo" value="01038994569">
						<input type="hidden" name="telNo" value="025470519">
						<div class="head">
							
								<div class="nickname-format xxl">

									
										<label>기본</label>
									
									<h5>음용1</h5>
									<span>230000234094</span>
								</div>
							

							

							<ul class="info">

								<li>
									<label>담당가맹점</label>
									<p>서초홈가맹점</p>
								</li>
								<li>
									<label>음용시작일</label>
									<p>
										
											
												
													2023.10.31
												
												
												
											
											
										
									</p>
								</li>
								<li>
									<label>결제수단</label>
									<textarea style="display: none">{"isComplex":false,"hasExternal":false,"hasHp":true,"hpStartDate":"2023.10.31"}</textarea>
									<textarea style="display: none">{"totalCount":0,"intfacId":"0","drnkCustNm":"신종혁","dlvyCustYn":"Y","cphnno":"01023442891","prtnNm":"서초홈가맹점","prtnId":"23812","buTelNo":"025470519","prtnChfCphnNo":"01038994569","dlvyAddr1":"서울 서초구 청두곶2길 6","dlvyAddr2":"469-9 303호 ","dlvyDrAddr1":"서울 서초구 청두곶2길 6","dlvyDrAddr2":"469-9 303호 ","startDate":"2023.10.31","contractYn":"N","boxYn":"N","rceitKndCd":"50","rceitKnd":"CMS","bankName":"(구)외환은행","acno":"**********","prtnChnl":"CH63","resultMsg":"신규승인","orderNumber":"18369285571027001056","eventYn":"N","acqrSourc":"RR11","cancelAgreementYn":"N"}</textarea>
									<p data-parse-paymethod="">계좌 자동이체((구)외환은행)</p>
								</li>

							</ul>
						</div>
						<div class="tail">

							
								<a class="rounded-button" href="/mypage/drink/drinks/230000234094/23812">상세보기 / 변경</a>
							
							
							<div class="button-text-set">

								



							</div>
						</div>
					</form>
				
			</div>
		
		
		<div class="alert-area lg">
			<h4>고객번호 찾기/등록 안내</h4>
			<ul>
				<li>
					음용중이시나 고객번호 확인이 되지 않으시는 경우에는
					<button class="button-text" type="button" data-toggle="modal" data-target="#numberModal">
						고객번호찾기
					</button>
					를 통해 확인해보세요.
				</li>
				<li>
					'고객번호찾기'를 통해 고객번호 확인이 어려우신 경우에는 홈페이지 1:1 문의 또는 배송가맹점을 통해 문의하세요.
				</li>
			</ul>
		</div>
	</div>
</div>

<div class="modal fade" id="numberModal" tabindex="-1" aria-labelledby="numberModal" aria-hidden="true">
	<div class="modal-dialog basic-width modal-dialog-centered">
		
		<div class="modal-content">
			<div class="modal-header" style="border:0; padding:20px 28px 14px 30px;">
				<h5 class="modal-title" id="numberModalLabel">고객번호등록</h5>
				<button style="margin-top:5px;" type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div style="padding:0 30px 40px">
				<div class="form-input">
					<dl>
						<dt style="min-width: 107px"><label>휴대폰번호</label></dt>
						<dd>
							<input id="phoneNumber" maxlength="13" data-call-text="" type="hidden">
						<input maxlength="13" type="text" name="_x_undefined"></dd>
					</dl>
				</div>
				<div class="form-input">
					<dl>
						<dt style="min-width: 107px"><label>고객번호</label></dt>
						<dd>
							<input class="numberOnly" id="custNumber" type="text">
						</dd>
					</dl>
				</div>
				<div class="form-input">
					<dl>
						<dt style="min-width: 107px"><label>애칭</label></dt>
						<dd>
							<input id="nickname" maxlength="5" type="text">
						</dd>
					</dl>
				</div>
			</div>
			<div class="button-set">
				<button id="register" type="button" class="button-basic primary">등록하기</button>
			</div>
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

<div style="display: none;" id="mini-side-nav">
	<a href="/mypage/drink/drink"><img src="/resources/images/ui/quick1.png" alt=""></a>
	<a id="quickChangeDrink" href="/mypage/drink/drink/change/230000234094/23812"><img src="/resources/images/ui/quick2.png" alt=""></a>
	<a id="quickChangeSchedule" href="/mypage/drink/drink/pause/230000234094/23812"><img src="/resources/images/ui/quick3.png" alt=""></a>
	<a href="/mypage/drink/bill"><img src="/resources/images/ui/quick4.png" alt=""></a>
	<a href="#"><img src="/resources/images/ui/quickTop.png" alt=""></a>
</div>

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
	} else {
    	windowRef.focus();
	} // if
  } // openWindowPop
</script>

<div style="" id="mini-side-nav">
	<a href="/mypage/drink/drink"><img src="/resources/images/ui/quick1.png" alt=""></a>
	<a id="quickChangeDrink" href="/mypage/drink/drink"><img src="/resources/images/ui/quick2.png" alt=""></a>
	<a id="quickChangeSchedule" href="/mypage/drink/drink"><img src="/resources/images/ui/quick3.png" alt=""></a>
	<a href="/mypage/drink/bill"><img src="/resources/images/ui/quick4.png" alt=""></a>
	<a href="#"><img src="/resources/images/ui/quickTop.png" alt=""></a>
</div>

</div>
		</main>		
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
	
 </div>

</body>

</html>