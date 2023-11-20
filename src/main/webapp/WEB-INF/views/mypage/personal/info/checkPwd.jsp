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

			            <div class="part" style="padding:13px 0 40px;">
			                <div class="part-head" style="margin-bottom:26px;">
			                    <h4 style="line-height:34px;">고객님의 개인정보보호를 위해<br>
			                        비밀번호를 입력해주세요.</h4>
			                </div>
			                <form action="/mypage/personal/info.do" method="post"" id="checkPwd">
				                <div class="form-input disabled">
				                    <dl>
				                        <dt>
				                            <label for="input01">아이디</label>
				                        </dt>
				                        <dd>
				                            <input type="text" id="input01" name="memberId" value="${ auth.getMemberId() }" disabled="">
				                        </dd>
				                    </dl>
				                </div>
				                
				                <div class="form-input">
				                    <dl>
				                        <dt>
				                            <label for="input01">비밀번호</label>
				                        </dt>
				                        <dd>
				                            <input type="password" id="input02" name="pwd" value="">
				                        </dd>
				                    </dl>
				                </div>
			                </form>
			            </div>
			            <div class="part">
			                <div class="button-set b0" style="margin-top:10px;">
			                    <button type="submit" class="basic-big-button primary" id="pwdCheckBtn" form="checkPwd">
			                        확인
			                    </button>
			                </div>
			            </div>
			        </div>
			    </div>
					
			</div> <!-- container aside-layout main -->

		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>

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




</body>
</html>
