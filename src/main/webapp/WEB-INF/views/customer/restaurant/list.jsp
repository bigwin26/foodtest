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
						
			<div class="notice margin-top">
				<h3 class="hidden">공지사항 목록</h3>
				<table class="table">
					<thead>
						<tr>
							<th class="w60">번호</th>
							<th class="expand">제목</th>
							<th class="w100">작성자</th>
							<th class="w100">작성일</th>
							<th class="w60">조회수</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="n" items="${list}">					
					<tr>
						<td>${n.id}</td>
						<td class=""><a href="restaurant/${n.id}">${n.name}</a></td>
						<td>newlec</td>
						<td>12</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="indexer margin-top align-right">
				<h3 class="hidden">현재 페이지</h3>
				<div><span class="text-orange text-strong">1</span> / 3 pages</div>
			</div>

			<div class="margin-top align-center pager">
				<new:pager />
			</div>
		</main>
		