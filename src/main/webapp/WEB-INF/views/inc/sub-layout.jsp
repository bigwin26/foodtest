<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/reset.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/header.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/footer.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/main.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/join.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/login.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Choose your lunch in the Lunch-container</title>
</head>
<body>
	<tiles:insertAttribute name="header" />
	
	<tiles:insertAttribute name="main" />
	
	<tiles:insertAttribute name="footer" />

</body>
</html>