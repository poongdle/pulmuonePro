<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


		<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close"></button>
				<div class="thumb-normal">
					<c:forEach var="dto" items="${list2 }" begin="0" end="0">
						<img src="/file/download/product/${dto.system_name }">
					</c:forEach>
				</div>
			</div>

			<c:forEach var="dto" items="${list2}" begin="0" end="0">
				<div class="modal-body">
					<div class="info-area">
						<h2>${dto.products_name }</h2>
						<p>${dto.products_sub_name}</p>
						<div class="product-addiction" style="border-bottom: none">
							<div class="price-item">
								<p>${dto.price}<span>원</span>
								</p>
								<span>(${dto.products_size })</span>
							</div>
						</div>
					</div>
					<div class="button-set">
						<a href="/product/daily/view.do?tag=${dto.products_tag}&eventIdx="
							class="button-basic primary">상세보기</a>
					</div>
				</div>
			</c:forEach>
	