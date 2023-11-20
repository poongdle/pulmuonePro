<%@page import="servlets.order.domain.DrkOrderProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/layouts/head.jsp"%>
<body>

	<div class="wrapper">

		<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
		
<script>
	var type = "daily";
	var gap = type == 'daily' ? 4 : 1;
	var dayOfWeekVal = ['A', 'B', 'C', 'D', 'E']
	var reqItems = [];
	var nfsItem = "".split(",").filter(v=>!!v);
	var nfsList = "".split(",").filter(v=>!!v);
			
	try {
		var items = decodeURIComponent("{&quot;item&quot;:[{&quot;itemCode&quot;:&quot;0071654&quot;,&quot;dayQty&quot;:[1,1,1,1,1]}]}").replace(/\&quot;/g, '"');
	    reqItems = JSON.parse(items).item;
	    reqItems = reqItems.filter(x => !nfsList.includes(x.itemCode));
	    console.log({reqItems})
	} catch (e) {
		console.log(e)
	} // try

	$(document).on("click", ".dropdown-menu .dropdown-item", function (e) {
		$(this).parent().prev().click();
	})

	console.log({nfsItem})
	
	function getCouponPrice(totalPrice) {
    	var couponPrice = 0;
    	$("input[name='couponIdx']").each(function () {
      		var $t = $(this);
		    var basePrice = totalPrice;

			$(".order-item[data-event-idx]").each(function () {
		        var eidx = $(this).attr("data-event-idx");
		        if (eidx) basePrice -= parseInt($(this).attr("data-price"), 10) * parseInt($(this).attr("data-len"));
			});
	
	      	if ($t.attr("data-allow") && $t.attr("data-sale-per")) {
				var j = $t.attr("data-allow").split(",");
		        basePrice = 0;
		        $(".order-item[data-prod-id]").each(function () {
		        	var $t2 = $(this);
		          	var ct = parseInt($t2.find("[data-count='0']").val() || "1", 10);
		          	if (j.includes($t2.attr("data-prod-id"))) basePrice += parseInt($t2.attr("data-price"), 10) * ct;
		        });
			} // if
	
			var n1 = parseInt($t.attr("data-sale-price") || "0", 10);
	      	var n2 = Math.min(
	        	Math.floor(basePrice * (parseInt($t.attr("data-sale-per") || "0", 10) / 100)),
	          	(parseInt($t.attr("data-rate-max"), 10) || Infinity)
	      	);
	      	
	      	couponPrice += n1 + n2;
    	});

    	return couponPrice;
	} // getCouponPrice

	function calculateTotalPrice() {
	    var originTotal = 0;
	    var totalPrice = 0;
	    var totalCount = 0;
	    var deliveryPrice = 0;
	    $("#order_targets [data-itemcode][data-price]").each(function () {
	    	var count = 0;
	      	$(this).find("[data-count]").each(function () {
	        	count += parseInt($(this).val(), 10);
	      	});
	      	totalCount += count;
	      	originTotal += parseInt($(this).attr("data-origin-price") || $(this).attr("data-price"), 10) * count;
	      	totalPrice += parseInt($(this).attr("data-price"), 10) * count;
	      	deliveryPrice += parseInt($(this).attr("data-delivery-price") || "0", 10);
	    });

		var couponPrice = getCouponPrice(totalPrice);
    	couponPrice = Math.min(couponPrice, totalPrice - (deliveryPrice <= 0 ? 100 : 0));

	    $("[data-price-view='origin']").text((originTotal * gap).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    	$("[data-price-view='product']").text((totalPrice * gap).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	    $("[data-price-view='sale']").text(((originTotal - (originTotal - totalPrice)) * gap).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    	$("[data-price-view='delivery']").text((deliveryPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    	$("[data-price-view='coupon']").text((couponPrice > 0 ? "-" : "") + (couponPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

	    $("[data-price-view='total']").text((totalPrice * gap + deliveryPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    	$("[data-price-view='payment']").text((totalPrice * gap + deliveryPrice - couponPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

	    var payPrice = totalPrice * gap + deliveryPrice - couponPrice;
    	$("input[name='payPrice']").val(payPrice);
    	$("[data-count-view]").text(totalCount);

	    if (couponPrice > 0) $("[data-price-view='coupon']").addClass("minus");
    	else $("[data-price-view='coupon']").removeClass("minus");

	    if ((originTotal - (originTotal - totalPrice)) != originTotal) $("[data-price-view='sale']").addClass("minus");
      	else $("[data-price-view='sale']").removeClass("minus");

	    $("#coupon-selector option").each(function () {
      		var $t = $(this);
		    if (totalPrice < parseInt($t.attr("data-limit"), 10)) $(this).hide().attr("data-coupon-visible", "N");
    	});
	
    	if ($("#coupon-selector [data-coupon-visible=Y]").length <= 0) {
	    	$("#coupon-selector > option[value='']").text("사용 가능한 쿠폰이 없습니다.");
	      	$("#coupon-selector").prop("disabled", true);
	    }

	    if (!$(".order-item-list>*").length) $(".empty-area").show().next().hide();
	    else $(".empty-area").hide().next().show();
	
	    $("#" + type + "_tab_count").text($(".order-item-list>*").length);
	} // calculateTotalPrice

	function searchPrtn(data) {
		get({
	      url: '/search/branch/' + data.zonecode + '/' + data.buildingCode
	    }, function (r) {
	      	const data = JSON.parse(r.RESULT_MSG)
	      	console.log(data);
	      	if (data.home) {
		        console.log($('input[name=deliveryPlace][value=H]'))
		        $('input[name=deliveryPlace][value=H]').data('prtn', data.home.prtnCd)
		        $('input[name=deliveryPlace][value=H]').data('buTelno', data.home.buTelno)
		        $('input[name=deliveryPlace][value=H]').data('prtn-name', data.home.prtnName)
	    	} else {
		        $('input[name=deliveryPlace][value=H]').removeData('prtn')
		        $('input[name=deliveryPlace][value=H]').removeData('prtn-name')
	      	} // if
	      	if (data.office) {
	        	console.log($('input[name=deliveryPlace][value=O]'))
	        	$('input[name=deliveryPlace][value=O]').data('prtn', data.office.prtnCd)
	        	$('input[name=deliveryPlace][value=O]').data('prtn-name', data.office.prtnName)
	        	$('input[name=deliveryPlace][value=O]').data('buTelno', data.office.buTelno)
	      	} else {
		        $('input[name=deliveryPlace][value=O]').removeData('prtn')
		        $('input[name=deliveryPlace][value=O]').removeData('prtn-name')
		        $('input[name=deliveryPlace][value=O]').removeData('buTelno')
			} // if
	    	$('input[name=deliveryPlace]').change();
		})
	} // searchPrtn

	function searchPostcode() {
	    new daum.Postcode({
	    	oncomplete: function (data) {
		        var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		        var extraRoadAddr = ''; 		 // 참고 항목 변수
		        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) extraRoadAddr += data.bname;
		        if (data.buildingName !== '' && data.apartment === 'Y') {
		          extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName
		              : data.buildingName);
		        } // if
		        if (extraRoadAddr !== '') extraRoadAddr = ' (' + extraRoadAddr + ')';
		        if (fullRoadAddr !== '') fullRoadAddr += extraRoadAddr;
		        $("#zipcode").val(data.zonecode);
		        $("#addrRoad").val(data.roadAddress);
		        $("#orderStreetAddress").val(data.jibunAddress);
		        searchPrtn(data);
	      }
	    }).open();
	} // searchPostcode

	function showAddress(pageNo) {
	    $('#addressModal').addClass("loading");
	    get({
	    	url: '/product/order/adressbook',
			param: $.param({ pageNo })
	    }, function (response) {
	    	const r = response.RESULT_MSG
	    	search = r.search;
	    	if (r.data.length > 0) {
		        var tpl = $("#address_tpl").text();
		        var root = $('#addressModal .modal-body > .address');
		        $.each(r.data, function (i, v) {
		        	var t = tpl;
		        	for (var key of Object.keys(v)) {
		        		var regex = new RegExp('\{' + key + '\}')
		            	t = t.replace(regex, v[key]);
		          	}
		          	var el = $(t).data("item", v);
		          	if (v.basicYn != 'Y') el.find("label").remove();
		          	root.append(el);
		        });
	        
	       		var hasNext = r.data[0].totalCount > $('#addressModal .modal-body > .address > *').length;
	        
		        if (hasNext) {
		          	root.next().show().click(function () {
		            	showAddress(pageNo + 1);
		        	});
		        } else {
		        	root.next().hide();
		        }
	
	        	$('#addressModal').removeClass("loading")
	      	} else if (pageNo == 0) {
	        	alert('등록된 주소록이 없습니다.');
	        	$('#addressModal').modal("hide");
			} // if
		}) // get
	} // showAddress

	function checkEqInput() {
	    var isEq = true;
	    $("[data-init]").each(function (i, el) {
	    	var $that = $(el);
			if ($that.val() != $that.attr("data-init")) isEq = false;
	    });
	    $("#chk-same").prop("checked", isEq);
	} // checkEqInput

	function resetArs (forceReset) {
	    var payMethod = $(".nav-link.active").data('value');
	    if (forceReset) {
			$("#beforeArs").show();
	    	$("#afterArs").hide();
	   	   	$("#accountNumber").val("");
	      	$("#accountNumber").prop("readonly", false);
	 	    $("#bankCode").prop('disabled', false)
	  	    $("#bankCode").val("");
	     	$("input[name=bankCode]").val("");
	      	var cmsId = $.trim($("#cmsId").val());
	      	if (cmsId != undefined && cmsId != "") {
	        	var url = "/fms/ars/response/delete/" + cmsId;
	        	get({url: url, param: {}}, function (response) {
	        	});
	    	} // if
    	} // if
	} // resetArs

	function changeCount(el, s) {
	    var container = $(el).parents("[data-itemcode]");
	    var idx = container.attr("data-itemcode");
	    var size = [];
	    container.find("[data-count]").each(function () {
	      size.push(parseInt($(this).val(), 10));
	    });
	
	    var ix = parseInt($(el).attr("data-index") || "0", 10);
	    size[ix] = Math.max(size[ix] + s, 0);
	
	    var data = { idx };
	    if (size.length == 1) {
			data.qty = size[0];
	    } else {
	    	for (let i = 0; i < size.length; i++) {
	       		data['day' + (i + 1)] = size[i];
	      	} // for
	    } // if

		var textview = $("[data-itemcode='" + idx + "'] [data-itemcount-view='" + ix + "']", container);
    	textview.text(size[ix]);
    	if (size[ix] <= 0) textview.parents("li").removeClass("active");
    	else textview.parents("li").addClass("active");
    	$("[data-itemcode='" + idx + "'] [data-count='" + ix + "']", container).val(size[ix]);

	    var ix = -1;
    	reqItems.forEach(function (v, i) {
      		if (v.itemCode == idx) ix = i;
    	})
    	if (ix >= 0) reqItems[ix].dayQty = size;

	    calculateTotalPrice();
	    console.log(data);
	} // changeCount

  function renderCouponList() {
    $("#coupon-selector > option[value='']").text("쿠폰을 선택하세요.");
    $("#coupon-selector").prop("disabled", false);
    $("#coupon-selector option[data-coupon-visible]").show().attr("data-coupon-visible", "Y"); //.prop("disabled", false);
    if ($("#apply-coupon-list > *").length > 0) {
      $("#coupon-selector option[data-duplicate='N']").hide().attr("data-coupon-visible", "N");
    }
    else {
      $("#coupon-selector option[data-duplicate='N']").show().attr("data-coupon-visible", "Y");
    }

    var pfitem = $("#coupon-selector > [data-allow]");
    if (pfitem.length) {
      var nowProds = [];
      $("[data-prod-id]").each(function () {
        nowProds.push(String($(this).data("prodId")));
      });

      pfitem.each(function () {
        var k = JSON.parse($(this).attr("data-allow"));
        var an = k.filter(it => nowProds.includes(String(it)));
        if (!an.length) {
          $(this).hide().attr("data-coupon-visible", "N");
        }
      });
    }


    // $("#coupon-selector option[data-duplicate='N']").prop("disabled", $("#apply-coupon-list > *").length > 0);
    $("#apply-coupon-list > *").each(function () {
      var cpIdx = $(this).attr("data-coupon-idx");
      $("option[value='" + cpIdx + "']").hide().attr("data-coupon-visible", "N"); //.prop("disabled", true);
    });

    $("#coupon-selector").prop("disabled", $("#apply-coupon-list > [data-duplicate='N']").length > 0);
    if ($("#apply-coupon-list > [data-duplicate='N']").length > 0) {
      $("#coupon-selector > option[value='']").text("사용 가능한 쿠폰이 없습니다.");
    }
    calculateTotalPrice();
  }

  $(document).on("click", "[data-addproduct]", function () {
    var itemCode = $(this).attr("data-addproduct");

    if(nfsList.includes(itemCode)){
        return alert('현재 해당 제품은 원료 공급 부족으로 주문이 어렵습니다. \n빠른 시일 내에 만나 보실 수 있도록 노력하겠습니다.')
    }

    if (reqItems.filter(x => x.itemCode === itemCode).length > 0) {
      alert("이미 등록된 상품입니다.");
      return;
    }
    var o = reqItems.filter(v => !!v);
    o.push({ itemCode, dayQty: [1,1,1,1,1] });

    var param = encodeURIComponent(JSON.stringify({item: o}));
    axios.get("/order/daily/step1?item=" + param).then(function (r) {
      var $el = $(r.data);
      $("#order_targets").html($el.find("#order_targets").html());
      $("#req_json").val($el.find("#req_json").val());
      $("#addProductModal").modal("hide");
      calculateTotalPrice();
      reqItems = o;
    }).catch(function (e) {
      alert("서버와 연결이 올바르지 않습니다.");
    });
  });

  $(document).ready(function () {
      var excceed = ""


      if(!!excceed){
          alertWithRedirect("주문 가능한 수량을 초과하였습니다.","/");
          setTimeout(function(){
              location.href="/";
          },2000);
      }
      $('[name=_x_orderPhone]').trigger('input');
    

    var eventSize = 0;
    $(".order-item").each(function () {
      if ($(this).attr("data-event-idx")) {
        eventSize += 1;
      }
    });
    if (eventSize == $(".order-item").length) {
      $("#coupon-pane").remove();
    }


    $("#searchPostcode").click(searchPostcode);

    $('input[name=deliveryPlace]').change(function () {
      if ($(this).is(':checked') && $('#zipcode').val()) {
        const estCdInput = $('input[name=estCd]');
        if ($(this).data('prtn')) {
          estCdInput.prev().val($(this).data('prtn-name'))
          estCdInput.next().val($(this).data('buTelno'))
          estCdInput.val($(this).data('prtn'));
          console.log(estCdInput.val())
        } else {
          estCdInput.val(undefined);
          estCdInput.prev().val('배송이 불가한 지역입니다.')
          estCdInput.next().val('')
        }
      }
    });

    var d= moment()
      var i = 2;
      if(!getHolidays(d)){
        if(d.hour()>=12){
            i=3;
        }
      }else {
        while(getHolidays(d)){
            d= moment(d.add(1,'days'));
        }
      }
      var dAfter = d;
    while(moment().isoWeekdayCalc(d.format('YYYY-MM-DD'), dAfter.format('YYYY-MM-DD'), [1, 2, 3, 4, 5], getHolidaysV2())<i){
        dAfter = moment(dAfter.add(1,'days'));
    }

    d= new Date(dAfter);
    var d2 = new Date(d.getTime() + 12096e5*2);

    $('#ip-datepicker-1').daterangepicker({
      singleDatePicker: true,
      minDate: d,
      maxDate: d2,
      isInvalidDate: getHolidays,
      locale: {
        format: 'YYYY.MM.DD'
      }
    }, function (d) {
      $('#ip-datepicker-1').val(d)
    });

    $('#addressBtn').click(function () {
      $('#addressModal').addClass("loading").modal("show");
      $('#addressModal .modal-body > .address').html("");
      showAddress(0);
    });

    $("[data-init]").on("input", function () {
      checkEqInput();
    });

    $("#chk-same").click(function () {
      var isCheck = $(this).is(":checked");
      if (!isCheck) {
        $("[data-init]").val("").change();
      } else {
        $("[data-init]").each(function () {
          var $that = $(this);
          $that.val($that.attr("data-init")).change();
        })
      }
    })


    $('.nav-link').click(function () {
      $("[data-method]").text($(this).find("span").text())
      console.log()
      $('input[name=payMethod]').val($(this).parent().attr('data-code').toUpperCase())
      resetArs(true);
    })

    $("#beforeArs").click(function () {
      var bankCode = $("#bankCode").val();
      if (bankCode == "") {
        alert('', "은행을 선택해주세요.", function () {
          $("#bankCode").focus();
        });
        return;
      }

      var accountNumber = $.trim($("#accountNumber").val());
      $("#accountNumber").val(accountNumber);
      if (accountNumber == "") {
        alert('', "계좌번호를 입력해주세요.", function () {
          $("#accountNumber").focus();
        });
        return;
      }
      $('#callCms').click();
    });

    $("#validYYMM").keyup(function () {
      var text = $.trim($(this).val());
      var yymm = text.replace(/[^0-9]/g, '');
      if (yymm.length >= 3) {
        yymm = yymm.replace(/(.{2})/g, "$1/")
        $(this).val(yymm.substring(0, 5));
      }
    });

    $(".numberOnly").on("keyup", function () {
      $(this).val($(this).val().replace(/[^0-9]/g, ""));
    });

    $("#validCardBtn").click(function () {

      if (!$('#card_number').val()) {
        alert("카드번호를 입력해주세요.");
        return false;
      }

      if (!$('#birthDay').val()) {
        alert("생년월일을 입력해주세요.");
        return false;
      }

      if (!$('#validYYMM').val()) {
        alert("유효기간을 입력해주세요.");
        return false;
      }

      $(".cardNumber").keyup();
      $("#birthDay").keyup();
      $("#validYYMM").keyup();

      var cardNumber = $('#card_number').val();
      get({
        url: "/fms/valid/card",
        param: {
          cardNumber: cardNumber,
          birthYYMMDD: $("#birthDay").val(),
          validYYMM: $("#validYYMM").val(),
          parterCode: $("#officeCode").val()
        }
      }, function (response) {
        if (response.RESULT_MSG.flag == "N" || response.RESULT_MSG.error) {
          alert("카드 인증에 실패했습니다. 정확히 입력하셨는지 확인해 주세요.");
          $("#cardValidation").val("N");
        } else if (response.RESULT_MSG.flag == "Y") {
          $("#cardValidation").val("Y");
          alert("인증되었습니다.");
          $("#validCardBtn").closest("table").find("input").prop("readonly", true);
          $("#validCardBtn").text("다시인증");
        }
      });

    });

    var tpl = $("#product_tpl").text();
    $(document).on("click", "#add-product-more", function () {
      $("#add-product-targets").next().hide();
      var param = $(this).parent().data("param");
      param.pageNo = (param.pageNo || 0) + 1;
      get({
        url: "/product/order/search-product",
        param
      }, function (r) {
        const result = r.RESULT_MSG;
        for (var item of result.data) {
          var el = tpl;
          for (var key of Object.keys(item)) {
            var regex = new RegExp('\{' + key + '\}', 'gi');
            if (key == "price") {
              el = el.replace(regex, item[key].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
            } else {
              el = el.replace(regex, item[key]);
            }
          }
          $("#add-product-targets").append(el);
        }
        var tc = result.data[0].totalCount;
        $("#add-product-size").text(tc);
        $("#add-product-targets").next().data("param", param);
        if ($("#add-product-targets>*").length >= tc) {
          $("#add-product-targets").next().hide();
        } else {
          $("#add-product-targets").next().show();
        }
      });
    });

    $("#searchForm").submit(function (e) {
      e.preventDefault();
      var param = $(this).serializeObject();

      $("#addProductModal").addClass("loading")
      get({
        url: "/product/order/search-product",
        param
      }, function (r) {
        const result = r.RESULT_MSG;
        $("#add-product-targets").html("");
        for (var item of result.data) {
          var el = tpl;
          for (var key of Object.keys(item)) {
            var regex = new RegExp('\{' + key + '\}', 'gi');
            if (key == "price") {
              el = el.replace(regex, item[key].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
            } else {
              el = el.replace(regex, item[key]);
            }
          }
          $("#add-product-targets").append(el);
        }
        var tc = result.data[0].totalCount;
        $("#add-product-size").text(tc);
        $("#add-product-targets").next().data("param", param);
        if ($("#add-product-targets>*").length >= tc) {
          $("#add-product-targets").next().hide();
        } else {
          $("#add-product-targets").next().show();
        }
        $("#addProductModal").removeClass("loading");
      })
      return false;
    });

    $("#addProductBtn").click(function () {
      $("#addProductModal").addClass("loading").modal("show");
      $("#searchForm").submit();
    })

    $("#changeProductBtn").click(function () {
      $("#change-targets").html($("#order_targets").html());
      $("#change-targets .order-item-content").addClass("editing");
      $("#changeProductModal").modal("show");
    });

    $("#changeProductApplyBtn").click(function () {
      $("#change-targets>*").each(function () {
        var $that = $(this);
        var itemCode = $that.attr("data-itemcode");
        var dayQty = [0,0,0,0,0];
        $("[data-count]", $that).each(function () {
          var $t2 = $(this);
          dayQty[parseInt($t2.attr("data-count"), 10)] = parseInt($t2.val(), 10);
        })

        for (var reqItem of reqItems) {
          if (reqItem.itemCode === itemCode) {
            reqItem.dayQty = dayQty;
          }
        }
      })
      $("#changeProductModal").modal("hide");
      console.log(reqItems);


      // $('[data-call-text]').callText()
      //

      for (var reqItem of reqItems) {
        var $ct = $("#order_targets [data-itemcode='" + reqItem.itemCode + "']");
        for (var i = 0; i < reqItem.dayQty.length; i++) {
          $("[data-count='" + i + "']", $ct).val(reqItem.dayQty[i]);
          var textview = $("[data-itemcount-view='" + i + "']", $ct);
          textview.text(reqItem.dayQty[i]);
          if (reqItem.dayQty[i] <= 0) {
            textview.parents("li").removeClass("active");
          } else {
            textview.parents("li").addClass("active");
          }
        }
      }
      calculateTotalPrice()
    });
      if(nfsItem.length>0){
          alert('현재 아래 제품은 '+'<br/>'+' 원료 공급 부족으로 주문이 어렵습니다.'+'<br/>'+'빠른 시일 내에 만나 보실 수 있도록 노력하겠습니다.' +'<br/>'+
                  '제품명 : '+nfsItem.join(', '))
      }

      // console.log($('[name=_x_orderPhone]'))

    $("#coupon-selector").change(function () {
      var el = $("option:selected", this);
      var idx = el.attr("value");

      var obj = el.data();
      obj.idx = idx;
      obj.price_print = obj.rate.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      if (!obj.allow) obj.allow = "";

      var totalPrice = 0;
      $("#order_targets [data-itemcode][data-price]").each(function () {
        var count = 0;
        $(this).find("[data-count]").each(function () {
          count += parseInt($(this).val(), 10);
        });
        totalPrice += parseInt($(this).attr("data-price"), 10) * count;
      });

      if (obj.rateType == 'P') {
        obj.price_print_type = "%";
        obj.sper = obj.rate;
        obj.sprice = "0";
      } else {
        obj.price_print_type = "원";
        obj.sper = "0";
        obj.sprice = obj.rate;
      }

      var tpl = $("#apply-coupon-tpl").text();
      for (var key of Object.keys(obj)) {
        var regex = new RegExp('\{' + key + '\}', 'gi');
        tpl = tpl.replace(regex, obj[key]);
      }

      $(this).val("");

      var cp = getCouponPrice(totalPrice);
      $("input[name='couponIdx']", $(tpl)).each(function () {
        var $t = $(this);
        var basePrice = totalPrice;
        if ($t.attr("data-allow") && $t.attr("data-sale-per")) {
          var j = $t.attr("data-allow").split(",");
          basePrice = 0;
          $(".order-item[data-prod-id]").each(function () {
            var $t2 = $(this);
            var ct = parseInt($t2.find("[data-count='0']").val() || "1", 10);
            if (j.includes($t2.attr("data-prod-id"))) {
              basePrice += parseInt($t2.attr("data-price"), 10) * ct;
            }
          });
        }

        var n1 = parseInt($t.attr("data-sale-price") || "0", 10);
        var n2 = Math.min(
            Math.floor(basePrice * (parseInt($t.attr("data-sale-per") || "0", 10) / 100)),
            (parseInt($t.attr("data-rate-max"), 10) || Infinity)
        );
        cp += n1 + n2;
      });

      var d = 0;
      $(".order-item[data-delivery-price]").each(function () {
        d += parseInt($(this).attr("data-delivery-price"), 10);
      });

      if (totalPrice - 100 < cp && d == 0) {
        confirmDesign('', '쿠폰 금액이 상품 금액을 초과하여<br />최소 결제 금액 100원으로 결제 될 예정입니다.', function () {
          $("#apply-coupon-list").append(tpl);
          renderCouponList();
        });
      }
      else {
        $("#apply-coupon-list").append(tpl);
        renderCouponList();
      }
    });

    $("#allOrderBtn").click(function () {
      const formArr = $('#orderForm').serializeArray();
      var formData = $('#orderForm').serializeObject();

      var data = formData;



      var emptyField = undefined;
      $("[data-require]").each(function () {
        var $that = $(this);
        if (!$that.val() && !emptyField) {
          emptyField = $that;
        }
      })

      if (emptyField && emptyField.length > 0) {
        var name = emptyField.attr("data-name");
        alert(name + "항목이 비어있습니다.", function () {
          setTimeout(function () {
            emptyField.focus();
          }, 500);
        });
        return;
      } else if(type==='daily'&&!data.deliveryPlace){
            return alert('배달장소를 선택해주세요');
        } else if (type === "daily" && !$("#officeCode").val()) {
        alert("배송이 불가한 지역입니다.");
        return;
      } else if (type === "daily" && $("input[name='payMethod']").val() == "CARD" && $("#cardValidation").val() != "Y") {
        alert("카드 인증이 필요합니다.");
        return;
      } else if (type === "daily" && $("input[name='payMethod']").val() == "BANK" && $("#afterArs").css("display") == "none") {
        alert("ARS 인증이 필요합니다.");
        return;
      } else if ( !$("#agree-11").prop("checked") ) {
        alert( "구매조건 확인 및 결제진행에 동의 해주세요");
        return;
      }

      data.itemCodeCount = $('#order_targets [data-itemcode]').length
      data.composition = data.itemCodeCount > 1 ? 'variety' : 'uniformity'

      if (type === 'daily') {
        data.officeCode = formData.estCd
        data.officeName = formData.prtnName;

        $.each(reqItems, function (i, v) {
          data['itemCode' + i] = v.itemCode;
          data['day' + i] = [
            "A|" + v.dayQty[0],
            "B|" + v.dayQty[1],
            "C|" + v.dayQty[2],
            "D|" + v.dayQty[3],
            "E|" + v.dayQty[4]
          ];
        });
      }

      var req_json = JSON.parse($("#req_json").text()).item;

      data.totalDeliveryFee = 0;
      data.items = reqItems.map(v => {
        var reqs = req_json.filter(x => x.itemCode == v.itemCode && x.eventIdx == v.eventIdx);
        var output = {
          itemCode: v.itemCode,
          qty: v.qty,
        };
        if (reqs.length) {
          var p = reqs[0].product;
          output.productInfo = p;
          output.product = p;
          output.price = p.price;
          output.itemCode = p.itemCode;
          output.salePrice = p.price - (p.salePrice || p.price);
          output.eventIdx = reqs[0].eventIdx;

          if (p.deliveryFee === 'D') {
            output.deliveryFee = Math.ceil(v.qty / p.qtyPerDeliveryFee) * 2800;
            if (!isFinite(output.deliveryFee)) output.deliveryFee = 0;
            data.totalDeliveryFee += output.deliveryFee
          }
        }
        return output;
      });

      data.payMethod = $('.nav-link.active').data('value')
      data.postCode = formData.zipCode
      const streetAddress = formData.orderStreetAddress
      data.orderStreetAddress = formData.addrRoad
      data.orderAddr1 = streetAddress
      data.orderAddr2 = formData.addrDetail
      data.oldAddr = streetAddress
      data.payPrice = formData.payPrice;
      data.phone = formData.orderPhone;
      data.receiver = formData.orderName;
      data.couponIdx = Array.isArray(formData.couponIdx) ? formData.couponIdx : [formData.couponIdx];
      data.memo = formData.orderMemo;

      if (type == 'daily') {
        if (data.payMethod === 'CARD') {
          data.cardNumber1 = formData.cardNumber.toString().substring(0, 4)
          data.cardNumber2 = formData.cardNumber.toString().substring(4, 9)
          data.cardNumber3 = formData.cardNumber.toString().substring(9, 13)
          data.cardNumber4 = formData.cardNumber.toString().substring(13)
          data.contractYn = 'N'
          data.validYYMM = formData.validYYMM;
        } else if (data.payMethod === 'BANK') {
          data.accountNumber = $('#accountNumber').val();
          data.bankCode = $('#bankCode').val();
          data.fdCustId = $('#fdCustId').val();

        }
      }

      if (type == 'daily') {
            console.log(data)
        newPost({
          url : "/order/daily/step1",
          data : data
        }, function(response) {

          console.log(response);

        });
      }
      else if (type == 'box') {
        newPost({
          url: '/order/daily/step1',
          data
        }, function (r) {

          //이니시스에 저장되는 구매자
          data.receiver = '신종혁';
          var response = r.RESULT_MSG;
          console.log(response, data)
          var title = response.title;
          var amt = response.amt;
          var orderNum = response.orderNum;
          callInipay(orderNum, data, {
            title,
            amount: amt,
          });
        }, function (r) {
          alert(r.RESULT_MSG);
        });
      }
    });
  });

  $(window).on("load", function () {
    renderCouponList();
    var addrRoad = $('#addrRoad').val();
    if (addrRoad && type == 'daily') {
      searchPrtn({
        addrRoad,
        zonecode: $('#zipcode').val(),
        buildingCode: addrRoad.substring(addrRoad.lastIndexOf(" ") + 1)
      });
    }
  })

  $(document).on("click", "input[name='couponIdx']", function () {
    calculateTotalPrice();
  })

  $(document).on("click", ".prod-add", function () { changeCount(this, 1); });
  $(document).on("click", ".prod-remove", function () { changeCount(this, -1); });

  $(document).on("click", ".adapt-address", function () {
    var data = $(this).parents(".item").data("item");
    $('#receiver').val(data.name);
    $('#phone').val(data.phoneFirstNum + data.phoneFirstMiddle + data.phoneFirstLast);
    $('#zipcode').val(data.post);
    $('#addrRoad').val(data.addr1);
    $('#addrDetail').val(data.addr2);
    $('#memo').val(data.memo);
    if(data.oldAddr){
    $("#orderStreetAddress").val(data.oldAddr);
    }else {
        $("#orderStreetAddress").val(data.addr1);
    }

    data.addrRoad = data.addr1
    data.zonecode = data.post
    data.buildingCode = data.addr1.split(' ')[data.addr1.split(' ').length-1]
    searchPrtn(data);

    $('#addressModal').modal('hide');
    checkEqInput();
  });

  $(document).on("click", "#apply-coupon-list .coupon-remove", function () {
    var row = $(this).parents("[data-coupon-idx]");
    row.remove();
    renderCouponList();
  });


</script>
		
		<main class="page event">
			<div class="container">

				<form id="orderForm">
					<input type="hidden" name="cardValidation" id="cardValidation" value="N">
					<input type="hidden" name="payMethod" value="CARD">
					<input type="hidden" name="payPrice" value="58000">

					<div class="location">
						<a href="/">홈</a>
						<a href="/">장바구니</a>
						<a href="/">주문서 작성</a>
					</div>
					
					<div class="cont-checkout-area">
						<div class="title-tab-area">
							<h2 class="cont-title">주문서 작성</h2>
						</div>
						
						<div class="prd-cart-area" style="padding-bottom: 50px;">
							<div class="prd-cart-list-area">
								<div class="checkout-prd-list">
									
									<%
										ArrayList<DrkOrderProductDTO> prdList = (ArrayList<DrkOrderProductDTO>) request.getAttribute("prdList");
										int prdCnt = prdList.size();
									%>
									
									<div class="checkout-title-area">
										<strong class="list-amount">주문상품 <em class="prd-count" style="padding: 0 16px; margin-left: 2px"><%= prdCnt %></em></strong>
										<button type="button" class="btn-down">
											<i class="ico ico-down"><span class="hide">주문서 닫기</span></i>
										</button>
									</div>
									
									<ul style="" class="prd-cart-list" id="order_targets">
										
										<c:forEach items="${ prdList }" var="prd">
										
											<li data-id="" data-itemcode="${ prd.productsNo }" class="order-item order-chk active" data-price="${ prd.price }">
	
												<a href="/product/daily/281" class="prd-cart">
													<div class="thumb">
														<img src="/${ prd.imgPath }/${ prd.systemName }" alt="">
													</div>
													<div class="prd-info">
														<b class="prd-title"> ${ prd.productsName } </b>
														<b class="now-price">
															<fmt:formatNumber value="${ prd.price }" type="number"></fmt:formatNumber>
															<span> 원</span>
														</b>
													</div>
												</a>
												
												<div class="prd-cart-select-daily">
													<ul data-cart-idx="" data-itemcode="0071654">
	
														<li><input type="hidden" data-count="0" value="1">
															<span>월</span>
															<div class="prd-select-daily">
																<button type="button" class="prod-add ea-control" data-index="0">
																	+<span class="hide">제품 추가</span>
																</button>
																<em data-itemcount-view="0">1</em>
																<button type="button" class="prod-remove ea-control btn-minus" data-index="0">
																	<span class="hide">제품 빼기</span>
																</button>
															</div></li>
	
														<li class="active"><input type="hidden" data-count="1"
															value="1"> <span>화</span>
															<div class="prd-select-daily">
																<button type="button" class="prod-add ea-control" data-index="1">
																	+<span class="hide">제품 추가</span>
																</button>
																<em data-itemcount-view="1">1</em>
																<button type="button" class="prod-remove ea-control btn-minus" data-index="1">
																	<span class="hide">제품 빼기</span>
																</button>
															</div></li>
	
														<li><input type="hidden" data-count="2" value="1">
															<span>수</span>
															<div class="prd-select-daily">
																<button type="button" class="prod-add ea-control" data-index="2">
																	+<span class="hide">제품 추가</span>
																</button>
																<em data-itemcount-view="2">1</em>
																<button type="button" class="prod-remove ea-control btn-minus" data-index="2">
																	<span class="hide">제품 빼기</span>
																</button>
															</div></li>
	
														<li><input type="hidden" data-count="3" value="1">
															<span>목</span>
															<div class="prd-select-daily">
																<button type="button" class="prod-add ea-control" data-index="3">
																	+<span class="hide">제품 추가</span>
																</button>
																<em data-itemcount-view="3">1</em>
																<button type="button" class="prod-remove ea-control btn-minus" data-index="3">
																	<span class="hide">제품 빼기</span>
																</button>
															</div></li>
	
														<li><input type="hidden" data-count="4" value="1">
															<span>금</span>
															<div class="prd-select-daily">
																<button type="button" class="prod-add ea-control" data-index="4">
																	+<span class="hide">제품 추가</span>
																</button>
																<em data-itemcount-view="4">1</em>
																<button type="button" class="prod-remove ea-control btn-minus" data-index="4">
																	<span class="hide">제품 빼기</span>
																</button>
															</div>
														</li>
	
													</ul>
												</div>
											</li>
										</c:forEach>
									</ul>
									
									<div class="select-daily-amount"
										style="padding: 18px 28px 26px 30px">
										<span>요일별 수량을 선택해주세요.</span>
										<button type="button" id="addProductBtn" class="btn-square"
											style="padding: 0 25px; margin-top: 2px;">상품추가하기</button>
									</div>
								</div>
								
								<div class="checkout-input-area">
									<div class="checkout-input-title-area">
										<h3 class="checkout-input-title">배송정보</h3>
										<button type="button">
											<i class="ico ico-down"></i> <span class="hide">현재화면
												닫기</span>
										</button>
									</div>
									
									<div class="checkout-input-box">
										<div class="prd-cart-all-select">
											<div class="checkbox chk-type3">
												<input type="checkbox" name="chk-same" id="chk-same"
													checked=""> <label for="chk-same">고객정보와 동일</label>
											</div>
											<button id="addressBtn" type="button" class="btn-round2">주소록</button>
										</div>

										<div class="form-input">
											<dl>
												<dt>
													<label for="receiver">받으시는분</label>
												</dt>
												<dd>
													<input type="text" data-receiver="" id="receiver"
														name="orderName" title="이름을 입력하세요" placeholder="이름을 입력하세요"
														value="이지현" data-init="이지현" data-require=""
														data-name="받는사람" maxlength="10">
												</dd>
											</dl>

										</div>
										<div class="form-input">
											<dl>
												<dt>
													<label for="phone">휴대폰번호</label>
												</dt>
												<dd>
													<input type="hidden" id="phone" name="orderPhone"
														maxlength="13" title="휴대폰번호를 입력하세요" data-call-text=""
														placeholder="휴대폰번호를 입력하세요" value="01055234090"
														data-init="01055234090" data-require="" data-name="휴대폰번호">
													<input type="tel" name="_x_orderPhone" maxlength="13"
														title="휴대폰번호를 입력하세요" placeholder="휴대폰번호를 입력하세요"
														value="01055234090" data-init="01055234090"
														data-require="" data-name="휴대폰번호">
												</dd>
											</dl>
										</div>
										<div class="form-input">
											<dl>
												<dt>
													<label for="zipcode">우편번호</label>
												</dt>
												<dd>
													<input id="zipcode" readonly="" name="zipCode"
														title="주소찾기 버튼을 눌러주세요" placeholder="주소찾기 버튼을 눌러주세요"
														value="" data-init="" data-require=""
														style="background: #fff" data-name="우편번호"> <input
														type="hidden" name="orderStreetAddress"
														id="orderStreetAddress" value="">
													<button type="button" id="searchPostcode"
														class="btn-square btn-black">주소찾기</button>
												</dd>
											</dl>
										</div>
										<div class="form-input">
											<dl>
												<dt>
													<label for="addrRoad">주소</label>
												</dt>
												<dd>
													<input type="text" id="addrRoad" name="addrRoad"
														title="주소 입력" placeholder="" readonly="" value=""
														data-init="" data-require="" style="background: #fff"
														data-name="주소">
												</dd>
											</dl>
										</div>
										<div class="form-input">
											<dl>
												<dt>
													<label for="addrDetail">상세주소</label>
												</dt>
												<dd>
													<input type="text" id="addrDetail" name="addrDetail"
														title="상세주소 입력" placeholder="상세주소 입력" value=""
														data-init="" data-require="" data-name="상세주소"
														maxlength="100">
												</dd>
											</dl>
										</div>
										<div class="form-input">
											<dl>
												<dt>
													<label for="memo">배송메모</label>
												</dt>
												<dd>
													<input id="memo" name="orderMemo" title="배송메모를 입력하세요"
														placeholder="배송메모를 입력하세요" value="" data-init="">
												</dd>
											</dl>
										</div>

										<div class="form-input">
											<dl>
												<dt>
													<span>배달장소</span>
												</dt>
												<dd>
													<div class="radio-area radio-type2">
														<div class="radio">
															<input type="radio" value="H" id="deliveryPlaceH"
																name="deliveryPlace"> <label
																for="deliveryPlaceH">가정</label>
														</div>
														<div class="radio">
															<input type="radio" value="O" id="deliveryPlaceO"
																name="deliveryPlace"> <label
																for="deliveryPlaceO">회사/사무실</label>
														</div>
													</div>
												</dd>
											</dl>
										</div>

										<div class="checkbox chk-type3" style="margin-top: 28px">
											<input type="checkbox" id="saveAddrChk" name="saveAddrChk"
												value="Y"> <label for="saveAddrChk">주소록에 저장</label>
										</div>
									</div>
								</div>

								<div class="checkout-input-area" style="padding-bottom: 31px;">
									<div class="checkout-input-title-area">
										<h3 class="checkout-input-title">배송안내</h3>
									</div>
									<div class="checkout-input-box">

										<div class="form-input">
											<dl>
												<dt>
													<label for="input01"> 배송가맹점
														<button type="button" class="btn-question">
															<i class="ico ico-question"></i> <span class="hide">자세한
																내용 보기</span>
															<div class="show-body" title="배송가맹점">
																<ul>
																	<li>입력하신 배송장소 및 주소에 따른 예상 가맹점이며, 실제 배송가맹점과는 상이할 수
																		있습니다.</li>
																	<li>배송장소를 정확히 입력해 주셔야 신속하고 정확하게 배송이 이루어집니다.</li>
																	<li>서울(서초구 우면동), 경기(안양시 만안구, 과천시) 지역은 당분간 가정집 배송이
																		불가합니다.</li>
																	<li>충북(옥천군, 영동군, 보은군)지역은 당분간 배송이 불가합니다.</li>
																	<li>속한 시일 내 정상 배송할 수 있도록 하겠습니다. 고객님의 양해부탁드립니다.</li>
																</ul>
															</div>
														</button>
													</label>
												</dt>
												<dd>
													<input type="text" readonly="" name="prtnName" title=""
														placeholder="배송 장소 선택 및 주소 입력을 해주세요." value=""> <input
														type="hidden" id="officeCode" name="estCd" value="">
													<input type="hidden" id="buTelno" name="officePhoneNumber"
														value="">
												</dd>
											</dl>
										</div>
										<div class="form-input">
											<dl>
												<dt>
													<label for="input02"> 첫 배송 예정일
														<button type="button" class="btn-question">
															<i class="ico ico-question"></i> <span class="hide">자세한
																내용 보기</span>
															<div class="show-body" title="첫 배송일 안내">
																<ul>
																	<li>풀무원녹즙은 주문 생산 방식으로, 첫 배송일은 영업일 기준, 낮 12시 이전 주문
																		시 D+2로 선택 가능합니다. (ex. 월요일 낮 12시 이전 주문 시 수요일 첫배송 가능)</li>
																	<li>실 배송 시작일은 가맹점 사정에 따라 변경될 수 있습니다.</li>
																</ul>
															</div>
														</button>
													</label>
												</dt>
												<dd class="input-util-area" style="position: relative">
													<input type="text" id="ip-datepicker-1" readonly=""
														name="deliveryDate" title="첫 배송 예정일"
														placeholder="첫 배송 예정일" value="2022. 08. 08">
													<button type="button" class="btn-cacalendar"
														style="pointer-events: none; position: absolute; right: 20px;">
														<i class="ico ico-calendar"></i><span class="hide">날짜
															선택하기</span>
													</button>
												</dd>
											</dl>
										</div>

									</div>
								</div>
								<div class="checkout-input-area">
									<div class="checkout-input-title-area">
										<h3 class="checkout-input-title">결제정보</h3>
									</div>
									<div class="select-checkout-area">

										<ul class="nav nav-tabs nav-justified" id="myTab-area"
											role="tablist">
											<li data-code="CARD" class="nav-item" role="presentation">
												<a href="#" class="nav-link active" id="checkout-type-tab1"
												data-target="#checkout-type1" data-toggle="tab"
												data-value="CARD" role="tab" aria-controls="checkout-type1"
												aria-selected="true">
													<img src="/resources/assets/images/ui/checkout-item01.png" alt="">
													<span>카드결제</span>
												</a>
											</li>
											<li data-code="BANK" class="nav-item" role="presentation">
												<a href="#" data-value="BANK" class="nav-link"
												id="checkout-type-tab2" data-target="#checkout-type2"
												data-toggle="tab" role="tab" aria-controls="checkout-type2"
												aria-selected="false">
													<span>계좌결제</span>
												</a>
											</li>
											<li data-code="CASH" class="nav-item" role="presentation">
												<a href="#" data-value="CASH" class="nav-link"
												id="checkout-type-tab3" data-target="#checkout-type3"
												data-toggle="tab" role="tab" aria-controls="checkout-type3"
												aria-selected="false">
													<span>현장결제</span>
												</a>
											</li>
										</ul>
										<div class="tab-content checkout-input-box" id="myTabContent">
											<div class="tab-pane fade show active"
												style="margin-top: 32px;" role="tabpanel"
												id="checkout-type1" aria-labelledby="checkout-type-tab1">
												<div class="input-area">
													<div class="form-input">
														<dl>
															<dt>
																<label for="input01">카드번호</label>
															</dt>
															<dd>
																<input type="text" name="cardNumber" id="card_number"
																	class="numberOnly" maxlength="19" title="카드번호 입력"
																	placeholder="카드번호 입력">
															</dd>
														</dl>
													</div>
													<div class="form-input">
														<dl>
															<dt>
																<label for="input01">생년월일</label>
															</dt>
															<dd>
																<input type="text" id="birthDay" class="numberOnly"
																	maxlength="6" name="birthDay"
																	title="생년월일 입력 (YYMMDD 6자리)"
																	placeholder="생년월일 입력 (예: 990101)" value="">
															</dd>
														</dl>
													</div>
													<div class="form-input">
														<dl>
															<dt>
																<label for="input01">유효기간</label>
															</dt>
															<dd>
																<input type="text" id="validYYMM" name="validYYMM"
																	title="유효기간 입력" placeholder="유효기간 입력 (MM/YY)"
																	maxlength="5" value="">
																<button type="button" id="validCardBtn"
																	class="btn-square btn-black">카드인증</button>
															</dd>
														</dl>
													</div>
												</div>
											</div>
											<div class="tab-pane fade" style="margin-top: 32px;"
												role="tabpanel" id="checkout-type2"
												aria-labelledby="checkout-type-tab2">
												<div class="input-area">
													<div class="form-input">
														<dl>
															<dt>
																<label for="input01">예금주</label>
															</dt>
															<dd>
																<input type="text" id="input01" name="input01"
																	title="예금주 입력" placeholder="" readonly="" value="이지현">
															</dd>
														</dl>
													</div>
													<div class="form-input">
														<dl>
															<dt>
																<label for="bankCode">은행</label>
															</dt>
															<dd>
																<select name="bankCode" id="bankCode"
																	class="form-select form-select-lg"
																	aria-label=".form-select-lg example">
																	<option value="">은행을 선택해주세요.</option>
																	<option value="002">산업은행</option>
																	<option value="003">기업은행</option>
																	<option value="004">국민은행</option>
																	<option value="007">수협중앙회</option>
																	<option value="011">농협은행</option>
																	<option value="020">우리은행</option>
																	<option value="023">SC은행</option>
																	<option value="027">한국씨티은행</option>
																	<option value="031">대구은행</option>
																	<option value="032">부산은행</option>
																	<option value="034">광주은행</option>
																	<option value="035">제주은행</option>
																	<option value="037">전북은행</option>
																	<option value="039">경남은행</option>
																	<option value="045">새마을금고</option>
																	<option value="048">신협중앙회</option>
																	<option value="071">우체국</option>
																	<option value="081">KEB하나은행</option>
																	<option value="088">신한은행</option>
																	<option value="209">유안타증권</option>
																	<option value="240">삼성증권</option>
																</select> <input type="hidden" name="fdCustId" id="fdCustId">
																<input type="hidden" name="cmsId" id="cmsId">
															</dd>
														</dl>
													</div>
													<div class="form-input">
														<dl>
															<dt>
																<label for="accountNumber">계좌번호</label>
															</dt>
															<dd>
																<input type="text" id="accountNumber"
																	name="accountNumber" title="계좌번호 입력"
																	placeholder="계좌번호 입력">
																<button id="callCms" data-isnew="true" data-phone1="010"
																	data-phone2="4090" type="button"
																	class="btn-square btn-black">ARS인증</button>
																<input id="hasRequest" value="false" type="hidden">
															</dd>
														</dl>
														<p id="afterArs"
															style="margin-left: 137px; margin-top: 5px;">인증이
															완료되었습니다.</p>
													</div>
												</div>
											</div>
											<div class="tab-pane fade" role="tabpanel"
												id="checkout-type3" aria-labelledby="checkout-type-tab3">
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="prd-checkout-area creat-checkout2">
								<dl>
									<dt>
										<span>상품 판매가 (4주기준)</span> <b>
											<div class="now-price">
												<b data-price-view="origin">58,000</b> <span>원</span>
											</div>
										</b>
									</dt>
									<dd>
										<span>상품 할인 판매가</span> <b>
											<div class="now-price">
												<b data-price-view="sale" class="">58,000</b> <span>원</span>
											</div>
										</b>
									</dd>
									<dd class="checkout-sum">
										<span>4주 예상 금액</span> <b>
											<div class="now-price">
												<b data-price-view="payment">58,000</b> <span>원</span>
											</div>
										</b>
									</dd>
								</dl>
								<div class="checkbox chk-type4">
									<input type="checkbox" id="agree-11" name="chk-agree-condition">
									<label for="agree-11">구매조건 확인 및 결제진행 동의</label>
								</div>

								<div class="checkout-text"
									style="margin-top: 20px; margin-bottom: 14px;">
									<p>4주 기준 예상 음용 금액으로, 실제 청구 금액과 상이할 수 있습니다.</p>
									<p>4주 음용 이후 별도 중지 요청이 없으실 경우 매일 정기배송이 유지됩니다.</p>
									<p>영업일 기준 3일 이내에 배송 가맹점에서 유선으 로 주문 확인 안내드리며, 가맹점 사정에 따라 달라질 수 있습니다.</p>
									<p>가맹점의 사정으로 주문 변경 및 취소될 수 있습니다.</p>
								</div>

								<button type="button" id="allOrderBtn" class="btn-default">주문신청</button>
							</div>
						</div>
					</div>
				</form>

			</div>
		</main>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>
		
		<div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModal" style="display: none;" aria-hidden="true">
		    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
		        <div class="modal-content">
        		    <div class="modal-header" style="border:0; padding-bottom: 11px">
                		<h5 class="modal-title" id="addProductModalLabel">상품추가</h5>
                		<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
            		</div>
            		
            		<form id="searchForm">
                		<input type="hidden" name="searchType" value="daily">
                		<div class="input-search-bar">
                    		<input name="searchKeyword" placeholder="검색어를 입력하세요">
                    		<button id="productSearch">
                       			<img src="/resources/images/ui/ico-srh02.png">
                    		</button>
                		</div>
            		</form>
            		
            		<div style="margin-bottom:1px; overflow-y: scroll;height: 480px;">
                		<ul class="product-content-list add-popup" id="add-product-targets">
                			<li class="product-add" style="cursor:pointer;" data-available="null" data-addproduct="0071654">
    							<div class="thumb">
    								<img src="/file/download/product/20221108/f1dfce0b-663c-4486-a7a3-188f199ba502.jpg" onerror="this.src='/resources/images/common/no_img.png'" alt="">
    							</div>
    							<div class="contents">
        							<p class="name">위러브플러스<span>(130ml)</span></p>
        							<div class="info">
            							<span class="price"><b>2,900</b> 원</span>
        							</div>
    							</div>
							</li>
						</ul>
						
		                <div style="padding: 0px 20px 20px">
		                    <button id="add-product-more" style="width: 100%" class="btn-default btn-white">더보기</button>
		                </div>
		                
            		</div>
        		</div>
    		</div>
		</div>
		
		<div class="modal" id="addressModal" tabindex="-1" aria-labelledby="addressModal" style="display: none;" aria-hidden="true">
		    <div class="modal-dialog modal-dialog-centered">
		        <div class="modal-content ">
		            <div class="modal-header">
		                <h5 class="modal-title" id="emailPolicyLabel">주소록</h5>
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                </button>
		            </div>
		            <div class="modal-body" style="max-height: 80vh; overflow-y: scroll">
		                <div class="drinking-list address" style="margin: 0">
		                	<div class="item" style="margin: 0 ; border-radius: 0">
						        <div class="head">
						            <div class="nickname-format xl">
						                <label>기본</label>
						                <h5>신림집</h5>
						            </div>
						            <ul class="info" style="margin-top:15px; padding-left:1px;">
						                <li>
						                    <p>이지현</p>
						                </li>
						                <li>
						                    <p>010-5523-4090</p>
						                </li>
						                <li>
						                    <p>(08843) 서울 관악구 문성로32가길 17 201호</p>
						                </li>
						            </ul>
						        </div>
						        <div class="tail">
						            <button type="button" class="adapt-address rounded-button">선택</button>
						        </div>
		    				</div>
		    			</div>
		    		</div>
		            <div style="padding: 20px">
		            	<button class="btn-default btn-white" style="width: 100%">더보기</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>
