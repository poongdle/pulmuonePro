<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/layouts/head.jsp" %>
<body>
	<div class="wrapper">

		<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
		<main class="page event">
			<div class="container">
				
				<form action="/member/login.do" method="post">
					일반 회원으로 로그인합니다.<br>
					<input type="text" name="memberId" placeholder="아이디" autofocus="autofocus"><br>
					<input type="password" name="pwd" placeholder="비밀번호"><br>
					<button type="submit">로그인</button>
				</form>
				
				
			</div>
		</main>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>

 	</div>





</body>
</html>
