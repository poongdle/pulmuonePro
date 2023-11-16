<%@ page import="servlets.utils.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String category = request.getParameter("category");
	PageDTO paging = (PageDTO) request.getAttribute("paging");
%>
<%@ include file="/WEB-INF/views/layouts/head.jsp" %>
<body>
	<div class="wrapper">

		<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
		<main class="page faq forum">
			<div class="container">
				<div class="breadcrumb-style">
                    <div class="wrap">
                        <ul>
							<li><a href="/">홈</a></li>
							<li><a href="/forum/faq/list.do">고객기쁨센터</a></li>
							<li><a class="active">배송가능지역 검색</a></li>
						</ul>
                    </div>
                </div>
                
                <div class="page-wrap aside-layout">
					<%@ include file="/WEB-INF/views/layouts/forum/aside.jsp" %>

					<div class="container v1_content_body" style="background-color:rgb(250,250,250);padding-bottom: 120px">


					<!--S:cheader-->
					<div class="border-wrapper">
						<h2 class="container-title">
							배송가능지역 검색
						</h2>
					</div>
					<!--E:cheader-->
					<!--S:cbody-->
					<div class="cbody-wrap">
						<div class="section">
							<div class="cbody-cont">
								<div class="delivery-search-wrap">
									<div class="delivery-inner">
										<i class="ico ico-delivery-area"></i>
										<p class="search-title"><span class="fw-semi-bold">배송 받을 곳 주소</span> 검색</p>
										<p class="search-desc">고객님이 계신 곳을 알려주세요. 녹즙의 신선함을 전해드릴 <span class="fw-semi-bold fc-pos-green">가맹점을 확인</span>해드립니다.</p>
									</div>
									<div class="delivery-ip-wrap">
										<input type="search" id="roadAddress" name="roadAddress" title="배송 받을 곳 주소 입력" placeholder="배송지 검색" readonly="">
										<button type="button" class="btn-delivery-search" onclick="searchPostcode();">
											<i class="ico ico-delivery-search"></i>
											<span class="offscreen">검색</span>
										</button>
									</div>
									<!--s : 주소 조회 결과 -->
									<div class="delivery-result" id="deliveryResult" style="display:none;">
										<h4 class="stitle">검색결과</h4>
										<div class="result-inner">
											<div class="area-type">가정배송 <span class="detail">(주택/아파트)</span></div>
											<div class="address-box" id="homeResult" style="display:none;">
												<span class="store-name" id="hPrtnName"></span>
												<div class="store-info">
													<span class="store-address" id="hPrtnAddr"></span>
													<span class="store-number">
												 <span class="value"><i class="ico ico-phone new-ico-circle"></i><span class="lb" data-call-text="" id="hPrtnTelno"></span></span>
												 <span class="value"><i class="ico ico-mobile new-ico-circle"></i><span class="lb" data-call-text="" id="hPrtnCphnno"></span></span>
											 </span>
												</div>
											</div>
											<!--e : 결과 있는 경우-->
											<!--s : 결과 없는 경우-->
											<div class="address-box no-result" id="homeNoResult" style="display:none;">
												<div class="store-info">
													<i class="ico ico-noti-mid"></i>
													<p class="noresult-desc">
														가맹점에 배송지 정보가 등록되어 있지 않습니다.<br>
														고객센터로 문의해주세요.
														<span class="value"><i class="ico ico-phone new-ico-circle"></i> <span class="lb">080-800-0393</span></span>
													</p>
												</div>
											</div>
											<!--e : 결과 없는 경우-->
										</div>
										<div class="result-inner">
											<div class="area-type">사무실 배송 <span class="detail">(회사/공공기관/상가건물)</span></div>
											<!--s : 결과 있는 경우-->
											<div class="address-box" id="officeResult" style="display:none;">
												<span class="store-name" id="oPrtnName"></span>
												<div class="store-info">
													<span class="store-address" id="oPrtnAddr"></span>
													<span class="store-number">
												<span class="value"><i class="ico ico-phone new-ico-circle"></i><span class="lb" data-call-text="" id="oPrtnTelno"></span></span>
												<span class="value"><i class="ico ico-mobile new-ico-circle"></i><span class="lb" data-call-text="" id="oPrtnCphnno"></span></span>
											</span>
												</div>
											</div>
											<!--e : 결과 있는 경우-->
											<!--s : 결과 없는 경우-->
											<div class="address-box no-result" id="officeNoResult" style="display:none;">
												<div class="store-info">
													<i class="ico ico-noti-mid"></i>
													<p class="noresult-desc">
														가맹점에 배송지 정보가 등록되어 있지 않습니다.<br>
														고객센터로 문의해주세요.
														<span class="value"><i class="ico ico-phone new-ico-circle"></i> <span class="lb">080-800-0393</span></span>
													</p>
												</div>
											</div>
											<!--e : 결과 없는 경우-->
										</div>
									</div>
									<!--e : 주소 조회 결과 -->
								</div>
			
								<div class="no-delivery-wrap" id="noDeliveryWrap" style="display:none;">
									<div class="no-delivery-guide">
										<p class="no-delivery-tit">배송 불가지역 안내</p>
										<span class="no-delivery-desc">당분간 배송이 불가한 지역입니다.</span>
									</div>
									<div class="area-box">
										<p class="area-type">가정배송(주택/아파트)</p>
										<ul class="area-list">
											<!-- <li>서울(서초구 우면동)</li>
			                                <li>경기(안양시 만안구, 과천시)</li> -->
											<li>충북(옥천군, 영동군, 보은군)지역</li>
										</ul>
									</div>
									<div class="area-box">
										<p class="area-type">사무실 배송(회사/공공기관/상가건물)</p>
										<ul class="area-list">
											<li>충북(옥천군, 영동군, 보은군)지역</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--E:cbody-->
				</div>
				</div>
			
			</div>
		</main>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
 
 	</div>

