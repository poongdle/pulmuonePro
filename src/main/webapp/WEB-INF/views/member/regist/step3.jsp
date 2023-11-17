<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/layouts/head.jsp" %>
<script src="https://greenjuice.pulmuone.com/resources/plugin/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/resources/assets/js/fdd.js"></script>
<body>

<!--S:wrapper-->
<div class="wrapper">

	<div class="container relative">
	    <a class="member-close" href="/"></a>
	    <div class="account-wrapper">
	        <div class="account-logo-wrapper">
	            <a class="account-logo"></a>
	        </div>
	    </div>
	</div>



	<form id="joinForm" action="/member/regist/step4.do" method="post" >
		<div class="container relative">
			
			<div class="account-wrapper" style="padding-bottom:80px;">
				<ul class="account-process" style="margin-top: 59px">
					<li>
						<h2 class="title" style="height: 76px">
							<b style="margin-right: 3px">01.</b>
							본인인증
						</h2>
						<input type="hidden" name="name" value="${ name }">
						<input type="hidden" name="tel" value="${ tel }">
						<input type="hidden" name="rrnBirthDate" value="${ rrnBirthDate }">
						<input type="hidden" name="rrnGenderCode" value="${ rrnGenderCode }">
					</li>
					<li class="joinform">
						<h2 class="title">
							<b style="margin-right: 3px">02.</b>
							약관동의 / 회원정보 입력
						</h2>
						<input type="hidden" name="memberId" value="${ memberId }">
						<input type="hidden" name="pwd" value="${ pwd }">
						<input type="hidden" name="email" value="${ email }">
						<input type="hidden" name="adApproval" value="${ adApproval }">
						<input type="hidden" name="marketingApproval" value="${ marketingApproval }">
					</li>
					<li class="active">
						<h2 class="title">
							<b>03.</b>
							추천정보
						</h2>
						<div class="form-input">
							<dl>
								<dt>
									<label for="friendId">초대회원코드</label>
								</dt>
								<dd>
									<input type="hidden" id="friendId" name="friendId" value="" />
									<input type="text" id="friendCode" name="friendCode" value="" placeholder="초대코드가 있으신 경우 입력하세요" style="padding-left: 44px">
									<button type="button" id="friendButton" class="btn-square btn-black">확인</button>
								</dd>
							</dl>
							<p id="friendIdError"></p>
						</div>
						<div style='color: red; text-align: center'>초대코드가 없으신 경우 입력하지 않으셔도 됩니다.</div>
						<div class="button-set" style="margin-top: 39px">
							<button id="sendBtn" class="button-basic primary" style="height: 69px; width: 460px">다음으로</button>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
	$(document).ready(function () {
		var friendCodeCheck = false;

		$("#friendCode").keydown(function (e) {
			$("#friendId").val("");
			if (e.keyCode == 13) {
				$("#friendButton").click();
			}
		});
		var  a = false;
		$(document).on("submit", "#joinForm", function (e) {
			e.preventDefault()
			const form = $(this).get(0)
			if(!$("#friendCode").val() || !friendCodeCheck){
            if(!a){
				confirmDesign('',"추천코드는 회원가입 시에만 입력 가능합니다.<br>추천코드 없이 '확인'을 선택하시면 <br>회원 가입이 진행됩니다.",function (){
                    $('#loading').modal('show')
					form.submit();
				})
                a=true;
				return;
			}
            }
            $('#loading').modal('show')
			form.submit();
		});

		$("#friendButton").click(function() {
			$("#friendCode").val( $.trim( $("#friendCode").val() ) );

			// 기존 회원 확인
		    var params = null;
		    params = "invCode="+$("#friendCode").val();   
			$.ajax({
				url:"/member/invCodeCheck.ajax" , 
				dataType:"json",
				type:"POST",
				data: params,
				cache:false ,
				success: function ( data,  textStatus, jqXHR ){
					if( data.memberNo == "0" ) {
						showErrorForm("friendIdError", "올바른 추천코드가 아닙니다.");

					} else {  
	 					showSuccessForm("friendIdError", data.name + "님이 초대하였습니다.");
// 	 					$("#friendId").val(response.RESULT_MSG.recommenderCode+","+response.RESULT_MSG.recommenderId);
	 					$("#friendId").val($("#friendCode").val()+","+data.memberId);
	 					friendCodeCheck = true;
					}
				 
				},
				error:function (){
				 alert("에러~~~ ");
				}
			 
			});

		});

		
		
		if (sessionStorage.getItem("JOIN_KEY")) {
			$("#friendCode").val(sessionStorage.getItem("JOIN_KEY"));
			$("#friendCode").val( $.trim( $("#friendCode").val() ) );
			$("#friendButton").click();
		}
	});
</script>


