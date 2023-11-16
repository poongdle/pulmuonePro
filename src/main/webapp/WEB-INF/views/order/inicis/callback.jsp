<%@page import="servlets.member.service.MemberService"%>
<%@page import="servlets.member.dao.MemberDAO"%>
<%@page import="servlets.member.dao.MemberDAOImpl"%>
<%@page import="auth.AuthInfo"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>풀무원 녹즙</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="/resources/assets/images/pul_favicon.png">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="/resources/assets/js/design.js"></script>
<link rel="stylesheet" href="/resources/assets/css/style.css">
</head>
<body>
	<div class="wrapper">

		<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
		<main class="page">
			<div class="container">
			
				<%
					Enumeration<String> en = request.getParameterNames();
					while(en.hasMoreElements()){
						String key = en.nextElement();
						String value = request.getParameter(key);
						out.print(key+" : "+ value +"<br>");
					}
					

					AuthInfo member = (AuthInfo) session.getAttribute("auth");
					int memberNo = member.getMemberNo();
					String memberName = member.getName();
					
					MemberService service = new MemberService();
					
					/* 
					payMethod : Card
					payPrice : 195000
					chk-same : on
					orderName : 임재석
					zipCode : 06734
					addrRoad : 서울 서초구 남부순환로347길 23
					addrDetail : 4층
					orderMemo : 사무실
					chk-agree-condition : on
					*/
				%>

			</div>
		</main>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
 
 	</div>
 	
 	<script>
		$(function () {
			IMP.init(imp68572824);	// 가맹점 식별코드
			IMP.request_pay({
					    pg : 'inicis'
					    , pay_method : ${ param.payMethod }
					    , merchant_uid : 'merchant_' + new Date().getTime()
					    , name : ${ param.memberName }
					    , amount : ${ param.payPrice }
					    , buyer_email : 'iamport@siot.do'
					    , buyer_name : ${ param.orderName }
					    , buyer_tel : '010-1234-5678'/*구매자 연락처*/
					    , buyer_addr : '서울특별시 강남구 삼성동'/*구매자 주소*/
					    , buyer_postcode : '123-456'/*구매자 우편번호*/
					}, function(rsp) {
						var result = '';
					    if ( rsp.success ) {
					        var msg = '결제가 완료되었습니다.';
					        msg += '고유ID : ' + rsp.imp_uid;
					        msg += '상점 거래ID : ' + rsp.merchant_uid;
					        msg += '결제 금액 : ' + rsp.paid_amount;
					        msg += '카드 승인번호 : ' + rsp.apply_num;
					        result ='0';
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					        result ='1';
					    }
					    if(result=='0') {
					    	location.href= $.getContextPath()+"/Cart/Success";
					    }
					    alert(msg);
					});
		})
	</script>
	
</body>
</html>