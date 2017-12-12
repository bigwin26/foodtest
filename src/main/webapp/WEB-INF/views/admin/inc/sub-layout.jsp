<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/reset.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/admin.css">
<title>Insert title here</title>
<style>
  #footer_div {
position: absolute;
    bottom: 0px;
    width: 100%;
    height: 30px;
    background-color: #e1e0db;
    z-index: 2;
}
</style>
</head>
<body>

<tiles:insertAttribute name="header" />

<tiles:insertAttribute name="visual"/>
<div id="body" class="clearfix">
	<div class="content-container clearfix">
		<tiles:insertAttribute name="aside"/>
		<tiles:insertAttribute name="main"/>
	</div>
</div>
<tiles:insertAttribute name="footer" />

</body>
</html>