<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		<main id="main" />
			<h2 class="main title">런치 리스트</h2>
			
			<div class="search-form margin-top first align-right">
				<h3 class="hidden">공지사항 검색폼</h3>
				<form class="table-form">
					<fieldset>
						<legend class="hidden">Restaurant 검색 필드</legend>
						<label class="hidden">검색분류</label> 
						<select name="f">
							<option selected="selected" value="name">가게이름</option>
							<option value="genre">음식종류</option>
						</select> 
						<label class="hidden">검색어</label> 
						<input type="text" name="q" /> 
						<input class="btn btn-search" type="submit" value="검색" />
					</fieldset>
				</form>
			</div>
						
			<div class="">
				<h3 class="hidden">레스토랑 목록</h3>
				<table class="">
					<thead>
						<tr>
							<th class="">번호</th>
							<th class="">가게이름</th>
							<th class="">음식 사진</th>
							<th class="">작성자</th>
							<th class="">작성자 사진</th>
							<th class="">작성자 한마디</th>
							<th class="">좋아요</th>
							<th class="">평점</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="n" items="${list}">					
					<tr>
						<td>${n.id}</td>
						<td class=""><a href="restaurant/${n.id}">${n.name} (${n.countCmt})</a></td>
						<td>${n.image}</td>
						<td>${n.writerName}</td>
						<td>${n.writerImage}</td>
						<td>${n.tip}</td>
						<td>${n.countLiked}</td>
						<td>${n.avgPoint}</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div>
				<a href="restaurant/reg">가게 등록!</a>
			</div>
			<div class="">
				<h3 class="hidden">현재 페이지</h3>
				<div><span class="">1</span> / 3 pages</div>
			</div>

		</main>
		