<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/layouts/head.jsp" %>
<body>
<div class="wrapper">

	<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
	<main class="page forum">
		<div class="container">
	
            <div class="breadcrumb-style">
                <div class="wrap">
                    <ul>
                        <li><a href="/">홈</a></li>
                        <li><a href="">MY녹즙</a></li>
                        <li><a href="">활동정보</a></li>
                        <li><a class="active">1:1 문의</a></li>
                    </ul>
                </div>
            </div>
	
			<div class="page-wrap">
				<div class="aside" id="mypage_lnb">
	                      <h2 class="title">MY녹즙</h2>
	                      <ul class="lnb-style">
	                          <li class="indepth">
	                              <a>매일배송 음용내역</a>
	                              <ul class="sub-navigation">
	                                  <li><a href="/mypage/drink/drink">음용내역</a></li>
	                                  <li><a href="/mypage/drink/bill">영수증조회</a></li>
	                              </ul>
	                          </li>
	                          <li>
	                              <a href="/mypage/order/box">택배배송 주문내역</a>
	                          </li>
	                          <li>
	                              <a href="/mypage/benefit/taste">시음선물내역</a>
	                          </li>
	                          <li>
	                              <a href="/mypage/benefit/coupon">쿠폰</a>
	                          </li>
	                          <li class="indepth active">
	                              <a>활동정보</a>
	                              <ul class="sub-navigation">
	                                  <li><a href="/mypage/action/interest">찜한상품</a></li>
	                                  <li class="active"><a href="/mypage/action/counsel">1:1 문의</a></li>
	                                  <li><a href="/mypage/action/review">리뷰</a></li>
	                              </ul>
	                          </li>
	                          <li class="indepth">
	                              <a>개인정보</a>
	                              <ul class="sub-navigation">
	                                  <li><a href="/mypage/personal/address">주소록</a></li>
	                                  <li><a href="/mypage/personal/info">개인정보 변경</a></li>
	                                  <li><a href="/mypage/drink/paymethod">결제수단 관리</a></li>
	                                  <li><a href="/mypage/personal/refund">환불계좌 관리</a></li>
	                              </ul>
	                          </li>
	                      </ul>
	                  </div>
	
				<div class="page-content">
					
                     <div style="padding: 0" class="border-wrapper">
                         <h2 style="padding-bottom: 20px" class="container-title">
                             1:1 문의
                         </h2>
                         <a style="margin-bottom: 10px;margin-left: 10px; padding: 0 20px;" href="/forum/faq/list.do" class="rect-button black">FAQ보러가기</a>
                     </div>
				
                     <div class="page-addiction-wrapper" style="align-items: center; margin-bottom:20px;">
                         <div class="info-copy description">
                             <p>총 <b>0</b>건</p>
                         </div>
                         <div class="form-input select sm">
                             <dl>
                                 <dt style="display:flex; align-items: center;">문의유형</dt>
                                 <dd style="width:200px">
                                     <div class="dropdown">
                                         <a class="btn dropdown-toggle" href="javascript:void(0)" role="button" data-toggle="dropdown" aria-expanded="false">
                                             전체
                                         </a>
                                         <div class="dropdown-menu">
                                             <a class="dropdown-item" data-value="" href="javascript:void(0)">전체</a>
                                             <a class="dropdown-item" data-value="CONSULT_001" href="javascript:void(0)">주문확인/변경</a>
                                         
                                             <a class="dropdown-item" data-value="CONSULT_003" href="javascript:void(0)">배송</a>
                                         
                                             <a class="dropdown-item" data-value="CONSULT_004" href="javascript:void(0)">상품문의</a>
                                         
                                             <a class="dropdown-item" data-value="CONSULT_006" href="javascript:void(0)">결제</a>
                                         
                                             <a class="dropdown-item" data-value="INQUIRY_999" href="javascript:void(0)">반품</a>
                                         
                                             <a class="dropdown-item" data-value="CONSULT_002" href="javascript:void(0)">홈페이지이용</a>
                                         
                                             <a class="dropdown-item" data-value="CONSULT_007" href="javascript:void(0)">기타</a>
                                         </div>
                                     </div>
                                 </dd>
                             </dl>
                         </div>
                         <a style="margin-left:10px;" href="/mypage/inquiry/write.do" class="rect-button black">1:1 문의하기</a>
                     </div>

                     <form action="" method="post" id="inquiryForm">
                         <div class="input-group" style="margin-top:19px;">
                             <div class="inquiry-list">
                                 <div class="caution-unit page">
                                     <span class="mark"></span>
                                     <p>작성한 1:1 문의가 없습니다.</p>
                                 </div>
                             </div>
                             ${ list }
                             <div class="inquiry-list">
                                 <table>
                                    <colgroup>
                                       <col width="120">
                                       <col width="*">
                                       <col width="120">
                                       <col width="120">
                                    </colgroup>
                                    <thead>
                                         <tr>
                                             <tr class="tb-header">
                                             <th class="t-left">문의유형</th>
                                             <th class="t-left">제목</th>
                                             <th>문의일자</th>
                                             <th>상태</th>
                                         </tr>
                                    </thead>
                                    <tbody data-list-object="append" id="post-items">
                                         <tr>
                                             <td class="t-left">
                                                 <b>기타</b>
                                             </td>
                                             <td class="t-left"><a href="/mypage/action/counsel/5517110?category=기타">가맹점의 개인사정</a></td>
                                             <td class="number">2023.10.30</td>
                                             <td>
                                                 <span class="status">답변완료</span>
                                             </td>
                                         </tr>
                                         <tr>
                                             <td class="t-left">
                                                 <b>배송</b>
                                             </td>
                                             <td class="t-left"><a href="/mypage/action/counsel/5517109?category=배송">가맹점 의 분류</a></td>
                                             <td class="number">2023.10.30</td>
                                             <td>
                                                 <span class="status">답변완료</span>
                                             </td>
                                         </tr>
                                    </tbody>
                                 </table>
                              </div>
                         </div>
                     </form>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
	
</div>



<%@ include file="/WEB-INF/views/ui/modal.jsp" %>


<script>

</script>

</body>
</html>
