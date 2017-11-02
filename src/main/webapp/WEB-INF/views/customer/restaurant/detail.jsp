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
					<th>가게 이름${cmtp}</th>
					<td>${r.name}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td class="text-align-left text-indent" colspan="3">
						<fmt:formatDate	pattern="yyyy-MM-dd" value="${r.regDate}" />
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${r.writerName}</td>
					<th>좋아요</th>
					<td>${r.countLiked}</td>
				</tr>
				<tr>
					<th>상세내용</th>
					<td>${r.content}</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div>
		<table class="">
			<tbody>
				<c:if test="${empty cmtList}">
					<tr>
						<td colspan="3" class="">첫번째 후기를 작성해 주세요!</td>
					</tr>
				</c:if>
				<c:if test="${not empty cmtList}">
					<tr>
						<td>번호</td>
						<td>내용</td>
						<td>작성자</td>
					</tr>
					<c:forEach var="c" items="${cmtList}">					
						<tr>
							<td>${c.id}</td>
							<td class="">${c.content}</td>
							<td>${c.writerName}</td>
						</tr>
					</c:forEach>
				</c:if>
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