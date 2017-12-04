<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="test" value="${pageContext.request.requestURL}" />
<c:set var="test2" value="${pageContext.request.servletPath}" />
<c:set var="test3" value="${pageContext.request.servletContext}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<main id="main">
		<%-- ${ctx}</br>
		${test}</br>
		${test2}</br>
		${test3}</br> --%>
		<h1 class="main title">${m.nickName}</h1>
		<!-- <form id="form" action="../member-delete" method="post"> -->
		<form name="form" method="post">
			<table class="table table-list space-top">
				<tr>
					<th>번호</th>
						<td>${m.id}<input type="text"  name="id" value="${m.id}" style="display: none;"/></td>
					<th>이메일</th>
						<td>${m.email}</td>
				</tr>
				<tr>
					<th>닉네임</th>
						<td><input type="text"  name="nickName" value="${m.nickName}" /></td>
						<%-- <td>${m.nickName}</td> --%>
					<th>비밀번호</th>
						<td>${m.pwd}</td>
				</tr>      
				<tr>
					<th>권한</th>
						<%-- <td>${m.role}</td> --%>
						<c:if test="${'0' eq m.role}">
							<!-- <td>일반회원</td> -->
							<td>
								<select id="selectBox" name="selectBox">
									<option value="${m.role}">일반회원</option>
									<option value="1">관리자</option>
								</select>
								<input type="text" name="role" size="1" style="display: none;"/>
							</td>
						</c:if>
						<c:if test="${'1' eq m.role}">
							<!-- <td>관리자</td> -->
							<td>
								<select id="selectBox" name="selectBox">
									<option value="0">일반회원</option>
									<option value="${m.role}">관리자</option>
								</select>
								<input type="text" name="role" size="1" style="display: none;"/>
							</td>
						</c:if>
					<th>멘토</th>
						<td><input type="text"  name="mentor" value="${m.mentor}" /></td>
						<%-- <td>${m.mentor}</td> --%>
				</tr>
				<tr>
					<th>가입일</th>
						<td><fmt:formatDate	pattern="yyyy-MM-dd kk:mm:ss" value="${m.regDate}" /></td> 
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
			<input id="edit-button" type="button" value="수정" />
			<input id="delete-button" type="button" value="탈퇴" />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			
			<!-- <input id="submit-button" type="submit" value="" style="display:none"/> -->
		</form>
	</main>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
	$(function(){
		
		var form = $("#form");
		var deleteButton = $("#delete-button");
		var editButton = $("#edit-button");
		var submitButton = $("#submit-button");
				
		deleteButton.click(function(){
			//alert("회원 탈퇴");
			if(confirm("정말 탈퇴 시키겠습니까?") == true){
				var form = document.form;
				form.action = "${ctx}/admin/member-delete";
				//alert(form.action);
				
				form.submit();
			}
			else
				return;
		});
		
		editButton.click(function(){
			
			if(confirm("정말 수정하시겠습니까?") == true){
				var form = document.form;
				form.action = "${ctx}/admin/member-edit";
				//alert(form.action);
				
				form.submit();
			}
			else
				return;
			
		});
		
		$("#selectBox > option[value=" + ${m.role} + "]").prop("selected", true);
		$("input[name='role']").attr("value", ${m.role});
		
		$("#selectBox").change(function(){
			var value = $(this).val();
			//alert(value);
			$("input[name='role']").attr("value", value);
		});
		
		/* function submit(val){
			if(val == "delete"){
				alert("val: " + val);
				
				form.action = "../../member-delete";
			}
			form.submit();
		} */
	
	
	
	
	
	
	
	
	
	
	});
	</script>
	