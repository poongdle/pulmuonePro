<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/layouts/head.jsp" %>
<body>
<!-- 	<div class="wrapper"> -->

<%-- 		<%@ include file="/WEB-INF/views/layouts/header.jsp" %> --%>
<!-- 		<main class="page event"> -->
<!-- 			<div class="container"> -->
<!-- 				페이지 코딩 container class 에 full 클래스 붙히면 width 100% -->
<!-- 			</div> -->
<!-- 		</main> -->
<%-- 		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %> --%>

<!--  	</div> -->

<div class="container relative">
    <div class="account-wrapper">
        <div class="textrow-layout">
            <h2 class="title">
                사용중인 <b>소셜 아이디</b>로<br/>
                로그인합니다.
            </h2>
            <div class="content">
                <div class="button-set vertical">
                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=4631f2522dc407a8035e73aaa5d1bd17&redirect_uri=https://greenjuice.pulmuone.com/sns/kko&response_type=code&scope=account_ci,phone_number,name,birthyear,birthday,gender,account_email&state=%7B%7D" class="button-basic prefix kakao">
                        <i class="ico"></i>
                        카카오 아이디로 로그인
                    </a>
                    <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=i7eb3o1oVsnPsxrI4jQ5&redirect_uri=https://greenjuice.pulmuone.com/sns/naver&state=1209129162018274959608217296717663309111&state=%7B%7D" class="button-basic prefix naver">
                        <i class="ico"></i>
                        네이버 아이디로 로그인
                    </a>
                </div>
            </div>
        </div>
        <div class="textrow-layout">
            <h2 class="title">
                <b>일반회원</b>으로<br/>
                로그인합니다.
            </h2>
            <div class="content">
                <form id="loginForm" action="/member/login" method="post">
                    <input type="hidden" name="directLogin" value="Y">
                    <input type="hidden" name="QrCode" value="">
                    <input type="hidden" name="redirectUrl"
                           value="https://greenjuice.pulmuone.com/"/>

                    <div class="form-input none-dt">
                        <dl>
                            <dt>
                                <label>변경할 애칭</label>
                            </dt>
                            <dd>
                                <input type="text" id="loginId" name="memberId"
                                       placeholder="아이디" />
                            </dd>
                        </dl>
                    </div>
                    <div class="form-input none-dt">
                        <dl>
                            <dt>
                                <label>변경할 애칭</label>
                            </dt>
                            <dd>
                                <input type="password" id="loginPwd" name="memberPwd"
                                       placeholder="비밀번호" autocomplete="off"/>
                            </dd>
                        </dl>
                    </div>
                    <div style="display: flex; flex-direction: row">
                        <label class="check-type">
                            <input type="checkbox" name="rememberUser"
                                   value="Y" />
                            <span id="auto-login">자동 로그인</span>
                        </label>
                        <label class="check-type" style="margin-left: 25px">
                            <input type="checkbox" name="rememberId" id="rememberId"
                                   value="Y" />
                            <span>아이디 저장</span>
                        </label>
                    </div>
                    <div class="button-set vertical">
                        <input type="button" id="loginBtn" class="button-basic border" value="로그인"/>
                    </div>
                    <div class="addiction-button-group">
                        <a href="/member/regist/type">회원가입</a>
                        <a href="/member/find/id">아이디 찾기</a>
                        <a href="/member/find/password">비밀번호 찾기</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>






</body>
</html>
