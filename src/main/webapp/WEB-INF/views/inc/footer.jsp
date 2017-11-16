<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#footer_div {
    position:relative;
    bottom:0px;
    width:100%;
    height:30px;
    background-color: #e1e0db;
}

#footer_text {
    color: #808184;
    text-align: center;
    font-size: 14px;
    line-height: 30px;
}

#footer_text a {
    color: inherit;
    text-decoration: none;
}

#footer_text a:link, #footer_text a:visited, #footer_text a:hover, #footer_text a:active {
    color: inherit;
    text-decoration: none;
}
</style>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

 <div id="footer_div" style="background-color:#f6f6f6;">
        <div id="footer_text">
             
			<a href="index">© 2017 LUNCHCONTAINER</a> ·
            <a href="policyservice">이용약관</a> ·
            <a href="policyprivacy">개인정보처리방침</a>
        </div>
</div>