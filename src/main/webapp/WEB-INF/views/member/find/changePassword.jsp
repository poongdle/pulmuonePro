<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/layouts/head.jsp" %>
<script src="/resources/assets/js/message.js"></script>
<body>
	<div class="wrapper">

<div class="container relative">
    <a class="member-close" href="/"></a>
    <div class="account-wrapper">
        <div class="account-logo-wrapper">
            <a class="account-logo"></a>
        </div>
    </div>
</div>

<div class="container-wrapper member"> <!-- TODO : 회원쪽 페이지들은 <div class="container-wrapper member"> -->



<form id="infoForm" data-gtm-form-interact-id="0">
	<div class="container relative">
		<div class="breadcrumb-style">
			<div class="container">
				<ul>
					<li><a href="/">홈</a></li>
					<li><a class="active">비밀번호 변경 안내</a></li>
				</ul>
			</div>
		</div>
		<div class="account-wrapper">
			<div class="type-guide-area">
				<div class="caution-unit">
					<span class="mark"></span>
					<h4>
						비밀번호 변경 안내
					</h4>
					<p class="txt">임시비밀번호를 발급받았습니다.</p>
					<p class="small-xs">
						비밀번호를 변경해주세요.
					</p>
				</div>
				<div style="margin-top:20px;">
					<div class="form-input">
						<dl>
							<dt>
								<label>현재 비밀번호</label>
							</dt>
							<dd>
								<input type="password" placeholder="현재 비밀번호" id="nowMemberPwd" name="nowMemberPwd" autocomplete="off" data-gtm-form-interact-field-id="0">
							</dd>
						</dl>
					</div>
					<div class="form-input">
						<dl>
							<dt>
								<label>새 비밀번호</label>
							</dt>
							<dd>
								<input type="password" placeholder="새 비밀번호 (영문/숫자/특수문자 조합 8~20자)" id="memberPwd" name="memberPwd" autocomplete="off" data-gtm-form-interact-field-id="1">
							</dd>
						</dl>
						<p id="memberPwdError"></p>
					</div>
					<div class="form-input">
						<dl>
							<dt>
								<label>새 비밀번호 확인</label>
							</dt>
							<dd>
								<input type="password" placeholder="새 비밀번호 확인" id="memberPwdCheck" name="memberPwdCheck" autocomplete="off">
							</dd>
						</dl>
						<p id="memberPwdCheckError"></p>
					</div>
				</div>
				<div class="button-set">
					<form action="/member/find/changePassword.do" method="get" class="w-100">
						<button type="submit" id="modifyPwdBtn" class="button-basic primary btn-certify">비밀번호 변경</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</form>


<script type="text/javascript">
	$().ready(function() {
		$("#memberPwd").keyup(function(e) {
			var pwd = $(this).val();
			var id = "show2891";
			if ( pwd == "" ) {
				showErrorForm("memberPwdError", message.member.regist.password.empty);
			}
			else if ( pwd.indexOf(" ") > -1 ) {
				showErrorForm("memberPwdError", message.member.regist.password.space);
			}
			else if ( !message.member.regist.password.isFormat(pwd) ) {
				showErrorForm("memberPwdError", message.member.regist.password.format);
			}
			else if ( message.member.regist.password.isConnect(pwd) ) {
				showErrorForm("memberPwdError", message.member.regist.password.connect);
			}
			else if ( pwd.indexOf(id) > -1 ) {
				showErrorForm("memberPwdError", message.member.regist.password.sameId);
			}
			else {
				hideErrorForm("memberPwdError");
			}
		});

		$("#memberPwdCheck").keyup(function(e) {
			var pwdConfirm = $(this).val();
			var pwd = $("#memberPwd").val();

			if ( pwdConfirm == "" ) {
				showErrorForm("memberPwdCheckError", message.member.regist.password.more);
			}
			else if ( pwdConfirm != pwd ) {
				showErrorForm("memberPwdCheckError", message.member.regist.password.notMatch);
			}
			else {
				hideErrorForm("memberPwdCheckError");
			}
		});


		$("#modifyPwdBtn").click(function() {

			$("#memberPwd").val( $.trim( $("#memberPwd").val() ) );
			$("#memberPwdCheck").val( $.trim( $("#memberPwdCheck").val() ) );

			$("#memberPwd").keyup();
			$("#memberPwdCheck").keyup();

			if ( hasError() ) {
				return false;
			}

			post({
				url: "/member/new-password",
				param: $("#infoForm").serialize()
			}, function(response) {
				alert( "비밀번호가 변경되었습니다." ,()=>{location.href='/'});
			}, function(failResponse) {
				var errors = failResponse.RESULT_MSG;
				alert( errors.nowMemberPwdValidation||errors.memberPwdValidation||errors.memberPwdCheckValidation);
				$("#nowMemberPwd").val("");
			});

		});

	});
</script>









</div>
 	</div>
</body>
</html>
