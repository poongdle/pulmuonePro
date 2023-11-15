<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/layouts/head.jsp" %>

<style> /* 사이드바 + 메인 */



.aside-layout {
    display: flex;
}

.aside {
    min-width: 240px;
    margin-right: 40px;
    flex: 0;
    padding-top: 28px;
}

.aside-layout .container {
    flex: 1;
    width: auto;
    min-width: 920px;
    margin-top: 10px;
}

.aside .title {
    font-size: 32px;
    line-height: 1;
    letter-spacing: -2.4px;
    color: #333;
    font-weight: 500;
    margin-bottom: 20px;
}

.aside .lnb-style {
    border-top: 1px #e5e5e5 solid;
}
ol, ul {
    list-style: none;
}

.aside .lnb-style li {
    border-bottom: 1px #e5e5e5 solid;
}

.aside .lnb-style a {
    cursor: pointer;
    height: 60px;
    display: block;
    align-items: center;
    display: flex;
    font-size: 16px;
    color: #333;
    line-height: 24px;
    letter-spacing: -1.2px;
    font-weight: 400;
    position: relative;
}
a:not([href]):not([class]) {
    color: inherit;
    text-decoration: none;
}

.aside .lnb-style .sub-navigation {
    border-top: 1px #e5e5e5 solid;
    display: none;
}

ol ol, ol ul, ul ol, ul ul {
    margin-bottom: 0;
}


.aside .lnb-style .active a {
    font-weight: 500;
    color: #7acc12;
}

.aside .lnb-style .sub-navigation a {
    height: 50px;
    font-size: 14px;
    color: #666;
    font-weight: 300;
    letter-spacing: -1.05px;
}

.aside .lnb-style .sub-navigation li:last-child {
    border-width: 0;
}



.aside .lnb-style .sub-navigation {
    border-top: 1px #e5e5e5 solid;
    display: none;
}

.aside .lnb-style .active .sub-navigation {
    display: block;
}


.aside .lnb-style .indepth>a:before {
    content: '';
    position: absolute;
    right: 0;
    top: 50%;
    width: 15px;
    height: 8px;
    background: url(/resources/assets/images/arrow_lnb.png) no-repeat;
    transform: translateY(-50%) rotate(180deg);
    transition-duration: .2s;
    opacity: .5;
}

.aside .lnb-style .indepth.active>a:before {
    transform: translateY(-50%) rotate(0deg);
    transition-duration: .2s;
    opacity: 1;
}



/* a:not([href]):not([class]):hover { */
/*     color: inherit; */
/*     text-decoration: none; */
/* } */


