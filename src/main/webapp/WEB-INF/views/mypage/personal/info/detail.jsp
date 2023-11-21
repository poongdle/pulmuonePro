<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/layouts/head.jsp" %>



<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
		<div class="breadcrumb-style">
			<div class="container">
				<ul>
		            <li><a href="/">홈</a></li>
		            <li><a href="/mypage">MY녹즙</a></li>
		            <li><a class="" href="/mypage/personal/address">개인정보</a></li>
		            <li><a class="active" href="/mypage/personal/info">개인정보관리</a></li>
		        </ul>
			</div>
		</div>
		<div class="container aside-layout main" style="padding-bottom:100px; ">
			<%@ include file="/WEB-INF/views/layouts/mypage/aside.jsp" %>
			<div class="container">
			<div class="border-wrapper">
				<h2 class="container-title">
					개인정보 변경
				</h2>
			</div>
			<div class="box-partition nobox" style="width:640px;">
				<form id="memberForm">
				<input type="hidden" id="myRecommendCode" value="${ invCode }">
				<div class="part" style="padding:10px 0 20px;">
					<div class="part-head">
						<h5>기본정보</h5>
						<button type="button" class="rounded-button black recommendCode">내 추천코드 복사</button>
					</div>
					<div class="form-input">
						<dl>
							<dt>
								<label for="name">이름</label>
							</dt>
							<dd>
								<input type="text" id="name" name="name" value="${ name }" disabled="">
							</dd>
						</dl>
					</div>
					
						<div class="form-input">
							<dl>
								<dt>
									<label for="id">아이디</label>
								</dt>
								<dd>
									<input type="text" id="id" name="id" value="${ auth.getMemberId }" disabled="">
								</dd>
							</dl>
						</div>
					
					<div class="form-input pwdShow">
						<dl>
							<dt>
								<label for="memberPwd">비밀번호</label>
							</dt>
							<dd>
								<input type="password" autocomplete="off" id="memberPwd" name="memberPwd" value="********" disabled="">
								<button type="button" class="btn-square btn-black" id="changePwdBtn">비밀번호변경</button>
							</dd>
						</dl>
					</div>
					<div class="form-input pwdHidden" style="display: none;">
						<div>
							<dl>
								<dt>
									<label for="newPassword">새 비밀번호</label>
								</dt>
								<dd>
									<input autocomplete="off" type="password" id="newPassword" name="newPassword" value="">
								</dd>
							</dl>
						</div>
						<div class="form-input" style="margin-top: 10px">
							<dl>
								<dt>
									<label for="memberPwdConfirm">새 비밀번호 확인</label>
								</dt>
								<dd>
									<input autocomplete="off" type="password" id="memberPwdConfirm" name="memberPwdConfirm" value="">
								</dd>
							</dl>
						</div>
					</div>
					<div class="form-input">
						<dl>
							<dt>
								<label for="phonNum">휴대폰번호</label>
							</dt>
							<dd>
								<input type="text" id="phonNum" name="phonNum" value="${ tel }" disabled="">
							</dd>
						</dl>
					</div>
					<div class="form-input select">
						<dl>
							<dt>
								<label for="email">이메일</label>
							</dt>
							<dd>

								<input type="text" id="email" name="email" value="${ emailId }">
								<span style="margin: 0 5px;padding: 0">@</span>
								<input type="text" id="emailHost" name="emailHost" value="${ emailHost }" style="max-width: 169px">
								<div class="dropdown">
									<a class="btn dropdown-toggle email" href="#" role="button" data-toggle="dropdown" aria-expanded="false">직접입력</a>
									<div class="dropdown-menu">
										<a class="dropdown-item email" data-value="naver.com" href="javascript:void(0)">naver.com</a>
										<a class="dropdown-item email" data-value="daum.net" href="javascript:void(0)">daum.net</a>
										<a class="dropdown-item email" data-value="gmail.com" href="javascript:void(0)">gmail.com</a>
										<a class="dropdown-item email" data-value="nate.com" href="javascript:void(0)">nate.com</a>
										<a class="dropdown-item email" data-value="1" id=" firstEmailSelect" href="javascript:void(0)">직접 입력</a>
									</div>
								</div>
							</dd>
						</dl>
					</div>
					<div class="btn-area-right">
						<button class="rounded-button" type="button" onclick="location.href='/member/quit.do'">회원탈퇴</button>
					</div>
					<span id="errorMark" style="color: #ee1c25;padding-inline: 8px;font-size: 13px;display: none">!</span>
					<span id="emailError" class="message" style="color: #ee1c25;font-size: 13px;"></span>
				</div>
				<div class="part">
					<div class="part-head desc">
						<h5>고객님께 딱 맞는 추천을 위해 알려주세요!</h5>
						<p>
							최근 건강 관심사 어떻게 되시나요?<br>
							(최대 3개까지 선택 가능)
						</p>
					</div>
					<ul class="interest-wrapper">
						<li>
							<label class="interest1">
								<input type="checkbox" class="interest" id="interest1" value="1">
								<div class="item">
									<p>피부미용</p>
								</div>
							</label>
						</li>
						<li>
							<label class="interest2">
								<input type="checkbox" class="interest" id="interest2" value="2">
								<div class="item">
									<p>채소섭취</p>
								</div>
							</label>
						</li>
						<li>
							<label class="interest3">
								<input type="checkbox" class="interest" id="interest3" value="3" data-gtm-form-interact-field-id="0">
								<div class="item">
									<p>간식대용</p>
								</div>
							</label>
						</li>
						<li>
							<label class="interest4">
								<input type="checkbox" class="interest" id="interest4" value="4">
								<div class="item">
									<p>어린아이</p>
								</div>
							</label>
						</li>
						<li>
							<label class="interest5">
								<input type="checkbox" class="interest" id="interest5" value="5" data-gtm-form-interact-field-id="2">
								<div class="item">
									<p>속이편한</p>
								</div>
							</label>
						</li>
						<li>
							<label class="interest6">
								<input type="checkbox" class="interest" id="interest6" value="6" data-gtm-form-interact-field-id="1">
								<div class="item">
									<p>과일섭취</p>
								</div>
							</label>
						</li>
						<li>
							<label class="interest7">
								<input type="checkbox" class="interest" id="interest7" value="7">
								<div class="item">
									<p>비타민 섭취</p>
								</div>
							</label>
						</li>
						<li>
							<label class="interest8">
								<input type="checkbox" class="interest" id="interest8" value="8">
								<div class="item">
									<p>간편한 아침</p>
								</div>
							</label>
						</li>
						<li>
							<label class="interest9">
								<input type="checkbox" class="interest" id="interest9" value="9">
								<div class="item">
									<p>유산균</p>
								</div>
							</label>
						</li>
					</ul>

				</div>
				<div class="part">
					<div class="part-head">
						<h5>SNS연결 관리</h5>
					</div>
					<div class="sns-selector-group toggle-style">

						<div class="kakao item">
							<div class="ico">
								<i></i>
							</div>
							<p>카카오</p>
										<div class="sns-link active">
											<span>연결완료</span>
										</div>
									
						</div>
						<div class="naver item">
							<div class="ico">
								<i></i>
							</div>
							<p>네이버</p>

						</div>
					</div>
				</div>
				<div class="part">
					<div class="flex flex-row">
						<label class="check-type" style="flex:1;">
							<input type="checkbox" id="marketingYn" name="marketingYn" value="Y">
							<span>
							마케팅 수신 동의 (선택)<br>
							<em>다양한 쿠폰, 프로모션 혜택 알림을 받으실 수 있습니다.</em>
						</span>
						</label>
						<button type="button" class="button-text" data-toggle="modal" data-target="#marketingPolicy">내용보기</button>
					</div>
					<div class="flex flex-row">
						<label class="check-type" style="flex:1;">
							<input type="checkbox" id="adYn" name="adYn" value="Y">
							<span>
							광고성 정보 수신 동의 (선택)<br>

						</span>
						</label>
						<button type="button" class="button-text" data-toggle="modal" data-target="#adverPolicy">내용보기</button>
					</div>
					<div class="button-set" style="margin-top:20px;">
						<button type="button" class="button-basic border" onclick="location.href='/mypage/personal/info.do'">
							취소
						</button>
						<button type="button" class="button-basic primary" id="saveBtn">
							저장
						</button>
					</div>
				</div>
			</div>
		</div>
					
			</div> <!-- container aside-layout main -->

		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
		<%@ include file="/WEB-INF/views/ui/footermodal.jsp"%>
 	</div> <!-- wrapper -->
 	
