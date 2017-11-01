<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>`
<script type="text/javascript">
$(function(){
	$("input[type='submit']").click(function(){
		alert('가입되었습니다.');
	});
});
</script>
<main>
<form action="?${_csrf.parameterName}=${_csrf.token}" method="post">
<table>
<tr id="tr_name">
	<th>이메일</th>
	<td><input name="email" id="email" class="input-text w400" type="text"
		value="" placeholder="이름" /><br />
	<br /> 런치 컨테이너에서 회원정보로 등록하실 이메일을 입력해주세요. </td>
</tr>
<tr id="tr_pwd">
	<th>비밀번호</th>
	<td><input name="pwd" id="pwd" class="input-text w400" type="password"
		value="" placeholder="비밀번호" /><br />
	<br /> 런치 컨테이너에서 회원정보로 등록하실 비밀번호를 입력해주세요. </td>
</tr>
<tr id="tr_nickName">
	<th>닉네임</th>
	<td><input name="nickName" id="nickName" class="input-text w400" type="text"
		value="" placeholder="닉네임" /><br />
	<br /> 런치 컨테이너에서 회원정보로 등록하실 닉네임을 입력해주세요. </td>
</tr>
<tr id="tr_mentor">
	<th>선생님 성함</th>
	<td><input name="mentor" id="mentor" class="input-text w400" type="text"
		value="" placeholder="멘토" /><br />
	<br /> 런치 컨테이너에서 회원정보로 등록하실 선생님 성함을 입력해주세요. </td>
</tr>
</table>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="submit" value="회원가입"/>
</form>
</main>
