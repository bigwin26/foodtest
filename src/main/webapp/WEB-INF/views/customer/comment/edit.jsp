<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<main>
	<h2 class="main title">''후기 수정 페이지</h2>
	
	<div class="">
		<h3 class="hidden">후기 등록 내용</h3>
		<table class="">
			<tbody>
				<tr>
					<th>가게 이름</th>
					<td></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td class="text-align-left text-indent" colspan="3"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td></td>
					<th>좋아요</th>
					<td></td>
				</tr>
				<tr>
					<th>상세내용</th>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<form id="comment-form" action="?${_csrf.parameterName}=${_csrf.token}" method="post"	enctype="multipart/form-data">
		<table class="">
			<tbody>
				<tr>
					<th>전체 평점</th>
					<td><input type="radio" name="point" value="5"/>훌륭해요!</td>
					<td><input type="radio" name="point" value="3"/>보통이에요</td>
					<td><input type="radio" name="point" value="1"/>별로에요..</td>
				</tr>
				<tr>
					<th>후기</th>
					<td><textarea cols="40" rows="5" name="content" placeholder="음식, 서비스, 분위기, 위생상태 등의 방문 경험을 적어주세요."></textarea></td>
				</tr>
				<tr>
					<th>사진첨부</th>
					<td><input type="file" name="file" multiple="multiple"/></td>
				</tr>
				<tr>
					<th>메뉴판 사진</th>
					<td><input type="file" name="image" /></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="등록하기" />
	</form>
	
	
	<div class="margin-top text-align-center">
		<a class="btn btn-list" href="../restaurant/">취소</a>
	</div>
</main>