<%@ include file="/WEB-INF/views/ui/modal.jsp" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>

$().ready(function() {
	$("#roadAddress").click(function() {
		searchPostcode();

	});
});

function searchPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; 		 // 참고 항목 변수
			
			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if(data.buildingName !== '' && data.apartment === 'Y'){
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if(extraRoadAddr !== ''){
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			if(fullRoadAddr !== ''){
				fullRoadAddr += extraRoadAddr;
			}
			// 우편번호와 주소 정보를 해당 필드에 넣는다. (구 우편번호 data.postcode)
			$("#roadAddress").val(data.roadAddress);
			
			// 가정배송 / 사무실 배송 결과 영역
			$('#loading').modal('show');
			
		
			let query = data.roadAddress;
			
			$.ajax({
				url:"https://dapi.kakao.com/v2/local/search/address" , 
				dataType:"json",
				type:"GET",
				data: {query },
				cache:false ,
				headers: { Authorization: "KakaoAK 4e3d4720c5bff7fed4972483c92f49fd" },
				success: function ( data,  textStatus, jqXHR ){
					let lat = data.documents[0].y; // 위도 
					let lng = data.documents[0].x; // 경도 
				 	console.log(lat);
				 	console.log(lng); 
				},
				error:function (){
				 alert("에러~~~ ");
				}
			 
			});
			/* get({url : '/search/branch/' + data.zonecode + '/' +data.buildingCode+'', param : {}, duplicate: true}, function(response) {

				// 기존 show요소 hide 처리
				$("#homeResult").hide();
				$("#homeNoResult").hide();
				$("#officeResult").hide();
				$("#officeNoResult").hide();

				// 결과 영역 show
				$("#deliveryResult").show();

				var branchData = JSON.parse(response.RESULT_MSG);

				// 가정배송 영역
				if(branchData.home != undefined) {
					$("#hPrtnName").text(branchData.home.prtnName);
					$("#hPrtnAddr").text(branchData.home.prtnAddr1+" "+branchData.home.prtnAddr2);
					$("#hPrtnTelno").text(branchData.home.buTelno);
					$("#hPrtnCphnno").text(branchData.home.prtnChfCphnno);
					$("#homeResult").show();
				} else if(branchData.home == undefined) {
					$("#homeNoResult").show();
				}
				// 사무실배송 영역
				if(branchData.office != undefined) {
					$("#oPrtnName").text(branchData.office.prtnName);
					$("#oPrtnAddr").text(branchData.office.prtnAddr1+" "+branchData.office.prtnAddr2);
					$("#oPrtnTelno").text(branchData.office.buTelno);
					$("#oPrtnCphnno").text(branchData.office.prtnChfCphnno);
					$("#officeResult").show();
				} else if(branchData.office == undefined) {
					$("#officeNoResult").show();
				}
                
				// '배송 불가 지역 안내 ' 영역 노출
				// $("#noDeliveryWrap").show();
			}); */
			
			console.log(fullRoadAddr);
			console.log(extraRoadAddr);
			
			// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
			if(data.autoRoadAddress) {
				//예상되는 도로명 주소에 조합형 주소를 추가한다.
				var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
				document.getElementById('addr1').value = expRoadAddr;
			}

		}

	}).open();
}
</script>

<script>


</script>

</body>
</html>