<script>
	$(function () {
	    $("div.item p").each(function(index) {
	        if ($(this).text() != 0) {
	            $("div.item:eq(" + index + ")").parent("li").addClass("active");
	        } // if
	    });
	})
</script>

<script>
$(function () {
$(function () {
$(function () {
$(function () {
	// 미완
	$(".interest[value=\${ interestCode1 }").attr("checked", "checked");
});
});

</script>
});
});

<div class="modal fade" id="marketingPolicy" tabindex="-1" aria-labelledby="marketingPolicyLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="marketingPolicyLabel">마케팅 활용</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				
<script type="text/javascript">
	$().ready(function() {
		// header - 공유버튼 숨김
		$(".sns-share").hide();
	});
</script>

<style>
	.agreement-wrap th,td { word-break: break-all; width:auto; }
	.agreement-wrap table { border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
	.agreement-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
	.agreement-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }
</style>

<div class="container" style="width:100%; min-width:auto; padding:30px;">
	<div class="agreement-wrap">
		<table style="width: 100%">
			<tbody><tr>
				<th>수집•이용 목적</th>
				<th>수집 항목</th>
				<th>보유기간</th>
			</tr>
			<tr>
				<td style="font-weight: bold">

					신상품 홍보 및 맞춤형 광고, 광고성 정보
					(메시지전송)
				</td>
				<td>성명, 휴대전화번호, 생년월일, 성별, 주소</td>
				<td style="font-weight: bold">
					회원 탈퇴 및 동의 철회 시
				</td>
			</tr>
		</tbody></table>
		<p>※ 고객님은 마케팅 활용 동의를 거부할 권리가 있으며, 동의를 거부할 경우 회원가입, 상품구매 등 기본 서비스 이용에는 제한을 받지 않습니다.</p>
	</div>
