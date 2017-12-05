<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
.main-header a {
	position: relative;
	top: 0;
	font-weight: 700;
	cursor: pointer;
	text-decoration: none;
	color: #ffffff;
}

.main-header {
	position: fixed;
	padding: 15px 50px 15px 50px;
	z-index: 999;
	width: 100%;
}

.main-header.show {
	position: fixed;
	padding: 15px 50px 15px 50px;
	z-index: 999;
	width: 100%;
	background-color: #f15c22;
}

.main-header li {
	display: inline;
}

.main-header li:nth-child(5) {
	display: inline;
	float: right;
	padding-right: 100px;
}

.main-header li:nth-child(6) {
	display: inline;
	float: right;
	padding-right: 5px;
}

.main-header li:nth-child(7) {
	display: inline;
	float: right;
}

.main-header li:nth-child(8) {
	display: inline;
	float: right;
	padding-right: 5px;
}

.header-search-container {
	display: none;
}

.header-search-container.show {
	position: fixed;
	display: inline-block;
	z-index: 1000;
	left: 42.5%;
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
	width: 90%;
	height: 20px;
	margin: 6px 0 0 9px;
	border: 0;
	line-height: 20px;
	font-weight: bold;
	font-size: 13px;
	outline: none;
}

.header-search-text-submit {
	width: 39px;
	height: 39px;
	margin: 0;
	border: 0;
	vertical-align: top;
	cursor: pointer;
	background: no-repeat center #f15c22;
	border: 3px solid #fff;
}

#gnb-right-menu{
   float: right;
   position: relative;
   right:100px;
   top:-11;
}

   #gnb-right-menu .my{
      top: -10;
    /* padding: 40px 15px; */
    color: white;
    float: right;
    line-height: 0px;
    padding-right: 75px;
    height: 30px;
   } 
    #gnb-right-menu .my:visited .dropdown-content{
    display: inline-block;
     
   }     
  
      
      #gnb-right-menu .my .name{
         color: white;
      }
      
      #gnb-right-menu .my:hover .name{
         color:#48C6C3;
      }     
   
      #gnb-right-menu .my-picture{
         width: 40px;
         height: 40px;
          border-radius: 50%;
          object-fit: cover;
          object-position: 50% 50%;
          position: absolute;
          right: 20px;
          top: 20px;
   }
   
 

.dropdown-content {
	top: 30px;
	right: -3px;
	display: none;
	position: absolute;
	background-color: AliceBlue;
	min-width: 120px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	border-radius: 5px;
}

.dropdown-content a {
	color: black;
	padding: 18px 16px;
	text-decoration: none;
	display: block;
	border-bottom: 1px solid #bbb;
}

.dropdown-content a:last-child {
	border-bottom: none;
}

.dropdown-content a:hover {
	background-color: #f15c22;
}

.dropdown-content:hover a:first-child{

border-radius: 5px 5px 0 0;

}

.dropdown-content:hover a:last-child{
border-radius: 0 0 5px 5px;

}

.my:hover .dropdown-content {
	display: block;
}

 .top-user-prof{
    overflow: hidden;
    position: absolute;
    z-index: 11;
    top: -19;
    right: 0px;
    width: 40px;
    height: 40px;
    background-color: #e0e0e0;
    border-radius: 100%;
    -moz-border-radius: 100%;
    -webkit-border-radius: 100%;
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    border: 2px solid #fff;
        }
        .top-user-prof img{
            position:relative;
            margin:-2px;
            width:40px;
            height:40px;
            border-radius: 100%; -moz-border-radius: 100%; -webkit-border-radius: 100%;
            box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;

        }

        #user_img {
            width: 40px;
            height: 40px;
            /*border: 2px solid #fff;*/
            z-index: 11;
        }

        #search_menu img {
            height: 30px;
        }
        #my_menu_list a {
            color: #000;
        }
        #my_menu_list a:hover {
            color: #fff;
            background-color: rgba(0, 205, 205, .85);
        }
        .pic-loading-wrap {
            position: absolute;
            top: 25%;
            left: 24%;
            width:50%;
            height: 50%;
        }
   
</style>
<div class="header-search-container">
	<span class="header-search-bar"> <input type="text"
		class="header-search-text" />
	</span>
	<button type="submit" class="header-search-text-submit"
		style="background-image: url('resource/images/header-search.png');"></button>
</div>
<div class="main-header">
	<ul>
		<li><a href="${ctx}/customer/restaurant"
			style="padding-right: 5px">맛집 리스트</a></li>
		<li><a href="${ctx}/customer/map"
			style="padding-right: 5px">맛집 지도</a></li>
			
		<li><a href="${ctx}/customer/notice">공지사항</a></li>
</ul>
			<div id="gnb-right-menu">
				<div class="my">
					<security:authentication property="name" />님					
					
					<div class="top-user-prof"> 
					<div class="pic-loading-wrap">
					<div class="pic-loader">
					</div>
					</div> 
					<img id="user_img" src="${ctx}/resource/userimages/<security:authentication property="name"/>/<security:authentication property="name"/>.png"/>
 
					</div>
					
					<div class="dropdown-content">
					<c:if test="${!empty pageContext.request.userPrincipal.name}">
					<a id="info">내정보</a>
					<form id="submituser" action="${ctx}/member/edit" method="post" accept-charset="UTF-8">
					<input type="hidden" name="useremail" value="<security:authentication property="name"/>">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>
					
					
					
					</c:if>
						<a href="${ctx}/member/list">좋아요</a>
					
		<security:authorize access="hasRole('ROLE_ADMIN')">
		<a href="${ctx}/admin/restaurant">관리자</a>
		</security:authorize>	
		<security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
			<c:url var="logout" value="/logout" />
				<form action="${logout}" method="post" id="logoutform">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <a href="javascript:logoutform.submit();">로그아웃</a>
				</form>
		</security:authorize>					
					</div>
				</div>
			</div>

		<%-- <security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
			<li><c:url var="logout" value="/logout" />
				<form action="${logout}" method="post" id="logoutform">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <a
						href="javascript:logoutform.submit();">로그아웃</a></li>
			</form>
			</li>
		</security:authorize>

		<c:if test="${!empty pageContext.request.userPrincipal}">
			<li><a href="${ctx}/member/login/${nickName}"></a></li>
			<li><security:authentication property="name" />님</li>
		</c:if> --%>
		

</div>

<script type="text/javascript">


	$(function (){
		
		$("#info").click(function(){

			$("#submituser").submit();
		})
	});
		
		
	

$(function () {
	var chkimg = $("#user_img").attr("src");
	if(chkimg=="resource/userimages/user.png"){
		$("#user_img").attr("src","resource/userimages/user.png");
	}
	
 });

$(function () {
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