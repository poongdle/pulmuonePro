<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/jspPro/resources/cdn-main/example.js"></script>
</head>
<body>
	<h3>
		main
	</h3>
	<%
		session.setAttribute("auth", "1");
	%>
	<form action="/daily/order/step1.do" method="GET">
        <input type="hidden" name="item" value='{"item":[{"itemCode":"0071654","dayQty":[1,1,1,1,1]}]'>
        <button type="submit">매일배송 주문하기</button>
    </form>
	<form action="/box/order/step1.do" method="GET">
        <input type="hidden" name="productsNo" value="0073561">
		<input type="hidden" name="productsCnt" value="1">
        <button type="submit">택배배송 주문하기</button>
    </form>
	<form action="/taste/order/step1.do" method="GET">
        <input type="hidden" name="giftNo" value='229'>
        <button type="submit">시음선물 주문하기</button>
    </form>
</body>
</html>