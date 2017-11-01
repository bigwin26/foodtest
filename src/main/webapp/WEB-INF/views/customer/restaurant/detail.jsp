<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<main>
	<h2 class="main title">점심 디테일 페이지</h2>
	
	<div class="">
		<h3 class="hidden">공지사항 내용</h3>
		<table class="">
			<tbody>
				<tr>
					<th>가게 이름</th>
					<td>${n.name}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td class="text-align-left text-indent" colspan="3">
						<fmt:formatDate	pattern="yyyy-MM-dd" value="${n.regDate}" />
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${n.writerName}</td>
					<th>좋아요</th>
					<td>${n.countLiked}</td>
				</tr>
				<tr>
					<th>상세내용</th>
					<td>${n.content}</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="margin-top text-align-center">
		<a class="btn btn-list" href="../restaurant">목록</a>
	</div>
	
	<div class="">
		<table class="">
			<tbody>
				<c:if test="${empty prev}">
					<tr>
						<th>이전글</th>
						<td colspan="3" class="">이전글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty prev}">
					<tr>
						<th>이전글</th>
						<td colspan="3" class=""><a class="" href="${prev.id}">${prev.name}</a></td>
					</tr>
				</c:if>
				<c:if test="${empty next}">
					<tr>
						<th>다음글</th>
						<td colspan="3" class="">다음글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty next}">
					<tr>
						<th>다음글</th>
						<td colspan="3" class=""><a class="" href="${next.id}">${next.name}</a></td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</main>