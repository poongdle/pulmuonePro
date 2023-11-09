<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>풀무원 녹즙</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/assets/images/pul_favicon.png">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/assets/css/style.css">
<link rel="stylesheet" href="/resources/assets/css/list.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="/resources/assets/js/design.js"></script>
</head>
<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
		<main class="page-dailylist">
		<div class="container full">
		<div class="img-area">				
			<div class="slideshow-container">
				<div class="mySlides fade">
					<div class="numbertext">1 / 5</div>
					<a class="item" href="https://greenjuice.pulmuone.com/product/daily/732" title="제품 상세페이지로 가기" style="background-color: #111111">
				<img src="/file/download//banner/84c3f8d0-5ae5-462b-9fea-cac7bc1d34fd.png" alt="">
					</a>
				</div>
				<div class="mySlides fade">
					<div class="numbertext">2 / 5</div>
					<a class="item" href="https://greenjuice.pulmuone.com/product/search?searchKeyword=%ED%95%B8%EB%94%94%EB%B0%80" title="제품 상세페이지로 가기" style="background-color: #ffffff">
				<img src="/file/download//banner/35b19bec-324b-41d6-812d-cdf8f00eb6cb.png" alt="">
					</a>
				</div>
				<div class="mySlides fade">
					<div class="numbertext">3 / 5</div>
					<a class="item" href="https://greenjuice.pulmuone.com/product/daily?category=&amp;tags=478" title="제품 상세페이지로 가기" style="background-color: #ffffff">
				<img src="/file/download//banner/67c0a15e-a321-4513-8015-a973651fb8e8.png" alt="">
					</a>
				</div>
				<div class="mySlides fade">
					<div class="numbertext">4 / 5</div>
					<a class="item" target="_blank" href="https://greenjuice.pulmuone.com/product/daily/315?eventIdx=" title="제품 상세페이지로 가기" style="background-color: #111111">
				<img src="/file/download//banner/6c036b45-96cf-4189-812a-82f2b36f7bcb.png" alt="">
					</a>
				</div>
				<div class="mySlides fade">
					<div class="numbertext">5 / 5</div>
					<a class="item" href="https://greenjuice.pulmuone.com/product/daily/430" title="제품 상세페이지로 가기" style="background-color: #f7f0d6">
				<img src="/file/download//banner/2b301cd0-0431-47b6-ab77-9c180e55ef96.png" alt="">
					</a>
				</div>
				<button class="arrow left" onclick="changeSlide(-1)">
					<span></span> <span></span>
				</button>				
				<button class="arrow right" onclick="changeSlide(1)">
					<span></span> <span></span>
				</button>
			</div>
	</div>
	<div class="breadcrumb-style" style="padding-top:32px; margin-bottom: 0px;background: #fff">
	<div class="container">
		<ul style="float:right;">
			<li><a>홈</a></li>
			<li><a href="/product/daily" class="active">
					매일배송
			</a></li>
			
		</ul>
	</div>
</div>
<div class="full">
 <c:choose>
       <c:when test="${not empty list }">
         <c:forEach var="dto" items="${list }">
           <tr style="display: block;">                        
             <td>${dto.products_name }</td><br>
             <td>${dto.price }</td><br>
             <td>${dto.products_size }</td><br>
           </tr>
         </c:forEach>      
       </c:when>
       <c:otherwise>
         <tr>
           <td colspan="5">등록된 게시글 없다람쥐.</td>
         </tr>
       </c:otherwise>
     </c:choose>
</div>
	</div>	
	</main>
	<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>
	</div>
	<script type="text/javascript">
		let slideIndex = 0;
		function showSlides(slideIndex) {
			$(".slideshow-container .mySlides").css("display", "none");
			// 	$(".dots span.dot").removeClass("active");
			$(".slideshow-container .mySlides").eq(slideIndex).css("display",
					"block");
			// 	$(".dots span.dot").eq(slideIndex).addClass("active");
		}
		showSlides(slideIndex);
		function changeSlide(value) {
			slideIndex += value;
			if (slideIndex == -1) {
				slideIndex = 2;
			} else if (slideIndex == 5) {
				slideIndex = 0;
			}
			showSlides(slideIndex);
		}
		function dotSlide(value) {
			slideIndex = value;
			showSlides(slideIndex);
		}
	</script>
</body>
</html>
