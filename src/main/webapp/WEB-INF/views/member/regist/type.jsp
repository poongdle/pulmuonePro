<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/layouts/head.jsp" %>

<style> /* 로그인 버튼 */	
	

	[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
	    cursor: pointer;

	[type=button], [type=reset], [type=submit], button {
	    -webkit-appearance: button;
	}
</style>




<body>
	<div class="wrapper">

<%-- 		<%@ include file="/WEB-INF/views/layouts/header.jsp" %> --%>
		<div class="container relative">
			<a class="member-close" href="/"></a>
			<div class="account-wrapper">
				<div class="account-logo-wrapper">
					<a class="account-logo" alt="풀무원녹즙"></a>				
				</div>
			</div>
		</div>

		<div class="account-wrapper lg" style="width: 680px">
        <div class="textrow-layout" style="padding-top:40px; margin-bottom: 21px">
            <h2 class="title">
                사용중인 <b>카카오 아이디</b>로<br>
                회원가입합니다.
            </h2>
            <div class="content">
                <div class="button-set vertical">
                    <a class="button-basic prefix kakao" href="/member/regist/social.do?type=K" style="padding: 0 24px; font-size: 16px">
                        <i class="ico" style="margin-right: 19px"></i>
                        카카오 아이디로 회원가입
                    </a>
                </div>
            </div>
        </div>
        <div class="textrow-layout" style="padding-top: 79px">
            <h2 class="title">
                <b>네이버 또는 일반회원</b>으로<br>
                회원가입합니다.
            </h2>
            <div class="content">
                <div class="button-set vertical">
                    <a href="/member/regist/social.do?type=N" class="button-basic prefix naver" style="font-size: 16px">
                        <i class="ico" style="margin-right: 21px"></i>
                        네이버 아이디로 회원가입
                    </a>
                    <a href="/member/regist/step1.do" class="button-basic prefix join" style="font-size: 16px">
                        <i class="ico" style="margin-right: 21px"></i>
                        일반 아이디로 회원가입
                    </a>
                </div>
            </div>
        </div>
    </div>
		<div class="separate-wrapper">
		    <div class="account-wrapper lg">
		        <h2 class="title">
		            <em>오직 풀무원녹즙 회원만!</em><br>
		            회원가입하고 다양한 혜택을 누리세요
		        </h2>
		        <ul class="icon-list">
		            <li style="margin-right: -14px">
		                <div class="ellipse">
		                    <img src="/resources/assets/images/contents/account_icon01.png">
		                </div>
		                <p>음용할수록 늘어나는 혜택!</p>
		            </li>
		            <li>
		                <div class="ellipse">
		                    <img src="/resources/assets/images/contents/account_icon02.png">
		                </div>
		                <p>가입 후 3,6,9개월마다 쿠폰 혜택!</p>
		            </li>
		            <li style="margin-right: -14px">
		                <div class="ellipse">
		                    <img src="/resources/assets/images/contents/account_icon03.png">
		                </div>
		                <p>배송 일정, 상품 변경을 편하게!</p>
		            </li>
		            <li>
		                <div class="ellipse">
		                    <img src="/resources/assets/images/contents/account_icon04.png">
		                </div>
		                <p>시음 선물은 무제한으로!</p>
		            </li>
		        </ul>
		    </div>
		</div>

 	</div>
</body>
</html>
