<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/layouts/head.jsp" %>

<style> /* 카카오 아이디로 로그인 */

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
	
	i {
	    font-style: italic;
	}
	
	.ico {
	    overflow: hidden;
	    position: relative;
	    display: inline-block;
	    background: url(/resources/images/common/ico_sprite_pc.png) no-repeat -10px -10px;
	    background-size: 500px;
	    vertical-align: top;
	}
	
	
	.ico {
	    background-image: none;
	    background-size: 100%;
	    background-position: center;
	    background-repeat: no-repeat;
	    vertical-align: middle;
	    background-color: transparent;
	}
	
	.button-basic.prefix i {
	    width: 30px;
	    height: 30px;
	    margin-right: 16px;
	}
	
	
	.button-basic.kakao i, .basic-big-button.kakao i {
	    background: url(/resources/assets/images/ico_button_kakao.png) no-repeat;
	}



	

</style>

<style> /* 네이버 아이디로 로그인 */

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
	   
    .button-basic.naver i, .basic-big-button.naver i {
	    background: url(/resources/assets/images/ico_button_naver.png) no-repeat;
	}
	
	.button-basic:hover {
	    border-color: #7acc12 !important;
	    transition-duration: .3s;
	}
	
	a, a:hover, a:active {
	    text-decoration: none;
	    color: #333;
	}
</style>

<style> /* 일반 아이디로 회원가입 */

.button-basic.prefix {
    justify-content: flex-start;
    padding: 0 20px;
    align-items: center;
}

.button-basic.prefix i {
    width: 30px;
    height: 30px;
    margin-right: 16px;
}

.button-basic.join {
    background: #fff;
    color: #333;
    border: 1px #e5e5e5 solid;
}

.button-basic.join i {
    background: url(/resources/assets/images/ico_button_char.png) no-repeat;
}

</style>



<style> /* 닫기 버튼 */

	.relative {
		position: relative;
	}

	a, a:hover, a:active {
	    text-decoration: none;
	    color: #333;
	}

	.member-close {
	    width: 33px;
	    height: 33px;
	    display: block;
	    position: absolute;
	    right: 0;
	    top: 40px;
	    background: url("/resources/assets/images/button_layer_close.png") no-repeat;
	}


	.account-wrapper {
	    width: 640px;
	    margin: 0 auto;
	}

	.account-wrapper .account-logo-wrapper {
	    padding-top: 40px;
	    margin-bottom: 40px;
	}

	.account-wrapper .account-logo {
	    display: block;
	    margin: 40px auto 20px;
	    width: 94px;
	    height: 67px;    
	    background: url("/resources/assets/images/main_logo.png") no-repeat;

	}
</style>

<style>
	.account-wrapper .title b {
	    font-weight: 400;
	}

	.account-wrapper .textrow-layout {
	    display: flex;
	    align-items: flex-start;
	    padding: 60px 0;
	}
	
	.account-wrapper .textrow-layout .content {
    	flex: 1;
	}

	.form-input:not(:last-of-type) {
	    margin-bottom: 10px;
	}
	
	.account-wrapper .title {
	    font-size: 24px;
	    line-height: 30px;
	    letter-spacing: -1.8px;
	    color: #333;
	    font-weight: 300;
	    flex: 1;
	}
	
	
	input[type="password"] {
	    letter-spacing: 1px !important;
	}
	
	/* 로그인 버튼 */	
	.button-basic:hover {
	    border-color: #7acc12 !important;
	    transition-duration: .3s;
	    color: #7acc12;
	}
	[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
	    cursor: pointer;
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
	.border {
	    border: 1px solid #dee2e6!important;
	}
	[type=button], [type=reset], [type=submit], button {
	    -webkit-appearance: button;
	}
</style>





<style> /* 로그인과 회원가입용 footer */

.separate-wrapper {
    background: rgba(0,0,0,0.03);
    border-top: 1px #e5e5e5 solid;
    margin-top: 60px;
    padding: 57px 0;
}

.separate-wrapper .icon-list {
    display: flex;
    flex-wrap: wrap;
    margin-top: 26px;
}

.separate-wrapper .icon-list li {
    min-width: 50%;
    flex: 1;
    display: flex;
    align-items: center;
    margin-bottom: 14px;
}

.separate-wrapper .icon-list li .ellipse {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background: #f18a2e;
    display: flex;
    align-items: center;
    justify-content: center;
}

img {
    max-width: 100%;
}

.separate-wrapper .icon-list li p {
    padding-left: 20px;
    font-size: 16px;
    color: #666;
    letter-spacing: -1px;
}


.account-wrapper {
    width: 640px;
    margin: 0 auto;
}

.account-wrapper.lg {
    width: 680px;
    margin: 0 auto;
}


.account-wrapper .title {
    font-size: 24px;
    line-height: 30px;
    letter-spacing: -1.8px;
    color: #333;
    font-weight: 300;
    flex: 1;
}

.account-wrapper .title em {
    font-weight: 500;
    color: #e7740e;
    font-style: normal;
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
<!-- 		<main class="page event"> -->
<!-- 			<div class="container"> -->
<!-- 				현재 위치 :  <br> -->
<!-- 			</div> -->
<!-- 		</main> -->
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
		                    <img src="/resources/assets/images/account_icon01.png">
		                </div>
		                <p>음용할수록 늘어나는 혜택!</p>
		            </li>
		            <li>
		                <div class="ellipse">
		                    <img src="/resources/assets/images/account_icon02.png">
		                </div>
		                <p>가입 후 3,6,9개월마다 쿠폰 혜택!</p>
		            </li>
		            <li style="margin-right: -14px">
		                <div class="ellipse">
		                    <img src="/resources/assets/images/account_icon03.png">
		                </div>
		                <p>배송 일정, 상품 변경을 편하게!</p>
		            </li>
		            <li>
		                <div class="ellipse">
		                    <img src="/resources/assets/images/account_icon04.png">
		                </div>
		                <p>시음 선물은 무제한으로!</p>
		            </li>
		        </ul>
		    </div>
		</div>
		
<%-- 		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %> --%>

 	</div>
</body>
</html>
