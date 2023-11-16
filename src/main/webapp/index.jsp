<%@ include file="/WEB-INF/views/layouts/head.jsp" %>
<body>
	<script type="text/javascript">
	$(document).ready(function () {
        $(".visual-area").fddCarousel({ auto: 5000 });
		$(".event-area").fddCarousel({ auto: 5000, activeClick: true });
		$('.prd-list.owl-carousel').owlCarousel({
            items: 4,
            nav: true,
		  loop:false
		});		
	});		
</script>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
		<main class="page">
			<div class="container">
				페이지 코딩 container class 에 full 클래스 붙히면 width 100%				
			</div>
		</main>		
		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
 	</div>
</body>

</html>