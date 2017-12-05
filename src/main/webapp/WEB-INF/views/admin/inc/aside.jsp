<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
         <aside id="aside">
         
         	<h1 class="aside-title">관리자 메뉴</h1>

			<nav class="baic-aside-menu">
				<h1 class="hidden">정보 관리</h1>
				<ul style="padding-start:40px ">
					<li class="aside-menu-item"><a href="${ctx}/admin/restaurant">식당 관리</a></li>
					<li class="aside-menu-item"><a href="${ctx}/admin/member">회원 관리</a></li>
					<li class="aside-menu-item"><a href="${ctx}/admin/notice">공지 관리</a></li>
				</ul>
			</nav>
         	
         </aside>