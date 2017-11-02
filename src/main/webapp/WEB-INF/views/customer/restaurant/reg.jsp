<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<main>
	<h2 class="main title">가게 등록 페이지</h2>
	
	<div class="">
		<h3 class="hidden">음식점 등록</h3>
		<form action="?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
			<table class="">
				<tbody>
					<tr>
						<th>가게 이름</th>
						<td><input type="text" name="name"/></td>
					</tr>
					<tr>
						<th>위치</th>
						<td><input type="text" name="address"/><input type="text" name="location" style="display: none;"/></td>
					</tr>
					<tr>
						<th>상세내용</th>
						<td><input type="text" name="content" placeholder="예) 2인 1.5만원대"/></td>
					</tr>
					<tr>
						<th>음식 종류</th>
					</tr>
					<tr>
						<td><input type="radio" name="genre" value="한식"/>한식</td>
						<td><input type="radio" name="genre" value="일식"/>일식</td>
						<td><input type="radio" name="genre" value="중식"/>중식</td>
						<td><input type="radio" name="genre" value="양식"/>양식</td>
						<td><input type="radio" name="genre" value="뷔페"/>뷔페</td>
						<td><input type="radio" name="genre" value="세계음식"/>세계음식</td>
						<td><input type="radio" name="genre" value="카페"/>카페</td>
						<td><input type="radio" name="genre" value="술집"/>술집</td>
					</tr>
					<tr>
						<th>대표 사진</th>
						<td><input type="file" name="file"/></td>
					</tr>
					<tr>
						<th>대표 음식</th>
						<td><input type="text" name="keyword"/></td>
					</tr>
					<tr>
						<th>작성자 한마디!</th>
						<td><input type="text" name="tip"/></td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="submit" value="등록하기"/>
		</form>
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