</div>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="adverPolicy" tabindex="-1" aria-labelledby="adverPolicyLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="adverPolicyLabel">광고성 정보 수신</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				
<script type="text/javascript">
	$().ready(function() {
		// header - 공유버튼 숨김
		$(".sns-share").hide();
	});
</script>

<style>
	.agreement-wrap th,td { word-break: break-all; width:auto; }
	.agreement-wrap table { border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
	.agreement-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
	.agreement-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }
</style>

<div class="container" style="width:100%; min-width:auto; padding:30px;">
	<div class="agreement-wrap">
		<table style="width:100%;">
			<tbody><tr>
				<th>수집•이용 목적</th>
				<th>수집 항목</th>
				<th>보유기간</th>
			</tr>
			<tr>
				<td style="font-weight: bold">
					광고성 정보

					(메시지전송)
				</td>
				<td>휴대전화번호</td>
				<td style="font-weight: bold">
					회원 탈퇴 및 동의 철회 시
				</td>
			</tr>
		</tbody></table>
		<p>※ 고객님은 광고성 정보 수신 동의를 거부할 권리가 있으며, 동의를 거부할 경우 회원가입, 상품구매 등 기본 서비스 이용에는 제한을 받지 않습니다.</p>
	</div>
</div>

			</div>
		</div>
	</div>
</div>



<div class="modal fade" id="marketingPolicy" tabindex="-1" aria-labelledby="marketingPolicyLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="marketingPolicyLabel">마케팅 활용</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				
<script type="text/javascript">
	$().ready(function() {
		// header - 공유버튼 숨김
		$(".sns-share").hide();
	});
</script>

<style>
	.agreement-wrap th,td { word-break: break-all; width:auto; }
	.agreement-wrap table { border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
	.agreement-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
	.agreement-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }
</style>

<div class="container" style="width:100%; min-width:auto; padding:30px;">
	<div class="agreement-wrap">
		<table style="width: 100%">
			<tbody><tr>
				<th>수집•이용 목적</th>
				<th>수집 항목</th>
				<th>보유기간</th>
			</tr>
			<tr>
				<td style="font-weight: bold">

					신상품 홍보 및 맞춤형 광고, 광고성 정보
					(메시지전송)
				</td>
				<td>성명, 휴대전화번호, 생년월일, 성별, 주소</td>
				<td style="font-weight: bold">
					회원 탈퇴 및 동의 철회 시
				</td>
			</tr>
		</tbody></table>
		<p>※ 고객님은 마케팅 활용 동의를 거부할 권리가 있으며, 동의를 거부할 경우 회원가입, 상품구매 등 기본 서비스 이용에는 제한을 받지 않습니다.</p>
	</div>
</div>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="adverPolicy" tabindex="-1" aria-labelledby="adverPolicyLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="adverPolicyLabel">광고성 정보 수신</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				
<script type="text/javascript">
	$().ready(function() {
		// header - 공유버튼 숨김
		$(".sns-share").hide();
	});
</script>

<style>
	.agreement-wrap th,td { word-break: break-all; width:auto; }
	.agreement-wrap table { border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
	.agreement-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
	.agreement-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }
</style>

