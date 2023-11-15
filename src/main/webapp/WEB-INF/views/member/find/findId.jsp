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
					
					<li class="item active">
					
					
						<a href="/member/find/id.do" class="item">
							아이디찾기
						</a>
					</li>
					
					
					<li class="item">
					
						<a href="/member/find/password.do" class="item">
							비밀번호찾기
						</a>
					</li>
				</ul>
		
				
		
				<div class="type-guide-area">
					<div class="caution-unit">
						<span class="mark"></span>
						<h4>아이디를 분실하셨나요?</h4>
						<p class="small">아이디를 찾기 위한 본인인증을 진행해 주세요.</p>
					</div>
					<div class="button-set">
						<!-- <button type="button" id="findIdAuth" class="button-basic primary btn-certify btn-pos w-100" style="height: 69px">본인인증하기</button> -->
						
						<form action="/member/find/id-success.do" method="post" class="w-100">
							<button type="button" id="findIdAuth" class="button-basic primary btn-certify btn-pos w-100" style="height: 69px">본인인증하기</button>
						</form>
					</div>
				</div>
		
				
		
				
			</div>
		</div>
 	</div>
</body>

<script type="text/javascript">
	$("#findIdAuth").on("click", function() {

		$(this).parent().submit();
		
// 		//window.open("[팝업을 띄울 파일명 path]", "[별칭]", "[팝업 옵션]")
// 		var url  = "https://nice.checkplus.co.kr/CheckPlusSafeModel/service.cb?m=authMobileMain";
// 		window.open(url, "mypopup", "width=450, height=250, top=150, left=200");
	
	})
	
		
</script>


</html>
