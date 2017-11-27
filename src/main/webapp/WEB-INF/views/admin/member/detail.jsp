<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<main id="main">
		<h1 class="main title">${m.nickName}</h1>
		<table class="table table-list space-top">
			<tr>
				<th>번호</th>
				<td>${m.id}</td>
				<th>이메일</th>
				<td colspan="2">${m.email}</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${m.nickName}</td>
				<th>비밀번호</th>
				<td>${m.pwd}</td>
			</tr>      
			<tr>
				<th>가입일</th>
				<td><fmt:formatDate	pattern="yyyy-MM-dd kk:mm:ss" value="${m.regDate}" /></td> 
				<th>권한</th>
				<td>${m.role}</td>        
			</tr>
			<%-- <tr>
				<th>좋아요</th>
				<td>${m.countLiked}</td>
				<th>댓글</th>
				<td>${m.countCmt}</td>
				<th>평가 수</th>
				<td>${m.countEval}</td>
			</tr> --%>   
		</table>
	</main>