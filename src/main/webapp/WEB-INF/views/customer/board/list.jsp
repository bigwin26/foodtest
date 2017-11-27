<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
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
    min-height: 848px;
    margin-bottom: 40px;
}
.table {
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
    height: auto;
    padding: 24px 0px;
    border-bottom: 2px solid #fff;
}
</style>
		<main class="main">
		<div id="main-area">
		<div id="main-wrapper">
			<h2 class="main title">공지사항</h2>
			<div class="notice margin-top">
				<h3 class="hidden">공지사항 목록</h3>
				<table class="table">
					<thead>
						<tr>
							<th  class="w60">번호</th>
							<th  class="expand">제목</th>
							<th  class="w100">작성자</th>
							<th class="w100">작성일</th>
							<th  class="w60">조회수</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="n" items="${list}">					
					<tr  id="articleList">
						<td id="article">${n.id}</td>
						<td id="article" class="title indent"><a href="board/${n.id}">${n.title}</a></td>
						<td id="article">${n.writerName}</td>
						<td  id="article" >
							<fmt:formatDate pattern="yyyy-MM-dd" value="${n.regDate}"/>		
						</td>
						<td id="article">12</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="indexer margin-top align-right">
				<h3 class="hidden">현재 페이지</h3>
				<div><span class="text-orange text-strong">1</span> / 3 pages</div>
			</div>

			<div>
				<a href="board/reg">등록하기</a>
			</div>
			<div class="margin-top align-center pager">
				<new:pager />
			</div>
			</div>
			</div>
		</main>
		