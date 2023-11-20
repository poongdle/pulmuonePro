<%@page import="servlets.member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/layouts/head.jsp" %>

<style>


</style>



<body>
		<div class="container relative">
			<a class="member-close" href="/"></a>
			<div class="account-wrapper">
				<div class="account-logo-wrapper">
					<a class="account-logo" alt="풀무원녹즙"></a>				
				</div>
			</div>
		</div>
	<div class="wrapper">
		<div class="container relative">
			<form id="joinForm"  action="/member/regist/step3.do" method="post">
				<input type="hidden" id="duplicateIdCheck">
				<div class="account-wrapper" style="padding-bottom:80px;">
					<ul class="account-process" style="margin-top: 59px">
						<li>
							<h2 class="title" style="height: 76px">
								<b style="margin-right: 3px">01.</b>
								본인인증
							</h2>
							<input type="hidden" name="rrnBirthDate" value="${ rrnBirthDate }">
							<input type="hidden" name="rrnGenderCode" value="${ rrnGenderCode }">
						</li>
						<li class="active joinform">
							<h2 class="title">
								<b style="margin-right: 3px">02.</b>
								약관동의 / 회원정보 입력
							</h2>
							<label class="check-type" style="margin-left:12px; margin-top: 12px; margin-bottom: 13px">
								<input type="checkbox" id="all-check">
								<span style="font-size: 16px; letter-spacing: -1.2px;">풀무원 녹즙 약관 모두 동의</span>
							</label>
							<div class="agree-box" style="padding: 14px 18px 16px 25px">
								<ul>
									<li>
										<label style="height: 24px">
											<input type="checkbox" id="agree1" name="agree1" value="Y" class="agree-check">
											<span>이용약관 동의</span>
										</label>
										<a href="#" data-toggle="modal" data-target="#tosPolicy" style="font-size: 13px;">자세히보기</a>
									</li>
									<li>
										<label style="height: 24px">
											<input type="checkbox" id="agree2" name="agree2" value="Y" class="agree-check">
											<span>개인정보 수집 및 이용동의</span>
										</label>
										<a href="#" data-toggle="modal" data-target="#personalInfo" style="font-size: 13px;">자세히보기</a>
									</li>
									<li>
										<label style="height: 24px">
											<input type="checkbox" name="agree3" value="Y" class="agree-check">
											<span>마케팅 활용동의(선택)</span>
										</label>
										<a href="#" data-toggle="modal" data-target="#marketingPolicy" style="font-size: 13px;">자세히보기</a>
									</li>
									<li>
										<label style="height: 24px">
											<input type="checkbox" name="agree4" value="Y" class="agree-check">
											<span>광고성 정보 수신동의(선택)</span>
										</label>
										<a href="#" data-toggle="modal" data-target="#adverPolicy" style="font-size: 13px;">자세히보기</a>
									</li>
								</ul>
							</div>
							<div class="input-group">
								
								<div class="form-input" style="">
									<dl>
										<dt><label>아이디</label></dt>
										<dd>
											<input type="text" id="memberId" name="memberId" placeholder="아이디 (영문/숫자 조합 6~15자)" maxlength="15">
											<button type="button" id="duplicateCheckId" class="btn-square btn-black">중복확인</button>
										</dd>
									</dl>
									<p id="memberIdError"></p>
								</div>
								<div class="form-input" style="">
									<dl>
										<dt><label>비밀번호</label></dt>
										<dd>
											<input type="password" name="memberPwd" id="memberPwd" placeholder="비밀번호(영문/숫자/특수문자 조합 8~20자)&ZeroWidthSpace;">
										</dd>
									</dl>
									<p id="memberPwdError"></p>
								</div>
								<div class="form-input " style="">
									<dl>
										<dt><label>비밀번호 확인</label></dt>
										<dd>
											<input type="password" name="memberPwdCheck" id="memberPwdCheck" placeholder="비밀번호를 다시 입력해주세요.">
										</dd>
									</dl>
			
								</div>
								
								<div class="form-input" style="">
									<dl>
										<dt><label>이름</label></dt>
										<dd>
											<input type="text" readonly="" name="name" value="${ name }">
										</dd>
									</dl>
								</div>
								<div class="form-input" style="">
									<dl>
										<dt><label>휴대폰번호</label></dt>
										<dd>
											<input type="text" readonly="" name="tel" value="${ tel }">
										</dd>
									</dl>
								</div>
								<div class="form-input select">
									<dl>
										<dt>
											<label for="input01">이메일</label>
										</dt>
										<dd>
											<input type="email" id="email" name="email" value="">
											<div class="dropdown">
												<a class="btn dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
													선택하세요
												</a>
												<div class="dropdown-menu email-host-select">
													<a class="dropdown-item" href="#">naver.com</a>
													<a class="dropdown-item" href="#">daum.net</a>
													<a class="dropdown-item" href="#">hanmail.net</a>
													<a class="dropdown-item" href="#">gmail.com</a>
													<a class="dropdown-item" href="#">nate.com</a>
												</div>
											</div>
										</dd>
									</dl>
								</div>
							</div>
							<div class="button-set" style="margin: 38px 0px 34px">
								<button type="submit" class="button-basic primary" style="height: 69px; width: 460px">다음으로</button>
							</div>
						</li>
						<li>
							<h2 class="title">
								<b>03.</b>
								추천정보
							</h2>
						</li>
					</ul>
				</div>
		
			</form>
		</div>
 	</div>
 	
 	
