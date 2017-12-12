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
<style>
  #footer_div {
position: absolute;
    bottom: 0px;
    width: 100%;
    height: 30px;
    background-color: #e1e0db;
    z-index: 2;
}
div#footer_text {
	color: #808184;
    text-align: center;
    font-size: 14px;
    line-height: 30px;
}
</style>
	<main id="main">
		<h2 class="main title">공지사항</h2>
		
		<form name="form" method="post">
			<table class="table table-list space-top">
				<tr>
					<th class="w60">번호</th>
						<td class="w100">${n.id}<input type="text"  name="id" value="${n.id}" style="display: none;"/></td>
					<th class="w60">작성자</th>
						<td class="w100">${n.writerName}</td>
				</tr>
				<tr>
					<th>제목</th>
						<td><input type="text" name="title" value="${n.title}" style="width: 100%;"></td>
						<%-- <c:if test="${loginId eq n.writerName}">
							<td>
								<input type="text" name="title" value="${n.title}" style="width: 100%;">
							</td>
						</c:if>
						
						<c:if test="${loginId ne n.writerName}">
							<td>${n.title}</td>
						</c:if> --%>
					<th>등록일</th>
						<td cols><fmt:formatDate pattern="yyyy-MM-dd kk:mm:ss" value="${n.regDate}" /></td> 
				</tr>
				<tr>
					<th colspan="4">내용</th>
				</tr>
				<tr>
					<td colspan="4">
						<textarea name="content" rows="20" style="width: 100%; resize: none;">${n.content}</textarea>
					</td>
					
					<%-- <c:if test="${loginId eq n.writerName}">
						<td colspan="4">
							<textarea name="content" rows="20" style="width: 100%; resize: none;">${n.content}</textarea>
						</td>
					</c:if>
					
					<c:if test="${loginId ne n.writerName}">
						<td colspan="4">${n.content}</td>
					</c:if> --%>
				</tr>
				 
			</table>
			
			<input id="edit-button" type="button" value="수정" />
			<input id="delete-button" type="button" value="삭제" />
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
			//alert("공지 삭제");
			if(confirm("정말 삭제 하시겠습니까?") == true){
				var form = document.form;
				form.action = "${ctx}/admin/notice-delete";
				//alert(form.action);
				
				form.submit();
			}
			else
				return;
		});
		
		editButton.click(function(){
			
			if(confirm("정말 수정하시겠습니까?") == true){
				var form = document.form;
				form.action = "${ctx}/admin/notice-edit";
				//alert(form.action);
				
				form.submit();
			}
			else
				return;
			
		});
		
	});
	</script>