</style>
<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
		
		<div class="container aside-layout main" style="padding-bottom:100px; ">
				
			<div class="aside" id="mypage_lnb">
			    <h2 class="title">MY녹즙</h2>
			    <ul class="lnb-style">
			        <li class="indepth">
			        	<a>매일배송 음용내역</a>
			            <ul class="sub-navigation">
			                <li><a href="/mypage/drink/drink.do">음용내역</a></li>
			                <li><a href="/mypage/drink/bill.do">영수증조회</a></li>
			            </ul>
			        </li>
			        <li>
			            <a href="/mypage/order/box.do">택배배송 주문내역</a>
			        </li>
			        <li>
			            <a href="/mypage/benefit/taste.do">시음선물내역</a>
			        </li>
			        <li>
			            <a href="/mypage/benefit/coupon.do">쿠폰</a>
			        </li>
			        <li class="indepth">
			            <a>활동정보</a>
			            <ul class="sub-navigation">
			                <li><a href="/mypage/action/interest.do">찜한상품</a></li>
			                <li><a href="/mypage/action/counsel.do">1:1 문의</a></li>
			                <li><a href="/mypage/action/review.do">리뷰</a></li>
			            </ul>
			        </li>
			        <li class="indepth">
			            <a>개인정보</a>
			            <ul class="sub-navigation">
			                <li><a href="/mypage/personal/address.do">주소록</a></li>
			                <li><a href="/mypage/personal/info.do">개인정보 변경</a></li>
			                <li><a href="/mypage/drink/paymethod.do">결제수단 관리</a></li>
			                <li><a href="/mypage/personal/refund.do">환불계좌 관리</a></li>
			            </ul>
			        </li>
			    </ul>
			</div>
			<script>
			  $(document).on("click", "#mypage_lnb .indepth>a", function (e) {
			    var parent = $(this).parents("li");
			    if (parent.hasClass("active")) {
			      parent.removeClass("active");
			    } else {
			      parent.addClass("active");
			    }
			    e.preventDefault();
			    return false;
			  });
			  $(document).ready(function () {
			    var item = undefined;
			    $("#mypage_lnb .sub-navigation a").each(function (ix, elem) {
			      var el = $(elem);
			      if (location.pathname.startsWith(el.attr("href")) && !item) {
			        item = el;
			      }
			    })
			    if (!item) {
			      $("#mypage_lnb .lnb-style>li>a").each(function (ix, elem) {
			        var el = $(elem);
			        if (el.attr("href") && location.pathname.startsWith(el.attr("href")) && !item) {
			          item = el;
			        }
			      })
			    }
			    if (item) {
			      item.parents("li").addClass("active");
			      item.parents(".indepth").addClass("active");
			    }
			  })
			</script>
			
					<div class="container">
						<h2 class="container-title light">
							<b>${ auth.getName() }</b>님 안녕하세요
						</h2>
						<ul class="stat-wrapper">
									<li>
										<a href="/mypage/drink/drink" class="item">
											<label>매일배송</label>
											<span>1</span>
										</a>
									</li>
								
									<li class="dim">
										<a href="/mypage/order/box" class="item">
											<label>택배배송</label>
											<span style="color: #333;border-bottom: 1px solid #7acc12">2</span>
										</a>
									</li>
								
							<li>
								
									
									
										<a href="/taste/taste" class="item">
											<label>시음선물</label>
											<span class="blank_copy">선물해보세요</span>
										</a>
									
								
							</li>
							<li>
								
									
									
										<a href="/event/event/view/friends" class="item">
											<label>쿠폰</label>
											<span class="blank_copy">친구초대하고 쿠폰받으세요</span>
										</a>
									
								
							</li>
							
								
									<li>
										<a href="/mypage/action/review" class="item">
											<label>리뷰</label>
											<span>5</span>
										</a>
									</li>
								
								
							
							
								
								
									<li>
										<a href="/mypage/action/counsel" class="item">
											<label>1:1 문의</label>
											<span style="border-bottom: none;color: #999">0</span>
										</a>
									</li>
								
							
						</ul>
			
			
			
						<div class="box-partition">
							<div class="part">
								<div class="part-head" style="margin-bottom:17px;">
									<a href="/mypage/drink/drink">
										매일배송 음용정보
									</a>
								</div>
								
									
										<div class="box-layout" style="margin-bottom:6px;">
											<div>
												<div class="half-area nickname-format">
													
														<label>기본</label>
													
													<h5>음용1</h5>
													<span>230000234094</span>
												</div>
												<a href="/mypage/drink/drinks/230000234094/23812" class="rounded-button">상세보기</a>
											</div>
											<div style="padding:20px 25px 20px 0;">
												<div class="half-area">
													<ul class="document-style">
														<li>
															<label style="font-weight:500">담당 가맹점</label>
															<p>서초홈가맹점</p>
														</li>
													</ul>
												</div>
												<div class="half-area end">
													<ul class="addiction-info">
														<li class="tel">
															<label></label>
															<p data-call-text="">02-547-0519</p>
														</li>
														<li style="margin-left:30px;" class="phone">
															<label></label>
															<p data-call-text="">010-3899-4569</p>
														</li>
													</ul>
												</div>
											</div>
										</div>
									
									
								
			
							</div>
							<div class="part" style="border-bottom: none;padding-bottom: 35px">
								<div class="part-head" style="margin-bottom: 16px;">
									<a href="/mypage/order/box">
										택배배송 주문내역
									</a>
								</div>
									<ul class="delivery-process">
										<li class="">
											<div class="item">
												<div class="thumb">
													<img src="/resources/images/common/ico_delivery_process_img01.png">
												</div>
												<p>0</p>
												<span>결제완료</span>
											</div>
										</li>
										<li class="">
											<div class="item">
												<div class="thumb">
													<img src="/resources/images/common/ico_delivery_process_img02.png">
												</div>
												<p>0</p>
												<span>배송준비중</span>
											</div>
										</li>
										<li class="">
											<div class="item">
												<div class="thumb">
													<img src="/resources/images/common/ico_delivery_process_img03.png">
												</div>
												<p>0</p>
												<span>배송중</span>
											</div>
										</li>
										<li class="active">
											<div class="item">
												<div class="thumb">
													<img src="/resources/images/common/ico_delivery_process_img04.png">
												</div>
												<p>1</p>
												<span>배송완료</span>
											</div>
										</li>
									</ul>
							</div>
							
							<table class="basic-table-style cell-narrow" style="margin-top:8px;">
								<thead></thead>
								<colgroup>
									<col width="147">
									<col width="*">
									<col width="127">
									<col width="63">
									<col width="130">
									<col width="120">
								</colgroup>
								<tbody>
									<tr>
										<th class="t-left">주문번호</th>
										<th class="t-left">상품명</th>
										<th>결제금액</th>
										<th>주문일자</th>
										<th>주문상태</th>
										<th>상세보기</th>
									</tr>
									<tr style="border-radius: 10px">
										<td class="t-left">13024</td>
										<td class="t-left">프레시업 5가지맛 혼합 7입 </td>
										<td>30,700 원</td>
										<td>2023-10-27</td>
										<td><b>배송완료</b></td>
										<td>
											<a href="/mypage/order/box/13024" class="rounded-button sm">상세보기</a>
										</td>
									</tr>
									<tr style="border-radius: 10px">
										<td class="t-left">13021</td>
										<td class="t-left">프레시업 5가지맛 혼합 7입 </td>
										<td>30,700 원</td>
										<td>2023-10-26</td>
										<td><b>주문취소</b></td>
										<td>
											<a href="/mypage/order/box/13021" class="rounded-button sm">상세보기</a>
										</td>
									</tr>
								</tbody>
							</table>
							
						</div>
					</div>
					
			</div> <!-- container aside-layout main -->


<!-- 		<main class="page event"> -->
<!-- 			<div class="container"> -->
<!-- 				/WEB-INF/views/mypage/userSummary.jsp -->
			
<!-- 			</div> -->
<!-- 		</main> -->
		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>

 	</div>
</body>
</html>
