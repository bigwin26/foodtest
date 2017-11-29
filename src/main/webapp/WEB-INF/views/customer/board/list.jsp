<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.main-dc{
    position: relative;
    float: left;
    width: 100%;
    height: auto;
    overflow-y: scroll;
    min-width: 960px;
    min-height: 100%;
    background-color: #ffebda;
}
.dc-wrapper {
    position: relative;
    width: 960px;
    height: auto;
    margin: 0 auto;
}
#main-area {
	position: relative;
	float: left;
	width: 100%;
	height: auto;
}

#main-wrapper {
	position: relative;
	width: 960px;
	height: auto;
	margin: 0 auto;
}
.mainWrapper {
    margin-bottom: 40px;
}
#listArea {
    float: left;
    width: 100%;
    height: auto;
    margin: 56px 0px;
}

#articleList {
	float: left;
	width: 100%;
	height: auto;
}

#article {
	float: left;
	width: 100%;
	min-height: 210px;
	padding: 24px 0px;
	border-bottom: 2px solid #fff;
}

.article-text {
	float: left;
	width: 760px;
	height: 150px;
	margin: 0px 0px 10px 0px;
	padding: 0px 120px 0px 0px;
	text-align: left;
}

.article-title {
	float: left;
	width: 640px;
	height: 31px;
	margin-bottom: 24px;
	color: #00cdcd;
	font-size: 22px;
	font-weight: bold;
	line-height: 31px;
}

.text-ellipsis {
	word-wrap: break-word;
	word-break: break-all;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.article-content {
	overflow: hidden;
	float: left;
	width: 640px;
	height: 81px;
	color: #000;
	font-size: 16px;
	line-height: 27px;
}
.article-date {
    float: left;
    width: auto;
    height: auto;
    color: #999;
    font-size: 16px;
    line-height: 24px;
}
.article-writername {
    float: right;
    width: auto;
    height: auto;
    color: #999;
    font-size: 16px;
    line-height: 24px;
}
</style>
<main id="main">
<div class="main-dc">
	<div id="main-wrapper" class="mainWrapper" style="min-height:799px;">
			<!-- <thead>
						<tr>
							<th  class="w60">번호</th>
							<th  class="expand">제목</th>
							<th  class="w100">작성자</th>
							<th class="w100">작성일</th>
							<th  class="w60">조회수</th>
						</tr>
					</thead> -->
			<div id="listArea">
				<ul id="articleList">
					<c:forEach var="n" items="${list}">
						<li id="article">
							<div style="display: none;">${n.id}</div>
							<div class="article-text">
								<div class="article-title text-ellipsis">
									<a href="board/${n.id}">${n.title}</a>
								</div>
								<div class="article-content">${n.content}</div>
							</div>
							<div class="article-date">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${n.regDate}" />
							</div>
							<div class="article-writername">${n.writerName}</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			</div>
		</div>
		<!-- <div class="indexer margin-top align-right">
			<h3 class="hidden">현재 페이지</h3>
			<div>
				<span class="text-orange text-strong">1</span> / 3 pages
			</div>
		</div>

		<div>
			<a href="board/reg">등록하기</a>
		</div>
		<div class="margin-top align-center pager"></div> -->
</main>
