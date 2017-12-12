<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <link rel="stylesheet" href="resource/css/reset.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resource/css/board.css"> --%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
  #footer_div {
    position:relative;
    bottom:0px;
    width:100%;
    height:30px;
    background-color: #e1e0db;
}
</style>
<main id="main"/>
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
									<span>${n.title}</span>
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