<script type="text/javascript">
$(document).ready(function () {
	$("#all-check").click(function () {
		var checked = $(this).is(":checked");
		$('input.agree-check').prop("checked", checked);
	})
	$('input.agree-check').click(function () {
		var checked = $('input.agree-check:checked').length === 4;
		$("#all-check").prop("checked", checked);
	})

	$("#memberId").on("input", function () {
		hideErrorForm("memberIdError");
	})

	$("#memberPwd").on("input", function () {
		if ($("#memberPwd").val() && !message.member.regist.password.isFormat($("#memberPwd").val())) {
			showErrorForm("memberPwdError", message.member.regist.password.format);
		} else {
			hideErrorForm("memberPwdError")
		}
	});

	$("#duplicateCheckId").click(function() {
		$("#memberId").val( $.trim( $("#memberId").val() ) );
		if ( $("#memberId").val() == "" ) {
			showErrorForm("memberIdError", message.member.regist.id.empty);
			return false;
		}
		if ( $("#memberId").val().indexOf(" ") > -1 ) {
			showErrorForm("memberIdError", message.member.regist.id.space);
			return false;
		}

		var idFormat = message.member.regist.id.isFormat($("#memberId").val());
		if ( !idFormat ) {
			showErrorForm("memberIdError", message.member.regist.id.format);
			return false;
		}


		// 기존 회원 확인
	    var params = null;
	    params = "memberId="+$("#memberId").val();   
		$.ajax({
			url:"/member/idCheck.ajax" , 
			dataType:"json",
			type:"POST",
			data: params,
			cache:false ,
			success: function ( data,  textStatus, jqXHR ){
				if( data.memberNo == "0" ) {
					console.log("해당 아이디 없음");
					showSuccessForm("memberIdError", message.member.regist.id.ok);
					$("#duplicateIdCheck").val("Y");

				} else {  
					showErrorForm("memberIdError", message.member.regist.id.duplicate);
					$("#duplicateIdCheck").val("N");
				}
			 
			},
			error:function (){
			 alert("에러~~~ ");
			}
		 
		});
	});

	$(".email-host-select>a").click(function (e) {
		var that = $(this);
		that.parents().removeClass("show");

		var input = that.parents(".form-input").find("input[type='email']");
		var text = input.val();
		if (text.indexOf("@") > 0) {
			text = text.substring(0, text.indexOf("@"));
		}

		text += "@" + that.text();
		input.val(text);
		e.preventDefault();
		return false;
	})

	$(document).on("submit", "#joinForm", function (e) {

		if ( !$("#agree1").prop("checked") ) {
			alert( message.member.regist.agree.agree1);
			e.preventDefault();
			return false;
		}
		if ( !$("#agree2").prop("checked") ) {
			alert(message.member.regist.agree.agree2);
			e.preventDefault();
			return false;
		}


		$("#memberId").val( $.trim( $("#memberId").val() ) );
		$("#memberPwd").val( $.trim( $("#memberPwd").val() ) );
		$("#memberPwdCheck").val( $.trim( $("#memberPwdCheck").val() ) );
		$("#email").val( $.trim( $("#email").val() ) );

		$("#memberPwd").keyup();
		$("#memberPwdCheck").keyup();
		$("#email").keyup();


		if ($("#duplicateCheckId").length > 0 && $("#duplicateIdCheck").val() != "Y" ) {
			alert(message.member.regist.id.checkDuplicate);
			e.preventDefault();
			return false;
		}

		if ($("#memberPwd").length) {
			if (!$("#memberPwd").val()) {
				alert("비밀번호는 필수 항목입니다.");
				e.preventDefault();
				return false;
			}

			if (!message.member.regist.password.isFormat($("#memberPwd").val())) {
				alert("비밀번호가 올바르지 않습니다.");
				e.preventDefault();
				return false;
			}


			if ($("#memberPwd").val() !== $("#memberPwdCheck").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				e.preventDefault();
				return false;
			}

		}

		if (!$("#email").val()) {
			alert("이메일은 필수 항목입니다.");
			e.preventDefault();
			return false;
		}

      const phone = "\${ tel }";
      const password = $("#memberPwd").val();
      const email = $("#email").val();
      if(message.member.regist.password.isContainsPersonalInfo(password, phone, email,19871222)){
		 alert("생일 및 전화번호 이메일 아이디는 비밀번호에 포함될 수 없습니다.");
         showErrorForm('memberPwdError', message.member.regist.password.personalInfo);
		 e.preventDefault();
		 return false;

      }
		// return false;

    });
});
</script>
 	
 	
 	
 	
 	
 	
 	
</body>
</html>
