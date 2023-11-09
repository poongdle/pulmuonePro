<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/layouts/head.jsp"%>
<link rel="stylesheet" href="pulmuonePro/resources/assets/css/event.css">
<body>

	<div class="wrapper">

		<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
		
		<main class="page event">
			<div class="container">
				<div class="contents-area">
					<div class="container">
						<div class="location">
							<a href="/">홈</a> <a href="/event/event">이벤트</a>
						</div>
						<div class="cont-event-area">
							<%@ include file="/WEB-INF/views/layouts/event/title_tab_area.jsp"%>

							<div class="tab-pane fade show active" id="profile"
								role="tabpanel" aria-labelledby="profile-t">





								<h3 class="hide">진행중이벤트</h3>
								<ul class="event-list" id="pagable-list"
									data-list-object="replace">

									<li><a href="/event/event/view/3020">
											<div class="img-area">
												<img
													src="/file/download/event/20231103/7b5c2566-4dfe-41c2-8ee4-a68256e68e32.png"
													alt="풀무원녹즙">
											</div>
											<div class="text-area">
												<b>키즈프리 유기농 주스 50% 할인</b> <span class="text-day">2023.11.01
													~ 2023.12.31</span>
											</div>
									</a></li>

									<li><a href="/event/event/view/3019">
											<div class="img-area">
												<img
													src="/file/download/event/20231101/099a10d6-31c7-4708-b2b3-48d464038fe1.png"
													alt="풀무원녹즙">
											</div>
											<div class="text-area">
												<b>클렌즈랩 할인&amp;체험단 이벤트</b> <span class="text-day">2023.11.01
													~ 2023.11.30</span>
											</div>
									</a></li>

									<li><a href="/event/event/view/2997">
											<div class="img-area">
												<img
													src="/file/download/event/20231102/8b5bebb8-7864-4ec5-a748-d85fae833a89.png"
													alt="풀무원녹즙">
											</div>
											<div class="text-area">
												<b>풀무원녹즙 쿠폰 사용 가이드</b> <span class="text-day">2023.10.25
													~ 2024.12.31</span>
											</div>
									</a></li>

									<li><a href="/event/event/view/2957">
											<div class="img-area">
												<img
													src="/file/download/event/20230905/bf2d2bc5-d7fc-4373-9d8c-db382f7641aa.png"
													alt="풀무원녹즙">
											</div>
											<div class="text-area">
												<b>키즈프리 한 달 야채 프로젝트</b> <span class="text-day">2023.10.10
													~ 2023.11.12</span>
											</div>
									</a></li>

									<li><a href="/event/event/view/2757">
											<div class="img-area">
												<img
													src="/file/download/event/20230703/2c8626f9-d617-4d71-9910-2ee4b4311775.png"
													alt="풀무원녹즙">
											</div>
											<div class="text-area">
												<b>풀무원녹즙 홈페이지 회원 혜택</b> <span class="text-day">2023.07.01
													~ 2025.12.31</span>
											</div>
									</a></li>

									<li><a href="/event/event/view/2394">
											<div class="img-area">
												<img
													src="/file/download/event/20221107/99c10264-6275-49b9-a085-fc9b7d91e022.png"
													alt="풀무원녹즙">
											</div>
											<div class="text-area">
												<b>좋은 건 함께 하는게 친구~ 친구 초대하고 5,000원 쿠폰 받자!</b> <span
													class="text-day">2022.11.07 ~ 2025.11.30</span>
											</div>
									</a></li>

									<li><a href="/event/event/view/2393">
											<div class="img-area">
												<img
													src="/file/download/event/20221107/e84341d0-b41d-490a-b4a3-4f7d1b04e207.png"
													alt="풀무원녹즙">
											</div>
											<div class="text-area">
												<b>회원가입 축하 3,6,9 쿠폰 지급 프로모션! 음용할수록 늘어나는 혜택을 확인하세요.</b> <span
													class="text-day">2022.11.07 ~ 2025.11.30</span>
											</div>
									</a></li>

								</ul>
								<nav aria-label="Page navigation example" class="pagenavi-area"
									data-pagination="">
									<input type="hidden" id="pageNo" name="pageNo">
									<ul class="pagination">
										<li class="page-item active"><a class="page-link">1</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		
		<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>

	</div>

</body>
</html>