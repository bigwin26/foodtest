<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<c:set var="url">${requestScope['javax.servlet.forward.request_uri']}</c:set>
<c:set var="isNotice">${fn:indexOf(url, "notice")>0?'current':''}</c:set>
<c:set var="isQuestion">${fn:indexOf(url, "question")>0?'current':''}</c:set>
<c:set var="isGuide">${fn:indexOf(url, "guide")>0?'current':''}</c:set>
<%-- <style>
.restaurant-photos {
	display: block; overflow : hidden;
	width: 100%;
	overflow: hidden;
}

.list-photo_wrap {
	height: 340px;
	opacity: 1;
	display: block;
	visibility: visible;
}

.owl-wrapper-outer {
	overflow: hidden;
	position: relative;
	width: 100%;
	height: inherit;
	
}

.owl-wrapper {
	width: 1250px;
    left: -100px;
    display: block;
    transition: all 0ms ease;
    transform: translate3d(0px, 0px, 0px);
    height: inherit;
    position: relative;
    overflow: hidden;
}

.owl-item {
	position: relative;
	width: 415px;
	height: inherit;
	    overflow: hidden;
	    float: left;
}
.restaurant-photos-item {
    display: block;
    position: relative;
    width: 100%;
    overflow: hidden;
    -webkit-background-size: cover;
    background-size: cover;
    background-position: 50% 50%;
    cursor: pointer;
    height: inherit;
}
.center-croping {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
</style>
<aside class="restaurant-photos">
	<div class="list-photo_wrap">
		<div class="owl-wrapper-outer">
			<div class="owl-wrapper">
				<div class="owl-item">
					<figure class="list-photo" style="display:block; height:inherit;">
						<figure class="restaurant-photos-item">
							<img class="center-croping" src="${ctx}/resource/images/staek.jpg">
						</figure>
					</figure>
				</div>
				<div class="owl-item">
					<figure class="list-photo" style="display:block; height:inherit;">
						<figure class="restaurant-photos-item">
							<img class="center-croping" src="${ctx}/resource/images/staek.jpg">
						</figure>
					</figure>
				</div>
				<div class="owl-item">
					<figure class="list-photo" style="display:block; height:inherit;">
						<figure class="restaurant-photos-item">
							<img class="center-croping" src="${ctx}/resource/images/staek.jpg">
						</figure>
					</figure>
				</div>
			</div>
		</div>
	</div>
</aside> --%>