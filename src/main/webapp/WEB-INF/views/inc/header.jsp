<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<header id="header">
	<div class="container clearfix">
		<a href="${ctx}/index" class="head-logo">런치 컨테이너</a>
		<nav class="gnb">
			<ul class="gnb-items">
				<li><a href="${ctx}/customer/restaurant">맛집 리스트</a></li>
				<li><a href="${ctx}/customer/map">맛집 지도</a></li>
				<li><a href="${ctx}/customer/worldcup">음식 월드컵</a></li>
				<li><a href="${ctx}/member/join">회원가입</a></li>
				
				<security:authorize access="!hasRole('ROLE_USER')">
							<li><a href="${ctx}/member/login">로그인</a></li>
							</security:authorize>
						<%-- <c:if test="${empty pageContext.request.userPrincipal}">
							<li><a href="${ctx}/member/login">로그인</a></li>
						</c:if> --%>
							<security:authorize access="hasRole('ROLE_USER')">
							<li><c:url var="logout" value="/logout"/>
								<form action="${logout}" method="post">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<input type="submit" value="로그아웃"/>
								</form>
									</li>
							</security:authorize>
			</ul>
		</nav>
		<div class="my-info">
			<a href="">내 정보</a>
		</div>
	</div>
</header>