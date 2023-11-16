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
			%>
			
				<div class="contents-area">
				<div class="container">
					<div class="location">
						<a href="/">홈</a>
						<a href="/cart/box">장바구니</a>
						<a href="#">주문완료</a>
					</div>
					<div class="checkout-complete-area">
						<div class="text-alignC">
							<img src="/resources/assets/images/ui/ico-check-big.png" alt="">
							<strong>주문신청이 완료되었습니다.</strong>
						</div>
						<div class="checkout-complete-info">
							<div class="checkout-complete-text check-com-type2">
								<b>주문정보</b>
								<div class="checkout-complete-info-text">
									<div class="prd-area">
										<span class="thumb">
											<img src="/file/download/product/20221110/94d316cc-9749-41bd-a481-6fb46f3dfdce.png" alt="">
										</span>
										<b class="prd-title" style="text-align: left">제주 유기농 NFC 양배추주스 양배추즙</b>
									</div>
									<ul class="checkout-num-address">
										<li>
											<div>
												<span>주문번호</span>
												<b>13190</b>
											</div>
											<div>
												<span>주문일자</span>
												<b>2023.11.16</b>
											</div>
										</li>
										<li>
											<span>배송지</span>
											<b>
												[08843] 서울 관악구 문성로32가길 17, 201호
											</b>
										</li>
										<li>
											<span>배송메모</span>
											<em></em>
										</li>
									</ul>
								</div>
								<div class="prd-checkout-area creat-checkout2">
									<dl>
										<dt>
											<span>상품 판매가</span>
											<b>
												<div class="now-price total"><em>49,900</em><span>원</span></div>
											</b>
										</dt>
										<dd>
											<span>상품 할인 판매가</span>
											<b>
												<div class="now-price sale"><em class="minus" style="color: black">
													49,900</em><span>원</span></div>
											</b>
										</dd>
										<dd>
											<span>쿠폰 할인 금액</span>
											<b>
												<div class="now-price coupon">
													<em class="">0</em><span>원</span>
												</div>
											</b>
										</dd>
										<dd>
											<span>배송비</span>
											<b>
												<div class="now-price delivery"><em>0</em><span>원</span></div>
											</b>
										</dd>
										<dd style="margin-bottom: 10px;">
											<span>결제수단</span>
											<b style="font-size: 16px; letter-spacing: -1.2px; color: #333; font-weight: 400">가상계좌</b>
										</dd>
										<dd class="checkout-sum" style="margin-top: 16px; margin-bottom: 28px">
											<span style="font-weight: 500">최종결제금액</span>
											<b>
												<div class="now-price sum" style="font-size: 24px; font-weight: 500">
													<em>49,900</em><span>원</span>
												</div>
											</b>
										</dd>
									</dl>
									<div class="btn-area">
										<button style="margin: 0px 14px; height: 60px" type="button" onclick="location.href='/'" class="btn-default btn-white">
											메인으로
										</button>
										<button style="margin: 0px 14px; height: 60px" type="button" onclick="location.href='/mypage/order/box'" class="btn-default">주문내역
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			</div>
		</main>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
 
 	</div>
</body>
</html>