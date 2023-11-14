












<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>풀무원 녹즙 </title>
	<meta name="viewport"
	      content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,viewport-fit=cover">
	<!-- 20200306 viewport-fit=cover 추가(아이폰X 이상 화면여백 대응) -->
	<meta name="description" content="하루 한 병 건강한 습관 풀무원녹즙, 신선한 채소와 과일의 영양을 매일 아침 배송합니다.">
	<meta charset="utf-8">
	<meta http-equiv="Content-Script-Type" content="text/javascript">
	<meta http-equiv="Content-Style-Type" content="text/css">
	<meta http-equiv="Content-Security-Policy" content="default-src *; style-src * 'unsafe-inline'; script-src 'self' 'unsafe-inline' 'unsafe-eval' connect.facebook.net www.google-analytics.com www.googletagmanager.com wcs.naver.net t1.daumcdn.net t1.kakaocdn.net stdpay.inicis.com cdn.jsdelivr.net stdux.inicis.com  ; object-src ">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=1200">
	<meta name="viewport" content="width=1200">
	<script async nonce='{SERVER-GENERATED-NONCE}' src="https://www.googletagmanager.com/gtag/js?id=UA-150666346-1"></script>
	<meta property="og:title" content="풀무원 녹즙"/>
	<meta property="og:description" content="하루 한 병 건강한 습관 풀무원녹즙, 신선한 채소와 과일의 영양을 매일 아침 배송합니다."/>
	<meta property="og:type" content="website"/>
	<meta property="og:image" content="https://greenjuice.pulmuone.com/resources/images/og_image.jpg"/>
	
	
	<style type="text/css">
			
		.button-basic.kakao, .basic-big-button.kakao {
		    background: #fee500;
		    color: #181600;
		    border-color: #fee500;
		}
		.button-basic.prefix {
		    justify-content: flex-start;
		    padding: 0 20px;
		    align-items: center;
		}
		.button-basic {
		    display: flex;
		    cursor: pointer;
		    align-items: center;
		    justify-content: center;
		    width: 350px;
		    height: 60px;
		    letter-spacing: -1.65px;
		    border-radius: 20px 0 20px 0;
		    font-size: 18px;
		    font-weight: 400;
		    color: #333;
		    background: #fff;
		    transition-duration: .3s;
		}
		a, a:hover, a:active {
		    text-decoration: none;
		    color: #333;
		}
		*, html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
		    margin: 0;
		    padding: 0;
		    border: 0;
		    vertical-align: baseline;
		    font-style: normal;
		}
		a {
		    color: #007bff;
		    text-decoration: none;
		    background-color: transparent;
		}
		*, ::after, ::before {
		    box-sizing: border-box;
		}
		user agent stylesheet
		a:-webkit-any-link {
		    color: -webkit-link;
		    cursor: pointer;
		    text-decoration: underline;
		}
		body {
		    letter-spacing: -0.5px;
		    font-family: 'Noto Sans KR', 'Apple SD Gothic Neo', 'Malgun Gothic', 'Helvetica Neue', Helvetica, sans-serif;
		    font-weight: 400;
		    font-size: 13px;
		    -webkit-font-smoothing: antialiased !important;
		    -webkit-backface-visibility: hidden;
		    -moz-backface-visibility: hidden;
		    -ms-backface-visibility: hidden;
		}
		body {
		    line-height: 1.4;
		    overflow-x: hidden;
		    background: #fafafa;
		}
		body {
		    margin: 0;
		    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans","Liberation Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
		    font-size: 1rem;
		    font-weight: 400;
		    line-height: 1.5;
		    color: #212529;
		    text-align: left;
		    background-color: #fff;
		}
		:root {
		    --blue: #007bff;
		    --indigo: #6610f2;
		    --purple: #6f42c1;
		    --pink: #e83e8c;
		    --red: #dc3545;
		    --orange: #fd7e14;
		    --yellow: #ffc107;
		    --green: #28a745;
		    --teal: #20c997;
		    --cyan: #17a2b8;
		    --white: #fff;
		    --gray: #6c757d;
		    --gray-dark: #343a40;
		    --primary: #007bff;
		    --secondary: #6c757d;
		    --success: #28a745;
		    --info: #17a2b8;
		    --warning: #ffc107;
		    --danger: #dc3545;
		    --light: #f8f9fa;
		    --dark: #343a40;
		    --breakpoint-xs: 0;
		    --breakpoint-sm: 576px;
		    --breakpoint-md: 768px;
		    --breakpoint-lg: 992px;
		    --breakpoint-xl: 1200px;
		    --font-family-sans-serif: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans","Liberation Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
		    --font-family-monospace: SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",monospace;
		}
		html {
		    font-family: sans-serif;
		    line-height: 1.15;
		    -webkit-text-size-adjust: 100%;
		    -webkit-tap-highlight-color: transparent;
		}
		*, ::after, ::before {
		    box-sizing: border-box;
		}
		*, ::after, ::before {
		    box-sizing: border-box;
		}
	</style>
	
	<style type="text/css">
			.button-set.vertical .button-basic+.button-basic {
			margin-left: 0;
			margin-top: 14px;
		}
		.button-set .button-basic+.button-basic {
			margin-left: 20px;
		}
		.button-set .button-basic+.button-basic {
			margin-left: 20px;
		}
		.button-basic.naver, .basic-big-button.naver {
			background: #fff;
			color: #333;
			border: 1px #e5e5e5 solid;
		}
		.button-basic.prefix {
			justify-content: flex-start;
			padding: 0 20px;
			align-items: center;
		}
		.button-basic:hover {
			border-color: #7acc12 !important;
			transition-duration: .3s;
			color: #7acc12;
		}
		a, a:hover, a:active {
			text-decoration: none;
			color: #333;
		}
		a:hover {
			color: #0056b3;
			text-decoration: underline;
		}
		.button-basic {
			display: flex;
			cursor: pointer;
			align-items: center;
			justify-content: center;
			width: 350px;
			height: 60px;
			letter-spacing: -1.65px;
			border-radius: 20px 0 20px 0;
			font-size: 18px;
			font-weight: 400;
			color: #333;
			background: #fff;
			transition-duration: .3s;
		}
		*, html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
			margin: 0;
			padding: 0;
			border: 0;
			vertical-align: baseline;
			font-style: normal;
		}
		a {
			color: #007bff;
			text-decoration: none;
			background-color: transparent;
		}
		*, ::after, ::before {
			box-sizing: border-box;
		}
		user agent stylesheet
		a:-webkit-any-link {
			color: -webkit-link;
			cursor: pointer;
			text-decoration: underline;
		}
		body {
			letter-spacing: -0.5px;
			font-family: 'Noto Sans KR', 'Apple SD Gothic Neo', 'Malgun Gothic', 'Helvetica Neue', Helvetica, sans-serif;
			font-weight: 400;
			font-size: 13px;
			-webkit-font-smoothing: antialiased !important;
			-webkit-backface-visibility: hidden;
			-moz-backface-visibility: hidden;
			-ms-backface-visibility: hidden;
		}
		body {
			line-height: 1.4;
			overflow-x: hidden;
			background: #fafafa;
		}
		body {
			margin: 0;
			font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans","Liberation Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
			font-size: 1rem;
			font-weight: 400;
			line-height: 1.5;
			color: #212529;
			text-align: left;
			background-color: #fff;
		}
		:root {
			--blue: #007bff;
			--indigo: #6610f2;
			--purple: #6f42c1;
			--pink: #e83e8c;
			--red: #dc3545;
			--orange: #fd7e14;
			--yellow: #ffc107;
			--green: #28a745;
			--teal: #20c997;
			--cyan: #17a2b8;
			--white: #fff;
			--gray: #6c757d;
			--gray-dark: #343a40;
			--primary: #007bff;
			--secondary: #6c757d;
			--success: #28a745;
			--info: #17a2b8;
			--warning: #ffc107;
			--danger: #dc3545;
			--light: #f8f9fa;
			--dark: #343a40;
			--breakpoint-xs: 0;
			--breakpoint-sm: 576px;
			--breakpoint-md: 768px;
			--breakpoint-lg: 992px;
			--breakpoint-xl: 1200px;
			--font-family-sans-serif: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans","Liberation Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
			--font-family-monospace: SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",monospace;
		}
		html {
			font-family: sans-serif;
			line-height: 1.15;
			-webkit-text-size-adjust: 100%;
			-webkit-tap-highlight-color: transparent;
		}
		*, ::after, ::before {
			box-sizing: border-box;
		}
		*, ::after, ::before {
			box-sizing: border-box;
		}
	</style>



