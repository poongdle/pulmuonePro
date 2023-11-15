<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/layouts/head.jsp" %>



<style> /* 상단 영역 */

	[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
	    cursor: pointer;
	}

	[type=button], [type=reset], [type=submit], button {
	    -webkit-appearance: button;
	}
</style>



<body>
	<div class="wrapper">
		<div class="container relative">
			<a class="member-close" href="/"></a>
			<div class="account-wrapper">
				<div class="account-logo-wrapper">
					<a class="account-logo" alt="풀무원녹즙"></a>				
				</div>
			</div>
		</div>
		
		<div class="container relative">
			<div class="account-wrapper">
				<ul class="tab-border-style">
					
					<li class="item">
					
					
						<a href="/member/find/id.do" class="item">
							아이디찾기
						</a>
					</li>
					
					
					<li class="item active">
					
						<a href="/member/find/password.do" class="item">
							비밀번호찾기
						</a>
					</li>
				</ul>
				<form id="findForm" data-gtm-form-interact-id="0">
					<div>
						<div class="reference-area">
							<p>
								선택한 수단으로<br>
								<b>임시비밀번호</b>를 발급합니다.
							</p>
						</div>
						<div class="type-guide-area" style="padding-top: 56px">
							<h5 style="margin-bottom: 27px">비밀번호 발급수단 선택</h5>
							<div class="sns-selector-group">
								<label class="phone item">
									<div class="ico">
										<i></i>
									</div>
									<input type="radio" name="target" value="01023442891" data-gtm-form-interact-field-id="0">
									<p>
										<b>휴대폰</b>
										010-****-2891
									</p>
								</label>
								<label class="mail item" style="padding: 10px 0">
									<div class="ico">
										<i></i>
									</div>
									<input type="radio" name="target" value="show2891@naver.com" data-gtm-form-interact-field-id="1">
									<p>
										<b>이메일</b>
										show2891@test.com
									</p>
								</label>
							</div>
							<div class="button-set" style="margin-top: 28px">
								<form action="/member/find/password-success.do" method="post" class="w-100">
									<button class="button-basic primary w-100" style="height: 69px">임시비밀번호 받기</button>
								</form>
							</div>
						</div>
					</div>
				</form>
		
		
				
		
				
			</div>
		</div>
 	</div>
</body>



</html>
