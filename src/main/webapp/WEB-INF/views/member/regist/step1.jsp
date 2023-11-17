<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/layouts/head.jsp" %>
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

		<div class="container relative">
		    
		    <div class="account-wrapper lg" style="padding-bottom:80px;">
		        <ul class="account-process" style="margin-top: 60px">
		            <li class="active">
		                <h2 class="title" style="height: 76px">
		                    <b style="margin-right: 3px">01.</b>
		                    본인인증
		                </h2>
		                <div class="caution-unit" style="margin: 11px auto 26px">
		                    <span class="mark"></span>
		                    <p style="margin-top: 26px">
		                        가입여부와 실명확인을 위하여<br/>
		                        휴대폰본인인증을 통해 인증해 주세요.
		                    </p>
		                </div>
		
		                <div class="button-set" style="margin: 46px 0 40px"> 
		                	<form action="/member/regist/step2.do" method="post">
<!-- 		                    <button type="button" onclick="javascript:fnPopup();" class="button-basic primary btn-certify" style="width: 460px; height: 69px">실명인증하기 -->
		                    <button type="submit" class="button-basic primary btn-certify" style="width: 460px; height: 69px">실명인증하기
		                    </button>
		                    </form>
		                </div>
		            </li>
		            <li>
		                <h2 class="title" style="height: 80px">
		                    <b style="margin-right: 3px">02.</b>
		                    약관동의 / 회원정보 입력
		                </h2>
		            </li>
		            <li>
		                <h2 class="title">
		                    <b style="margin-right: 3px">03.</b>
		                    추천정보
		                </h2>
		            </li>
		        </ul>
		    </div>
    
		</div>

    
	</div>
	
	
	
	
</div> <!-- wrapper -->

<script type="text/javascript">

	function fnPopup() {
		location.href = "/member/regist/step1.do";

	}
</script>






</body>
</html>
