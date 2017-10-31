<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<header id="header">
	<div class="container clearfix">
		<a href="${ctx}/index" class="head-logo">런치 컨테이너</a>
		<nav class="gnb">
			<ul class="gnb-items">
				<li><a href="${ctx}/customer/restaurant">맛집 리스트</a></li>
				<li><a href="${ctx}/customer/map">맛집 지도</a></li>
				<li><a href="${ctx}/customer/worldcup">음식 월드컵</a></li>
			</ul>
		</nav>
		<div class="my-info">
			<a href="">내 정보</a>
		</div>
	</div>
</header>