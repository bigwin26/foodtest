<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.main-header a{
    position: relative;
    top: 0;
    font-weight: 700;
    cursor: pointer;
}

.main-header{
    position: fixed;
    padding: 15px 50px 15px 50px;
    z-index: 999;
    width: 100%;

}
.main-header.show{
    position: fixed;
    padding: 15px 50px 15px 50px;
    z-index: 999;
    width: 100%;
    background-color: #E73524;
    
    

}
.main-header li{
   display: inline;
}

.main-header li:last-child{
    display: inline;
}


.header-search-container{
position: fixed;
display: inline-block;
 z-index: 1000;
left: 800px;
top: 6px;
display: none;
}
.header-search-container.show{
position: fixed;
display: inline-block;
 z-index: 1000;
left: 800px;
top: 6px;

}


.header-search-bar {
    float: left;
     display: inline-block;
     width: 300px; 
     height: 33px;
     background: white;
     border: 3px solid #fff;
 }


.header-search-text {

    width: 90%; height: 20px;
    margin: 6px 0 0 9px;
    border: 0;
    line-height: 20px;
    font-weight: bold;
    font-size: 13px;
    outline: none;
}

.header-search-text-submit{

    width: 39px; height: 39px;
    margin: 0; border: 0;
    vertical-align: top;
    cursor: pointer;
    background: no-repeat center #E73524;
 	border: 3px solid #fff;
}

</style>
<div class="header-search-container">
         <span class="header-search-bar">
	<input type="text" class="header-search-text" />
    </span>
            <button type="submit" class="header-search-text-submit" style="background-image: url('resource/images/header-search.png');"></button>
</div>
<div class="main-header">

 
    <ul>
        <li><a href="${ctx}/customer/restaurant" style="border-right-style:solid; padding-right: 5px" >맛집 리스트</a></li>
        <li><a href="${ctx}/customer/map" style="border-right-style:solid; padding-right: 5px" >맛집 지도</a></li>
        <li><a href="${ctx}/customer/worldcup" style="border-right-style:solid; padding-right: 5px" >맛집 월드컵</a></li>
        <li><a href="${ctx}/customer/board">자유게시판</a></li>
      
        
        
        <c:if test="${empty pageContext.request.userPrincipal}">
							<li><a href="${ctx}/member/join">회원가입</a></li>    
						</c:if>
						
            
        
        
        <%-- <security:authorize access="!hasRole('ROLE_USER')">
					<li><a href="${ctx}/member/login">로그인</a></li>
				</security:authorize> --%>
				<c:if test="${empty pageContext.request.userPrincipal}">
							<li><a href="${ctx}/member/login">로그인</a></li>
						</c:if>
						
				<security:authorize access="hasRole('ROLE_USER')">
					<li>
					<c:url var="logout" value="/logout" />
						<form action="${logout}" method="post" id="logoutform">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
							<a href="javascript:logoutform.submit();">로그아웃</a></li>
						</form>
						</li>
				</security:authorize>
				
				<c:if test="${!empty pageContext.request.userPrincipal}">
							<li><a href="">내정보</a></li>
						</c:if>


    </ul>
</div>
<script type="text/javascript">

$(document).ready(function () {
    $(window).on("scroll",function(){ 
    var scroll = $(window).scrollTop();  
    
    if(scroll>350){    	 
    	$(".main-header").addClass("show");   
    	$(".header-search-container").addClass("show");   
    }else{    	 
    	$(".main-header").removeClass("show");
    	$(".header-search-container").removeClass("show");   
    }; 
    
  });     
 });
</script>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<header id="header">
	<div class="container clearfix">
		<a href="${ctx}/index" class="head-logo">런치 컨테이너</a>
		<nav class="gnb">
			<ul class="gnb-items">
				<li><a href="${ctx}/customer/restaurant">맛집 리스트</a></li>
				<li><a href="${ctx}/customer/map">맛집 지도</a></li>
				<li><a href="${ctx}/customer/worldcup">음식 월드컵</a></li>
				<li><a href="${ctx}/customer/board">자유게시판</a></li>
				<li><a href="${ctx}/member/join">회원가입</a></li>

				<security:authorize access="!hasRole('ROLE_USER')">
					<li><a href="${ctx}/member/login">로그인</a></li>
				</security:authorize>
				<c:if test="${empty pageContext.request.userPrincipal}">
							<li><a href="${ctx}/member/login">로그인</a></li>
						</c:if>
				<security:authorize access="hasRole('ROLE_USER')">
					<li><c:url var="logout" value="/logout" />
						<form action="${logout}" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> <input type="submit" value="로그아웃" />
						</form></li>
				</security:authorize>
			</ul>
		</nav>

		<div class="search-form margin-top first align-right">
			<h3 class="hidden">공지사항 검색폼</h3>
			<form class="table-form">
				<fieldset>
					<legend class="hidden">Restaurant 검색 필드</legend>
					<label class="hidden">검색분류</label> <select name="f">
						<option selected="selected" value="name">가게이름</option>
						<option value="genre">음식종류</option>
					</select> <label class="hidden">검색어</label> <input type="text" name="q" />
					<input class="btn btn-search" type="submit" value="검색" />
				</fieldset>
			</form>
		</div>

		<div class="my-info">
			<a href="">내 정보</a>
		</div>
	</div>
</header> --%>