</head>
<body>











<!--S:wrapper-->
<div class="wrapper page-screen">










<!--S:container-wrapper -->


<div class="container relative">
    <a class="member-close" href="/"></a>
    <div class="account-wrapper">
        <div class="account-logo-wrapper">
            <a class="account-logo"></a>
        </div>
    </div>
</div>

<div class="container-wrapper member"> <!-- TODO : 회원쪽 페이지들은 <div class="container-wrapper member"> -->












<script type="text/javascript">
  $(document).ready(function () {
    var loginId = localStorage.getItem("memberId");
    var autoLogin = localStorage.getItem("autoLogin");
    if (loginId) {
      $("#loginId").val(loginId);
      $("#rememberId").prop("checked", true);
      $("#loginPwd").focus();
    }
    else {
      $("#loginId").focus();
    }

    if(autoLogin){
        $('input[name=rememberUser]').click();
    }

    $("#loginId, #loginPwd").keyup(function (e) {
      if (e.keyCode == 13) {
        $("#loginBtn").click();
      }
    });

    
    
    const params = Object.fromEntries(new URLSearchParams(location.search));
    const redirectUrl = params.redirectUrl
    const token = params.token;

    $("#loginBtn").click(function () {
      $(".input-text").text("");
      $(".idError,.pwdError").removeClass("input-error");

      $("#loginId").val($.trim($("#loginId").val()));
      $("#loginPwd").val($.trim($("#loginPwd").val()));

      if ($("#loginId").val() == "") {
        $(".idError").addClass("input-error");
        $("#loginIdErrorMsg").text('! ' + message.member.regist.id.empty);
        return false;
      }
      if ($("#loginPwd").val() == "") {
        $(".pwdError").addClass("input-error");
        $("#loginErrorMsg").text('! ' + message.member.regist.password.empty);
        $("#loginPwd").focus();
        return false;
      }
      var body = $("#loginForm").serializeObject();
      console.log(body)
      body.redirectUrl = redirectUrl;
      body.token = token;

      post({
        "url": "/member/login",
        "param": body
      }, function (response) {
        if ($("#rememberId").prop("checked")) {
          localStorage.setItem("memberId", $("#loginId").val());
        } else {
          localStorage.removeItem("memberId");
        }

        if (!!redirectUrl && redirectUrl !== 'undefined') {
          return location.replace(redirectUrl);
        }

        location.replace(response.RESULT_MSG);

      }, function (failResponse) {
        if(failResponse?.RESULT_CODE ==='2000'){
            alert('해당 임시 비밀 번호는 유효 시간 초과로 사용이 불가합니다. 임시 비밀번호 재발급 후 이용해주시기 바랍니다.',function(){
                location.href = '/member/find/password';
            },'임시 비밀번호 받기')
        }else {
        $(".idError,.pwdError").addClass("input-error");
        alert(failResponse.RESULT_MSG.error || failResponse.RESULT_MSG);

        }
      });
    });

    $("#auto-login").click(function (e){
        if(!localStorage.getItem('autoLogin')){
            localStorage.setItem('autoLogin','true');
        }else{
            localStorage.removeItem('autoLogin');
        }
    })

  });
