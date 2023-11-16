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

<!-- 결제 API -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<link rel="stylesheet" href="/resources/assets/css/style.css">
</head>
<body>
	<div class="wrapper">

		<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
		<main class="page">
			<div class="container">
			
				<%
					Enumeration<String> en = request.getAttributeNames();
					while(en.hasMoreElements()){
						String key = en.nextElement();
						Object value = request.getAttribute(key);
						value = value.toString();
						out.print(key+" : "+ value +"<br>");
					}
					
					/*
					boxShipRowCnt : 1
					addrBookRowCnt : 1
					boxOrderNo : 20
					boxOrderProductsRowCnt : 1
					boxPayNo : 33
					*/
					
					/* 
					price : 225000
					salePrice : 195000
					discountPrice : -170000
					shppingPrice : 0
					payPrice : 25000
					payMethod : 0
					productsNo : 0073561
					productsCnt : 1
					chk-same : on
					orderName : 임재석
					tel : 010-1234-1234
					zipCode : 63503
					addrRoad : 제주특별자치도 서귀포시 대정읍 대한로 632
					addrDetail : 4층
					orderMemo : 메모메모
					saveAddrChk : on
					couponIdx : 15
					chk-agree-condition : on
					*/
				%>

			</div>
			
		</main>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
 
 	</div>
 	
<script>
	$(function () {
		location.href="/box/order/step2.do?boxOrderNo="+<%=request.getAttribute("boxOrderNo")%>;
	})
</script>
	
</body>
</html>