<div class="modal" id="loading" tabindex="-1" aria-labelledby="loading" aria-hidden="true" data-keyboard="false"
     data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		</div>
	</div>
</div>

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
	<input type="text" style="opacity: 0" id="share_url_input" value="https://greenjuice.pulmuone.com/member/regist/step3"/>
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
<script>
    const prtn = `
가든파이브오피스가맹점<br>
가락오피스가맹점<br>
강동동부오피스가맹점<br>
강동서부오피스가맹점<br>
강동홈가맹점<br>
강릉가맹점<br>
강북오피스가맹점<br>
강북홈가맹점<br>
강서가맹점<br>
강서남부홈가맹점<br>
거제동부가맹점<br>
거제서부가맹점<br>
거창가맹점<br>
경기광주동부가맹점<br>
경기광주서부가맹점<br>
경기시흥오피스가맹점<br>
경산오피스가맹점<br>
경주가맹점<br>
계룡가맹점<br>
고령가맹점<br>
고성가맹점<br>
고창가맹점<br>
고흥가맹점<br>
곡성가맹점<br>
공주가맹점<br>
과천오피스가맹점<br>
과천우면홈가맹점<br>
관악남부오피스가맹점<br>
관악홈가맹점<br>
광명가맹점<br>
광양가맹점<br>
광양읍가맹점<br>
광주광산오피스가맹점<br>
광주광산홈가맹점<br>
광주광천오피스가맹점<br>
광주남구오피스가맹점<br>
광주동구오피스가맹점<br>
광주북구남부오피스가맹점<br>
광주북구북부오피스가맹점<br>
광주상무오피스가맹점<br>
광주서구남구홈가맹점<br>
광주송정오피스가맹점<br>
광주수완오피스가맹점<br>
광주일곡홈가맹점<br>
광주첨단가맹점<br>
광주하남오피스가맹점<br>
광주효천오피스가맹점<br>
광진오피스가맹점<br>
광진홈가맹점<br>
괴산가맹점<br>
구로오피스가맹점<br>
구로홈가맹점<br>
구리오피스가맹점<br>
구리홈가맹점<br>
구미오피스가맹점<br>
구미홈가맹점<br>
군산오피스가맹점<br>
군포북부오피스가맹점<br>
군포오피스가맹점<br>
군포홈가맹점<br>
금천오피스가맹점<br>
기장가맹점<br>
김천가맹점<br>
김포검단홈가맹점<br>
김포서부홈가맹점<br>
김해가맹점<br>
김해북부가맹점<br>
나주오피스가맹점<br>
나주홈가맹점<br>
남양주오피스가맹점<br>
남양주호평홈가맹점<br>
남양주홈가맹점<br>
남원가맹점<br>
남진주가맹점<br>
노원_월계오피스점<br>
노원남부홈가맹점<br>
노원북부홈가맹점<br>
노원오피스가맹점<br>
논산가맹점<br>
논현남부오피스가맹점<br>
논현오피스가맹점<br>
단양가맹점<br>
달성테크노폴리스가맹점<br>
담양가맹점<br>
당진가맹점<br>
대구강북가맹점<br>
대구남구오피스가맹점<br>
대구논공오피스가맹점<br>
대구달서오피스가맹점<br>
대구달서홈가맹점<br>
대구동구동부홈가맹점<br>
대구동구서부홈가맹점<br>
대구동구오피스가맹점<br>
대구동구혁신오피스가맹점<br>
대구북구오피스가맹점<br>
대구북구홈가맹점<br>
대구서구동부오피스가맹점<br>
대구서구오피스가맹점<br>
대구성서홈가맹점<br>
대구수성경산홈가맹점<br>
대구수성서부홈가맹점<br>
대구수성오피스가맹점<br>
대구중구남구홈가맹점<br>
대구중구오피스가맹점<br>
대구화원오피스가맹점<br>
대전대덕가맹점<br>
대전동구가맹점<br>
대전둔산홈가맹점<br>
대전서구남부홈가맹점<br>
대전서구북부오피스가맹점<br>
대전서구오피스가맹점<br>
대전신탄진오피스가맹점<br>
대전유성오피스가맹점<br>
대전유성홈가맹점<br>
대전중구오피스가맹점<br>
대전테크노오피스가맹점<br>
대치개포가맹점<br>
대치도곡홈가맹점<br>
덕양오피스가맹점<br>
덕양홈가맹점<br>
도봉동부 법원오피스점<br>
도봉동부_구청오피스점<br>
도봉동부오피스가맹점<br>
도봉서부오피스가맹점<br>
도봉홈가맹점<br>
동대문오피스가맹점<br>
동대문홈가맹점<br>
동두천오피스가맹점<br>
동두천홈가맹점<br>
동작홈가맹점<br>
동진주가맹점<br>
동탄홈가맹점<br>
동해삼척가맹점<br>
마산합포오피스가맹점<br>
마산홈가맹점<br>
마산회원오피스가맹점<br>
마포동부오피스가맹점<br>
마포서부오피스가맹점<br>
마포홈가맹점<br>
목포산정오피스가맹점<br>
목포오피스가맹점<br>
목포홈가맹점<br>
무안가맹점<br>
문산가맹점<br>
문정오피스가맹점<br>
밀양가맹점<br>
반포사당오피스가맹점<br>
반포홈가맹점<br>
보령가맹점<br>
부산강서가맹점<br>
부산금정오피스가맹점<br>
부산금정홈가맹점<br>
부산남구동부오피스가맹점<br>
부산남구서부오피스가맹점<br>
부산남수영홈가맹점<br>
부산동구오피스가맹점<br>
부산동래오피스가맹점<br>
부산동래홈가맹점<br>
부산북구오피스가맹점<br>
부산북구홈가맹점<br>
부산사상남부오피스가맹점<br>
부산사상북부오피스가맹점<br>
부산사상홈가맹점<br>
부산사하남부가맹점<br>
부산사하북부가맹점<br>
부산서구가맹점<br>
부산수영오피스가맹점<br>
부산연제오피스가맹점<br>
부산연제홈가맹점<br>
부산영도가맹점<br>
부산중구오피스가맹점<br>
부산진구오피스가맹점<br>
부산진구홈가맹점<br>
부산해운대오피스가맹점<br>
부천북부홈가맹점<br>
부천소사오피스가맹점<br>
부천소사홈가맹점<br>
부천오피스가맹점<br>
부천홈가맹점<br>
부평계양홈가맹점<br>
부평오피스가맹점<br>
분당남부오피스가맹점<br>
분당북부오피스가맹점<br>
분당북부홈가맹점<br>
분당중부오피스가맹점<br>
분당중부홈가맹점<br>
사천가맹점<br>
삼천포가맹점<br>
상주가맹점<br>
서귀포가맹점<br>
서김해가맹점<br>
서대문동부오피스가맹점<br>
서대문서부오피스가맹점<br>
서대문홈가맹점<br>
서산오피스가맹점<br>
서산홈가맹점<br>
서인천남부오피스가맹점<br>
서인천남부홈가맹점<br>
서인천북부오피스가맹점<br>
서천가맹점<br>
서초오피스가맹점<br>
서초홈가맹점<br>
서평택가맹점<br>
성남수정오피스가맹점<br>
성남중원오피스가맹점<br>
성남홈가맹점<br>
성동오피스가맹점<br>
성동홈가맹점<br>
성북오피스가맹점<br>
성북홈가맹점<br>
성수오피스가맹점<br>
세종오피스가맹점<br>
세종홈가맹점<br>
속초가맹점<br>
송탄오피스가맹점<br>
송탄홈가맹점<br>
송파남부오피스가맹점<br>
송파동부홈가맹점<br>
송파북부홈가맹점<br>
송파서부홈가맹점<br>
수서오피스가맹점<br>
수원광교홈가맹점<br>
수원권선동부오피스가맹점<br>
수원권선동부홈가맹점<br>
수원권선서부오피스가맹점<br>
수원권선서부홈가맹점<br>
수원영통홈가맹점<br>
수원장안오피스가맹점<br>
수원장안홈가맹점<br>
수원팔달서부오피스가맹점<br>
수원팔달오피스가맹점<br>
수원팔달홈가맹점<br>
순천가맹점<br>
시흥홈가맹점<br>
아산가맹점<br>
안동가맹점<br>
안산단원오피스가맹점<br>
안산상록남부오피스가맹점<br>
안산홈가맹점<br>
안성가맹점<br>
안양동안홈가맹점<br>
안양오피스가맹점<br>
압구정홈가맹점<br>
양산공단오피스가맹점<br>
양산남부홈가맹점<br>
양산덕계가맹점<br>
양산물금오피스가맹점<br>
양산북부홈가맹점<br>
양산서창가맹점<br>
양재오피스가맹점<br>
양천오피스가맹점<br>
양천홈가맹점<br>
언양가맹점<br>
여수가맹점<br>
여수여서가맹점<br>
여수학동가맹점<br>
여의도오피스가맹점<br>
여주가맹점<br>
역삼오피스가맹점<br>
영광가맹점<br>
영등포오피스가맹점<br>
영등포홈가맹점<br>
영암가맹점<br>
영월가맹점<br>
영주가맹점<br>
영천가맹점<br>
예산가맹점<br>
오산가맹점<br>
오창가맹점<br>
완도가맹점<br>
용산오피스가맹점<br>
용산홈가맹점<br>
용인기흥남부오피스가맹점<br>
용인기흥북부오피스가맹점<br>
용인기흥홈가맹점<br>
용인수지동부오피스가맹점<br>
용인수지서부오피스가맹점<br>
용인수지홈가맹점<br>
용인죽전홈가맹점<br>
용인처인가맹점<br>
용인흥덕오피스가맹점<br>
울산남구달동오피스가맹점<br>
울산남구동부홈가맹점<br>
울산남구문수오피스가맹점<br>
울산남구삼산오피스가맹점<br>
울산남구서부홈가맹점<br>
울산남구옥동오피스가맹점<br>
울산동구남목오피스가맹점<br>
울산동구홈가맹점<br>
울산동구화정오피스가맹점<br>
울산북구오피스가맹점<br>
울산북구홈가맹점<br>
울산중구가맹점<br>
울산청량오피스가맹점<br>
원주오피스가맹점<br>
원주홈가맹점<br>
은평오피스가맹점<br>
은평홈가맹점<br>
음성진천가맹점<br>
의령가맹점<br>
의왕오피스가맹점<br>
의왕홈가맹점<br>
의정부오피스가맹점<br>
의정부홈가맹점<br>
이천오피스가맹점<br>
이천홈가맹점<br>
익산동부오피스가맹점<br>
익산북부오피스가맹점<br>
익산서부오피스가맹점<br>
익산중부오피스가맹점<br>
익산홈가맹점<br>
인천남동연수홈가맹점<br>
인천남동오피스가맹점<br>
인천송도홈가맹점<br>
인천연수오피스가맹점<br>
인천중구남구홈가맹점<br>
인천중구오피스가맹점<br>
일산동구홈가맹점<br>
일산북부오피스가맹점<br>
일산서부가맹점<br>
일산중부오피스가맹점<br>
일산중산홈가맹점<br>
장성가맹점<br>
장유가맹점<br>
장흥가맹점<br>
전주덕진오피스가맹점<br>
전주덕진홈가맹점<br>
전주완산오피스가맹점<br>
전주완산홈가맹점<br>
정읍가맹점<br>
제주가맹점<br>
제천가맹점<br>
종로동부오피스가맹점<br>
종로서부오피스가맹점<br>
중구남부오피스가맹점<br>
중구북부오피스가맹점<br>
중랑_면목오피스점<br>
중랑오피스가맹점<br>
중랑홈가맹점<br>
증평가맹점<br>
진량가맹점<br>
진례가맹점<br>
진영가맹점<br>
진주가맹점<br>
진주혁신금산가맹점<br>
진해가맹점<br>
창녕가맹점<br>
창원성산오피스가맹점<br>
창원의창오피스가맹점<br>
천안동남오피스가맹점<br>
천안서북북부오피스대리점<br>
천안서북오피스가맹점<br>
천안홈가맹점<br>
청담오피스가맹점<br>
청주상당오피스가맹점<br>
청주상당홈가맹점<br>
청주서원오피스대리점<br>
청주흥덕오피스가맹점<br>
청주흥덕홈가맹점<br>
춘천오피스가맹점<br>
춘천홈가맹점<br>
충주가맹점<br>
칠곡가맹점<br>
태백가맹점<br>
테헤란오피스가맹점<br>
통영가맹점<br>
파주교하오피스가맹점<br>
파주홈가맹점<br>
판교오피스가맹점<br>
평택오피스가맹점<br>
평택홈가맹점<br>
포항남구오피스가맹점<br>
포항남구홈가맹점<br>
포항북구오피스가맹점<br>
포항북구홈가맹점<br>
포항오피스가맹점<br>
하남오피스가맹점<br>
하남홈가맹점<br>
하동가맹점<br>
함안가맹점<br>
해남가맹점<br>
해운대동부홈가맹점<br>
해운대서부홈가맹점<br>
행신홈가맹점<br>
홍성가맹점<br>
홍천가맹점<br>
화성남양가맹점<br>
화성동부가맹점<br>
화성서부가맹점<br>
화성향남가맹점<br>
화순가맹점<br>
`


    const consumerCorp = `
    스프링 테이블,
마크로밀 엠브레인,
한국갤럽,
이사이트코리아,
아이앤아이마케팅,
와이즈 인사이트
`

    $(function () {
            $('.pop-content').click(function (e) {
                e.preventDefault()
                if ($(this).hasClass('prtn')) {
                    $('#alertModal2').find('.modal-body').html(prtn)
                } else {
                    $('#alertModal2').find('.modal-body').html(consumerCorp)
                }
                $('#alertModal2').modal('show');
            })
            $('#alertModalClose').click(function () {

                $('#alertModal2').modal('hide');
            })
        }
    )
</script>


</body>
</html>
