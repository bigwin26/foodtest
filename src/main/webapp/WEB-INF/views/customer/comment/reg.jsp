<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<main>
	<h2 class="main title">'${r.name}'후기 등록 페이지</h2>
	
	<div class="">
		<h3 class="hidden">후기 등록 내용</h3>
		<table class="">
			<tbody>
				<tr>
					<th>가게 이름</th>
					<td>${r.name}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td class="text-align-left text-indent" colspan="3"><fmt:formatDate	pattern="yyyy-MM-dd" value="${r.regDate}" /></td>
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
	
	<form action="?${_csrf.parameterName}=${_csrf.token}" method="post"	enctype="multipart/form-data">
		<table class="">
			<tbody>
				<tr>
					<th>전체 평점</th>
					<td><input type="radio" name="point" value="5"/></td>
					<td><input type="radio" name="point" value="3"/></td>
					<td><input type="radio" name="point" value="1"/></td>
				</tr>
				<tr>
					<th>후기</th>
					<td><textarea name="content" placeholder="음식, 서비스, 분위기, 위생상태 등의 방문 경험을 적어주세요."></textarea></td>
				</tr>
				<tr>
					<th>사진첨부</th>
					<td><input type="file" name="file" /></td>
				</tr>
				<tr>
					<th>음식 종류</th>
				</tr>
				<tr>
					<td><input type="radio" name="genre" value="한식" />한식</td>
					<td><input type="radio" name="genre" value="일식" />일식</td>
					<td><input type="radio" name="genre" value="중식" />중식</td>
					<td><input type="radio" name="genre" value="양식" />양식</td>
					<td><input type="radio" name="genre" value="뷔페" />뷔페</td>
					<td><input type="radio" name="genre" value="세계음식" />세계음식</td>
					<td><input type="radio" name="genre" value="카페" />카페</td>
					<td><input type="radio" name="genre" value="술집" />술집</td>
				</tr>
				<tr>
					<th>대표 사진</th>
					<td><input type="file" name="file" multiple="multiple" /></td>
				</tr>
				<tr>
					<th>대표 음식</th>
					<td><input type="text" name="keyword" /></td>
				</tr>
				<tr>
					<th>작성자 한마디!</th>
					<td><input type="text" name="tip" /></td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" /> <input type="submit" value="등록하기" />
	</form>
	
	<div class="margin-top text-align-center">
		<a class="btn btn-list" href="../restaurant/${r.id}">취소</a>
	</div>

</main>