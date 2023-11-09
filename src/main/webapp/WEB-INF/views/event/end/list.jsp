<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/layouts/head.jsp"%>
<body>

	<div class="wrapper">

		<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
		
		<main class="page event">
			<div class="container">
		<div class="location">
			<a href="/">홈</a>
			<a href="/event/event">이벤트</a>
		</div>
		<div class="cont-event-area">
			<%@ include file="/WEB-INF/views/layouts/event/title_tab_area.jsp"%>
			
			<div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-t">
				<!--S:종료된이벤트-->
				<h3 class="hide">종료된이벤트</h3>
				
					
						<ul class="event-list" id="pagable-list" data-list-object="replace">
							
								<li>
									<a href="/event/event/view/2917" class="disabled" onclick="return false">
										<div class="img-area">
											<img src="/file/download/event/20231004/78c2bf60-efa5-419e-a962-e0738ff92c5f.png" alt="관절청춘 특별 할인가">
										</div>
										<div class="text-area">
											<b>관절청춘 특별 할인가</b>
											<span class="text-day">2023.10.03 ~ 2023.10.31</span>
										</div>
									</a>
								</li>
							
								<li>
									<a href="/event/event/view/2978" class="disabled" onclick="return false">
										<div class="img-area">
											<img src="/file/download/event/20230927/4a026f9d-aeb2-4163-8162-d6b717dfb42c.png" alt="10월의 녹녹데이, 최대 15,000원 쿠폰 증정">
										</div>
										<div class="text-area">
											<b>10월의 녹녹데이, 최대 15,000원 쿠폰 증정</b>
											<span class="text-day">2023.10.11 ~ 2023.10.25</span>
										</div>
									</a>
								</li>
							
								<li>
									<a href="/event/event/view/2458" class="disabled" onclick="return false">
										<div class="img-area">
											<img src="/file/download/event/20230830/ca24096e-dcbd-41c7-9963-f23a20976b6f.png" alt="추석선물 기획전">
										</div>
										<div class="text-area">
											<b>추석선물 기획전</b>
											<span class="text-day">2023.09.04 ~ 2023.09.30</span>
										</div>
									</a>
								</li>
							
								<li>
									<a href="/event/event/view/2938" class="disabled" onclick="return false">
										<div class="img-area">
											<img src="/file/download/event/20230823/709de002-bb7a-4a4d-a7f5-b0b43c631dcd.png" alt="9월의 녹녹데이, 선착순 쿠폰 증정!">
										</div>
										<div class="text-area">
											<b>9월의 녹녹데이, 선착순 쿠폰 증정!</b>
											<span class="text-day">2023.09.11 ~ 2023.09.25</span>
										</div>
									</a>
								</li>
							
								<li>
									<a href="/event/event/view/2897" class="disabled" onclick="return false">
										<div class="img-area">
											<img src="/file/download/event/20230822/5766686b-17e1-4219-a682-ab1ddad3cf60.png" alt="관절청춘x거누파파 유튜브 시청 이벤트">
										</div>
										<div class="text-area">
											<b>관절청춘x거누파파 유튜브 시청 이벤트</b>
											<span class="text-day">2023.08.21 ~ 2023.09.10</span>
										</div>
									</a>
								</li>
							
								<li>
									<a href="/event/event/view/2877" class="disabled" onclick="return false">
										<div class="img-area">
											<img src="/file/download/event/20230811/5bea44c0-bbe3-4328-9e4b-e139df10cd17.png" alt="풀무원녹즙 8월 브랜드데이">
										</div>
										<div class="text-area">
											<b>풀무원녹즙 8월 브랜드데이</b>
											<span class="text-day">2023.08.11 ~ 2023.08.25</span>
										</div>
									</a>
								</li>
							
								<li>
									<a href="/event/event/view/2737" class="disabled" onclick="return false">
										<div class="img-area">
											<img src="/file/download/event/20230614/4376c022-487b-47ba-84df-1ba56f3b231d.png" alt="키즈프리 튼튼칼슘망간구미 체험딜 앵콜 이벤트">
										</div>
										<div class="text-area">
											<b>키즈프리 튼튼칼슘망간구미 체험딜 앵콜 이벤트</b>
											<span class="text-day">2023.06.20 ~ 2023.08.22</span>
										</div>
									</a>
								</li>
							
								<li>
									<a href="/event/event/view/2797" class="disabled" onclick="return false">
										<div class="img-area">
											<img src="/file/download/event/20230712/c2c0c7b3-934a-4762-ae39-a55c0eb8abbe.png" alt="올 여름은 CLEAN 하게! 디워밍업 30% 할인 이벤트">
										</div>
										<div class="text-area">
											<b>올 여름은 CLEAN 하게! 디워밍업 30% 할인 이벤트</b>
											<span class="text-day">2023.08.01 ~ 2023.08.15</span>
										</div>
									</a>
								</li>
							
								<li>
									<a href="/event/event/view/2778" class="disabled" onclick="return false">
										<div class="img-area">
											<img src="/file/download/event/20230706/97a6a54a-f203-4217-8a9e-6e0ca6619070.png" alt="마케팅 수신 동의 이벤트">
										</div>
										<div class="text-area">
											<b>마케팅 수신 동의 이벤트</b>
											<span class="text-day">2023.07.10 ~ 2023.08.10</span>
										</div>
									</a>
								</li>
							
								<li>
									<a href="/event/event/view/2777" class="disabled" onclick="return false">
										<div class="img-area">
											<img src="/file/download/event/20230705/ed91dbd7-60c6-4f4d-b565-26de6108fbbe.png" alt="관절청춘 누적 판매 1만 박스 돌파 기념 이벤트">
										</div>
										<div class="text-area">
											<b>관절청춘 누적 판매 1만 박스 돌파 기념 이벤트</b>
											<span class="text-day">2023.07.05 ~ 2023.07.31</span>
										</div>
									</a>
								</li>
							
						</ul>
					
					
				

				<nav aria-label="Page navigation example" class="pagenavi-area" data-pagination="">
					<input type="hidden" id="pageNo" name="pageNo"><ul class="pagination"><li class="page-item active"><a class="page-link">1</a></li><li class="page-item"><a class="page-link" data-list-more="#pagable-list" data-param="1">2</a></li><li class="page-item"><a class="page-link" data-list-more="#pagable-list" data-param="2">3</a></li></ul><a href="javascript:movePage(2);" class="btn-page-arrow"><i class="ico ico-page-end lastBtnImg "></i><span class="ic"></span></a>
				</nav>
				<!--E:종료된이벤트-->
			</div>

		</div>
	</div>
		</main>
		
		<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>

	</div>

</body>
</html>