<div class="container" style="width:100%; min-width:auto; padding:30px;">
	<div class="agreement-wrap">
		<table style="width:100%;">
			<tbody><tr>
				<th>수집•이용 목적</th>
				<th>수집 항목</th>
				<th>보유기간</th>
			</tr>
			<tr>
				<td style="font-weight: bold">
					광고성 정보

					(메시지전송)
				</td>
				<td>휴대전화번호</td>
				<td style="font-weight: bold">
					회원 탈퇴 및 동의 철회 시
				</td>
			</tr>
		</tbody></table>
		<p>※ 고객님은 광고성 정보 수신 동의를 거부할 권리가 있으며, 동의를 거부할 경우 회원가입, 상품구매 등 기본 서비스 이용에는 제한을 받지 않습니다.</p>
	</div>
</div>

			</div>
		</div>
	</div>
</div>



<div class="modal fade" id="marketingPolicy" tabindex="-1" aria-labelledby="marketingPolicyLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="marketingPolicyLabel">마케팅 활용</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				
<script type="text/javascript">
	$().ready(function() {
		// header - 공유버튼 숨김
		$(".sns-share").hide();
	});
</script>

<style>
	.agreement-wrap th,td { word-break: break-all; width:auto; }
	.agreement-wrap table { border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
	.agreement-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
	.agreement-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }
</style>

<div class="container" style="width:100%; min-width:auto; padding:30px;">
	<div class="agreement-wrap">
		<table style="width: 100%">
			<tbody><tr>
				<th>수집•이용 목적</th>
				<th>수집 항목</th>
				<th>보유기간</th>
			</tr>
			<tr>
				<td style="font-weight: bold">

					신상품 홍보 및 맞춤형 광고, 광고성 정보
					(메시지전송)
				</td>
				<td>성명, 휴대전화번호, 생년월일, 성별, 주소</td>
				<td style="font-weight: bold">
					회원 탈퇴 및 동의 철회 시
				</td>
			</tr>
		</tbody></table>
		<p>※ 고객님은 마케팅 활용 동의를 거부할 권리가 있으며, 동의를 거부할 경우 회원가입, 상품구매 등 기본 서비스 이용에는 제한을 받지 않습니다.</p>
	</div>
</div>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="adverPolicy" tabindex="-1" aria-labelledby="adverPolicyLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="adverPolicyLabel">광고성 정보 수신</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				
<script type="text/javascript">
	$().ready(function() {
		// header - 공유버튼 숨김
		$(".sns-share").hide();
	});
</script>

<style>
	.agreement-wrap th,td { word-break: break-all; width:auto; }
	.agreement-wrap table { border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
	.agreement-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
	.agreement-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }
</style>

<div class="container" style="width:100%; min-width:auto; padding:30px;">
	<div class="agreement-wrap">
		<table style="width:100%;">
			<tbody><tr>
				<th>수집•이용 목적</th>
				<th>수집 항목</th>
				<th>보유기간</th>
			</tr>
			<tr>
				<td style="font-weight: bold">
					광고성 정보

					(메시지전송)
				</td>
				<td>휴대전화번호</td>
				<td style="font-weight: bold">
					회원 탈퇴 및 동의 철회 시
				</td>
			</tr>
		</tbody></table>
		<p>※ 고객님은 광고성 정보 수신 동의를 거부할 권리가 있으며, 동의를 거부할 경우 회원가입, 상품구매 등 기본 서비스 이용에는 제한을 받지 않습니다.</p>
	</div>
</div>

			</div>
		</div>
	</div>
</div>



<div class="modal fade" id="marketingPolicy" tabindex="-1" aria-labelledby="marketingPolicyLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="marketingPolicyLabel">마케팅 활용</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				
<script type="text/javascript">
	$().ready(function() {
		// header - 공유버튼 숨김
		$(".sns-share").hide();
	});
</script>

<style>
	.agreement-wrap th,td { word-break: break-all; width:auto; }
	.agreement-wrap table { border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
	.agreement-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
	.agreement-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }
</style>

<div class="container" style="width:100%; min-width:auto; padding:30px;">
	<div class="agreement-wrap">
		<table style="width: 100%">
			<tbody><tr>
				<th>수집•이용 목적</th>
				<th>수집 항목</th>
				<th>보유기간</th>
			</tr>
			<tr>
				<td style="font-weight: bold">

					신상품 홍보 및 맞춤형 광고, 광고성 정보
					(메시지전송)
				</td>
				<td>성명, 휴대전화번호, 생년월일, 성별, 주소</td>
				<td style="font-weight: bold">
					회원 탈퇴 및 동의 철회 시
				</td>
			</tr>
		</tbody></table>
		<p>※ 고객님은 마케팅 활용 동의를 거부할 권리가 있으며, 동의를 거부할 경우 회원가입, 상품구매 등 기본 서비스 이용에는 제한을 받지 않습니다.</p>
	</div>
