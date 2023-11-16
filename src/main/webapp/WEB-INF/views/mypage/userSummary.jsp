<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/layouts/head.jsp" %>



<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
		<div class="breadcrumb-style">
			<div class="container">
				<ul>
					<li><a href="/">홈</a></li>
					<li><a class="active">MY녹즙</a></li>
				</ul>
			</div>
		</div>
		<div class="container aside-layout main" style="padding-bottom:100px; ">
		<%@ include file="/WEB-INF/views/layouts/mypage/aside.jsp" %>
				
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
													<img src="/resources/assets/images/common/ico_delivery_process_img01.png">
												</div>
												<p>0</p>
												<span>결제완료</span>
											</div>
										</li>
										<li class="">
											<div class="item">
												<div class="thumb">
													<img src="/resources/assets/images/common/ico_delivery_process_img02.png">
												</div>
												<p>0</p>
												<span>배송준비중</span>
											</div>
										</li>
										<li class="">
											<div class="item">
												<div class="thumb">
													<img src="/resources/assets/images/common/ico_delivery_process_img03.png">
												</div>
												<p>0</p>
												<span>배송중</span>
											</div>
										</li>
										<li class="active">
											<div class="item">
												<div class="thumb">
													<img src="/resources/assets/images/common/ico_delivery_process_img04.png">
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

		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>

 	</div> <!-- wrapper -->
</body>
</html>