</script>



<div class="separate-wrapper">
    <div class="account-wrapper">
        <h2 class="title">
            <em>오직 풀무원녹즙 회원만!</em><br/>
            회원가입하고 다양한 혜택을 누리세요
        </h2>
        <ul class="icon-list">
            <li>
                <div class="ellipse">
                    <img src="/resources/images/contents/account_icon01.png"/>
                </div>
                <p>음용할수록 늘어나는 혜택!</p>
            </li>
            <li>
                <div class="ellipse">
                    <img src="/resources/images/contents/account_icon02.png"/>
                </div>
                <p>가입 후 3,6,9개월마다 쿠폰 혜택!</p>
            </li>
            <li>
                <div class="ellipse">
                    <img src="/resources/images/contents/account_icon03.png"/>
                </div>
                <p>배송 일정, 상품 변경을 편하게!</p>
            </li>
            <li>
                <div class="ellipse">
                    <img src="/resources/images/contents/account_icon04.png"/>
                </div>
                <p>시음 선물은 무제한으로!</p>
            </li>
        </ul>
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
<div style="display: none" id="mini-side-nav">
	<a href="/mypage/drink/drink"><img src="/resources/images/ui/quick1.png" alt=""></a>
	<a id="quickChangeDrink" href="/mypage/drink/drink"><img src="/resources/images/ui/quick2.png" alt=""></a>
	<a id="quickChangeSchedule" href="/mypage/drink/drink"><img src="/resources/images/ui/quick3.png" alt=""></a>
	<a href="/mypage/drink/bill"><img src="/resources/images/ui/quick4.png" alt=""></a>
	<a href="#"><img src="/resources/images/ui/quickTop.png" alt=""></a>
</div>










</div>











<script type="text/javascript">
	$().ready(function() {
		$("body").on("click", ".ui-dialog-titlebar-close, .ui-icon-closethick", function() {
			$(this).closest(".dialogContent").html("");
		});
	});
</script>

<div id="couponDialog" class="popup pop-main-coupon is-pop-coupon" data-role="dialog" data-width="400">
	<div class="offscreen js-title"></div>
	<div id="couponDialogContent" class="dialogContent p-cont" style="padding-bottom: 0px !important;"></div>
</div>

<div id="popupDialog910" class="popup" data-role="dialog" data-width="910">
	<div class="offscreen js-title"></div>
	<div id="popupDialogContent910" class="dialogContent p-cont" style="padding-bottom: 0px !important;"></div>
</div>