</div>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="adverPolicy" tabindex="-1" aria-labelledby="adverPolicyLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="adverPolicyLabel">광고성 정보 수신</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				
<script type="text/javascript">
	$().ready(function() {
		// header - 공유버튼 숨김
		$(".sns-share").hide();
	});
</script>

<style>
	.agreement-wrap th,td { word-break: break-all; width:auto; }
	.agreement-wrap table { border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
	.agreement-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
	.agreement-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }
</style>

<div class="container" style="width:100%; min-width:auto; padding:30px;">
	<div class="agreement-wrap">
		<table style="width:100%;">
			<tbody><tr>
				<th>수집•이용 목적</th>
				<th>수집 항목</th>
				<th>보유기간</th>
			</tr>
			<tr>
				<td style="font-weight: bold">
					광고성 정보

					(메시지전송)
				</td>
				<td>휴대전화번호</td>
				<td style="font-weight: bold">
					회원 탈퇴 및 동의 철회 시
				</td>
			</tr>
		</tbody></table>
		<p>※ 고객님은 광고성 정보 수신 동의를 거부할 권리가 있으며, 동의를 거부할 경우 회원가입, 상품구매 등 기본 서비스 이용에는 제한을 받지 않습니다.</p>
	</div>
</div>

			</div>
		</div>
	</div>
</div>



<div class="modal fade" id="marketingPolicy" tabindex="-1" aria-labelledby="marketingPolicyLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="marketingPolicyLabel">마케팅 활용</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				
<script type="text/javascript">
	$().ready(function() {
		// header - 공유버튼 숨김
		$(".sns-share").hide();
	});
</script>

<style>
	.agreement-wrap th,td { word-break: break-all; width:auto; }
	.agreement-wrap table { border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
	.agreement-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
	.agreement-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }
</style>

<div class="container" style="width:100%; min-width:auto; padding:30px;">
	<div class="agreement-wrap">
		<table style="width: 100%">
			<tbody><tr>
				<th>수집•이용 목적</th>
				<th>수집 항목</th>
				<th>보유기간</th>
			</tr>
			<tr>
				<td style="font-weight: bold">

					신상품 홍보 및 맞춤형 광고, 광고성 정보
					(메시지전송)
				</td>
				<td>성명, 휴대전화번호, 생년월일, 성별, 주소</td>
				<td style="font-weight: bold">
					회원 탈퇴 및 동의 철회 시
				</td>
			</tr>
		</tbody></table>
		<p>※ 고객님은 마케팅 활용 동의를 거부할 권리가 있으며, 동의를 거부할 경우 회원가입, 상품구매 등 기본 서비스 이용에는 제한을 받지 않습니다.</p>
	</div>
</div>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="adverPolicy" tabindex="-1" aria-labelledby="adverPolicyLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="adverPolicyLabel">광고성 정보 수신</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				</button>
			</div>
			<div class="modal-body">
				
<script type="text/javascript">
	$().ready(function() {
		// header - 공유버튼 숨김
		$(".sns-share").hide();
	});
</script>

<style>
	.agreement-wrap th,td { word-break: break-all; width:auto; }
	.agreement-wrap table { border-right:1px #eee solid; border-top:1px #eee solid; margin-bottom:15px; }
	.agreement-wrap th { padding:10px; border-bottom:1px #333 solid; border-left:1px #eee solid; }
	.agreement-wrap td { padding:10px; border-bottom:1px #eee solid; border-left:1px #eee solid; }
</style>

<div class="container" style="width:100%; min-width:auto; padding:30px;">
	<div class="agreement-wrap">
		<table style="width:100%;">
			<tbody><tr>
				<th>수집•이용 목적</th>
				<th>수집 항목</th>
				<th>보유기간</th>
			</tr>
			<tr>
				<td style="font-weight: bold">
					광고성 정보

					(메시지전송)
				</td>
				<td>휴대전화번호</td>
				<td style="font-weight: bold">
					회원 탈퇴 및 동의 철회 시
				</td>
			</tr>
		</tbody></table>
		<p>※ 고객님은 광고성 정보 수신 동의를 거부할 권리가 있으며, 동의를 거부할 경우 회원가입, 상품구매 등 기본 서비스 이용에는 제한을 받지 않습니다.</p>
	</div>
</div>

			</div>
		</div>
	</div>
</div>


</body>
</html>
