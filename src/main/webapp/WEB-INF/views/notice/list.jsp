<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 
%>
<%@ include file="/WEB-INF/views/layouts/head.jsp" %>
<div class="wrapper">

	<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
	<main class="page faq">
		<div class="container">
			<div class="breadcrumb-style">
                <div class="wrap">
                    <ul>
                        <li><a href="/">홈</a></li>
                        <li><a href="/forum/faq/list.do">고객기쁨센터</a></li>
                        <li><a class="active">공지사항</a></li>
                    </ul>
                </div>
            </div>
                
            <div class="page-wrap">
				<%@ include file="/WEB-INF/views/layouts/forum/aside.jsp" %>

				<div class="page-content">
					<div class="border-wrapper">
			            <h2 class="container-title">
			                공지사항
			            </h2>
			        </div>
					<div class="list-area" style="padding-top: 14px;">
						<div class="list-head" style="margin-bottom: 28px">
                        	<em class="count">총 <span>30</span>건</em>
                        </div>
									
						<table class="tbl-col event-winner-list">
                            <tbody id="pagable-list" data-list-object="replace">
                                  <tr>
                                      <td class="al">
                                          <a class="link-ellipsis" href="/forum/notice/2139">
                                                  '명일엽' 원료 공급 부족으로 인한 제품 배송 지연 안내
                                              <span>2023.11.03</span>
                                          </a>
                                      </td>
                                  </tr>
                              
                                  <tr>
                                      <td class="al">
                                          <a class="link-ellipsis" href="/forum/notice/2136">
                                                  풀무원녹즙 개인정보처리방침 내용 변경 안내 (2023.09.21 시행)
                                              <span>2023.09.21</span>
                                          </a>
                                      </td>
                                  </tr>
                              </tbody>
                         </table>
                         
                        <nav aria-label="Page navigation example" class="pagenavi-area" data-pagination="">
							<input type="hidden" id="pageNo" name="pageNo"><ul class="pagination"><li class="page-item active"><a class="page-link">1</a></li><li class="page-item"><a class="page-link" data-list-more="#pagable-list" data-param="1">2</a></li><li class="page-item"><a class="page-link" data-list-more="#pagable-list" data-param="2">3</a></li><li class="page-item"><a class="page-link" data-list-more="#pagable-list" data-param="3">4</a></li></ul><a href="javascript:movePage(3);" class="btn-page-arrow"><i class="ico ico-page-end lastBtnImg "></i><span class="ic"></span></a>
						</nav>
                   </div>        
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
	
</div>

