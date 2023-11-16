<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				container 				
			</div>
		</main>		
		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
 	</div>
</body>
</html>