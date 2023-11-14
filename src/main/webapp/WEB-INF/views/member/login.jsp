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


<style> /* 아이디 입력 칸 */

	input[type="text" i] {
	    writing-mode: horizontal-tb !important;
	    padding-block: 1px;
	    padding-inline: 2px;
	}

	input {
/* 	    font-style: ; */
/* 	    font-variant-ligatures: ; */
/* 	    font-variant-caps: ; */
/* 	    font-variant-numeric: ; */
/* 	    font-variant-east-asian: ; */
/* 	    font-variant-alternates: ; */
/* 	    font-variant-position: ; */
/* 	    font-weight: ; */
/* 	    font-stretch: ; */
/* 	    font-size: ; */
/* 	    font-family: ; */
/* 	    font-optical-sizing: ; */
/* 	    font-kerning: ; */
/* 	    font-feature-settings: ; */
/* 	    font-variation-settings: ; */
	    text-rendering: auto;
	    color: fieldtext;
	    letter-spacing: normal;
	    word-spacing: normal;
	    line-height: normal;
	    text-transform: none;
	    text-indent: 0px;
	    text-shadow: none;
	    display: inline-block;
	    text-align: start;
	    appearance: auto;
	    -webkit-rtl-ordering: logical;
	    cursor: text;
	    background-color: field;
	    margin: 0em;
	    padding: 1px 0px;
	    border-width: 2px;
	    border-style: inset;
	    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
	    border-image: initial;
	    padding-block: 1px;
	    padding-inline: 2px;
	}
		
	button, input, optgroup, select, textarea {
	    font-family: 'Noto Sans KR', 'Apple SD Gothic Neo', 'Malgun Gothic', 'Helvetica Neue', Helvetica, sans-serif;
	    -webkit-font-smoothing: antialiased !important;
	    -webkit-backface-visibility: hidden;
	    -moz-backface-visibility: hidden;
	    -ms-backface-visibility: hidden;
	    margin: 0;
	    font-family: inherit;
	    font-size: inherit;
	    line-height: 1.4;
	    
	}
	
	.form-input input {
	    overflow: hidden;
	    outline: none;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    display: flex;
	    flex: 1;
	    font-size: 16px;
	    letter-spacing: -1.2px;
	    color: #333;
	    padding: 0 22px;
	    height: 100%;
	    font-weight: 400;
	}
	
	.form-input dl {
	    display: flex;
	    flex: 1;
	    align-items: stretch;
	    transition-duration: .2s;
	    border: 1px solid #e5e5e5;
	    background-color: #fff;
	    height: 60px;
	}
	
	.form-input.none-dt dt {
	    display: none;
	}
	
	.form-input dt {
	    min-width: 114px;
	    padding-left: 22px;
	    display: flex;
	}
	
	.form-input dd {
    display: flex;
    flex: 1;
    justify-content: space-between;
    align-items: center;
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

<style> /* 체크박스 */

	.check-type {
	    margin-top: 14px;
	    position: relative;
	    display: flex;
	    align-items: center;
	    height: 32px;
	    margin-bottom: 20px;
	}

	.check-type input {
	    display: none;
	}
	input[type=checkbox], input[type=radio] {
	    box-sizing: border-box;
	    padding: 0;
	
	}
	
	input[type="checkbox" i] {
	    background-color: initial;
	    cursor: default;
	    appearance: auto;
	    box-sizing: border-box;
	    margin: 3px 3px 3px 4px;
	    padding: initial;
	    border: initial;
	}
	
	.check-type span {
	    font-size: 14px;
	    padding-left: 49px;
    }
    
    .check-type input+span:before {
	    position: absolute;
	    left: 0;
	    top: 0;
	    content: '';
	    transition-duration: .2s;
	    width: 32px;
	    height: 32px;
	    border-radius: 50%;
	    background: #e5e5e5 url(/resources/assets/images/ico_check_solo_wt.png) no-repeat center center;
	}
    
   
	
</style>


<style> /* 로그인 버튼 하단 링크 3종*/

	.addiction-button-group {
	    margin-top: 20px;
	    text-align: center;
	}
	
	.addiction-button-group a {
	    line-height: 1;
	    font-size: 14px;
	    color: #666;
	    letter-spacing: -1px;
	    font-weight: 300;
	    padding: 0 20px;
	    display: inline-block;
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
<!-- 				현재 위치 : /WEB-INF/views/member/login.jsp <br> -->
				<br>
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
		        </div>
				
				<br>
				<br>
				<div class="account-wrapper">
					<div class="textrow-layout">
					    <h2 class="title">
			                <b>일반회원</b>으로<br/>
			                로그인합니다.
			            </h2>
			            <div class="content">
							<form action="/member/login.do" method="post">
								<div class="form-input none-dt">
			                        <dl>
			                            <dd>
			                                <input type="text" id="loginId" name="memberId" placeholder="아이디" value="aaaaaaaa"/>
			                            </dd>
			                        </dl>
			                    </div>
			                    <div class="form-input none-dt">
			                        <dl>
			                            <dd>
			                                <input type="password" id="loginPwd" name="pwd" placeholder="비밀번호" autocomplete="off" value="a1234567!"/>
			                            </dd>
			                        </dl>
			                    </div>
			
								<div style="display: flex; flex-direction: row">
									<label class="check-type">
										<input type="checkbox"name="rememberUser" value="Y" /> <span id="auto-login">자동 로그인</span>
									</label> 
									<label class="check-type" style="margin-left: 25px">
										<input type="checkbox" name="rememberId" id="rememberId" value="Y" /> <span>아이디 저장</span>
									</label>
								</div>
								
								<input type="submit" id="loginBtn" class="button-basic border" value="로그인">
								
							</form>
						
							<div class="addiction-button-group">
			                    <a href="/member/regist/type.do">회원가입</a>
			                    <a href="/member/find/id.do">아이디 찾기</a>
			                    <a href="/member/find/password.do">비밀번호 찾기</a>
			                </div>
			        	</div>        
                	</div>
				</div>
<!-- 			</div> -->
<!-- 		</main> -->
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