<div id="popupDialog400" class="popup" data-role="dialog" data-width="400">
	<div class="offscreen js-title"></div>
	<div id="popupDialogContent400" class="dialogContent p-cont" style="padding-bottom: 0px !important;"></div>
</div>

<div id="popupDialog480" class="popup" data-role="dialog" data-width="480">
	<div class="offscreen js-title"></div>
	<div id="popupDialogContent480" class="dialogContent p-cont"></div>
</div>

<div id="popupDialogCustomerPopup" class="popup pop-main-customer-num is-pop-coupon" data-role="dialog" data-width="480">
	<div class="offscreen js-title"></div>
	<div id="popupDialogContentCustomerPopup" class="dialogContent p-cont" style="padding-bottom: 0px !important;"></div>
</div>

<div class="popupDialogNoTitleBar" data-role="dialog" data-width="910" data-class="ptitle-noline">
	<div class="offscreen js-title"></div>
	<div id="popupDialogContentNoTitleBar" class="dialogContent p-cont" style="padding-bottom: 0px !important;"></div>
</div>





<form action="https://info.sweettracker.co.kr/tracking/5" target="_blank" style="display: none" id="sweet" method="post">
	<div class="form-group">
		<label for="t_key">API key</label>
		<input type="text" class="form-control" id="t_key" name="t_key" value="eq04nwS5eQul42h6BZig3Q"
		       placeholder="제공받은 APIKEY">
	</div>
	<div class="form-group">
		<label for="t_code">택배사 코드</label>
		<input type="text" class="form-control" name="t_code" id="t_code" placeholder="택배사 코드">
	</div>
	<div class="form-group">
		<label for="t_invoice">운송장 번호</label>
		<input type="text" class="form-control" name="t_invoice" id="t_invoice" placeholder="운송장 번호">
	</div>
	<button type="submit" class="btn btn-default">조회하기</button>
</form>

<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="alertModalLabel"></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
			</div>
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


<div class="modal" id="shareModal" tabindex="-1" aria-labelledby="shareModal" aria-hidden="true">
	<input type="text" style="opacity: 0" id="share_url_input" value="https://greenjuice.pulmuone.com/member/login"/>
	<div class="modal-dialog modal-dialog-centered" style="width:430px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="shareModalLabel">공유하기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body select-wrapper" style="padding:0 30px 30px;">
				<a class="button-basic prefix kakao" style="width:100%;"
				   onclick="shareToKakao('', '')">
					<i class="ico"></i>
					카카오톡으로 공유
				</a>
				<a class="button-basic prefix link" style="width:100%; margin-top:14px;"
				   data-clipboard-target="#share_url_input">
					<i class="ico"></i>
					URL 복사하기
				</a>
			</div>
		</div>
	</div>
</div>

<div class="modal" id="productPreviewModal" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered" style="width:430px;">
		<div class="modal-content modal-product"></div>
	</div>
</div>

<button id="top_move_pointer" class="top-nav">
	<img src="/resources/images/ui/left_short_arrow.png"/>
	<p>TOP</p>
</button>

<script>
  $(window).scroll(function() {
    if ($(window).scrollTop() > 0) {
      if (!$("#top_move_pointer").hasClass("st")) {
        $("#top_move_pointer").addClass("st");
      }
    } else {
      if ($("#top_move_pointer").hasClass("st")) {
        $("#top_move_pointer").removeClass("st");
      }
    }
  })


  $(document).on("click", "#top_move_pointer", function() {
    $(document).scrollTop(0);
  });

</script>

<div class="modal fade" id="privacyPolicy" tabindex="-1" aria-labelledby="privacyPolicy" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="privacyPolicyLabel">개인정보 처리방침</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body" style="border-bottom:6px #fafafa solid;">
				<div class="privacyPolicy" data-idx="1">
					

<style>
    .agree-inner+.agree-inner { margin-top:10px; }
    .agree-wrap .agree-cont ul { padding:5px 0; }
    .agree-wrap .agree-cont ul li { position: relative; padding-left:20px; }
    .agree-wrap .agree-cont ul li:before { content:none; }
    .agree-inner li+li { margin-top:5px; }
    .agree-inner ol li { padding-left:14px; }
    .agree-inner .num { position: absolute; font-size:11px; left:0; top:0px; }
    .agree-cont .agree-inner .agree-title { font-size:18px; padding-bottom:10px; border-bottom:1px #e5e5e5 solid; margin-bottom:10px; }

    .agree-wrap th,td { word-break: break-all; width:auto; color:#333; }
    .agree-wrap table { width:100%; margin-top:10px; border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
    .agree-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
    .agree-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }

</style>



</body>
</html>


<div class="modal" id="loading" tabindex="-1" aria-labelledby="loading" aria-hidden="true" data-keyboard="false"
     data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		</div>
	</div>
</div>

<img src="/resources/images/common/couponGuide.png" style="display: none" id="guideImage" alt="">
