<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<style>
  #footer_div {
position: absolute;
    bottom: 0px;
    width: 100%;
    height: 30px;
    background-color: #e1e0db;
    z-index: 2;
}
div#footer_text {
	color: #808184;
    text-align: center;
    font-size: 14px;
    line-height: 30px;
}
</style>
	<main id="main">
		<%-- <div>
			list-length: ${fn:length(list)}</br>
			count: ${count}</br>
		</div> --%>
	
		<h1 class="main title">공지사항</h1>
		
		<div class="text-right space-top-1">
			<div style="float: left;"><input type="button" onclick="location.href='${ctx}/admin/notice/reg'" value="글쓰기"></div>
			<div>
				<form action="list" method="get">
					<label class="hidden">검색분류</label>
					<select id="selectBox" name="selectBox">
						<option value="all">전체</option>
						<option value="title">제목</option>
						<option value="writerName">닉네임</option>
						<option value="content">내용</option>
					</select> 
					<input type="text" name="query" />
					<input id="search" type="button" value="검색"/>
				</form>
			</div>
			
			<table class="table table-list space-top">
				<thead>
					<tr>
						<th class="w60">번호</th>
						<th class="w60">제목</th>
						<th class="w60">작성자</th>
						<th class="w150">내용</th>
						<th class="w100">등록일</th>
						<!-- <th class="w60"><input id="delete-button" type="button" value="탈퇴" /></th> -->
					</tr>
				</thead>
				<tbody>
					<form action="notice-delete?${_csrf.parameterName}=${_csrf.token}" method="post">
						<c:forEach var="n" items="${list}">					
							<tr>
								<td>${n.id}</td>
								<td><a href="notice/${n.id}">${n.title}</a></td>
								<td>${n.writerName}</td>
								<td>${n.content}</td>
								<td><fmt:formatDate	pattern="yyyy-MM-dd kk:mm:ss" value="${n.regDate}" /></td>
								<%-- <td><input type="checkbox" name="ids" value="${n.id}"/></td> --%>
							</tr>
						</c:forEach>
						<input id="submit-button" type="submit" value="delete" style="display:none"/>
					</form>
				</tbody>
			</table>
			
			<c:set var="page" value="${param.p}" /> 
			<c:set var="startPage"	value="${page-(page-1)%5 }" />
			<c:set var="lastPage" value="${fn:substringBefore((count%10 ==0 ? count / 10 : count/10+1),'.')}" /><!-- 삼항연산자 -->
			<%-- <div>count: ${count}</div>
			<div>page: ${page}</div>
			<div>startPage: ${startPage}</div>
			<div>lastPage: ${lastPage}</div> --%>	
			<div class="hr-list admin-page">
				<div><a href="?p=1">이전</a></div>
				<ul>
					<c:forEach var="i" begin="0" end="4">
						<c:if test="${startPage+i<=lastPage}">
							<li><a class="pageNum">${startPage+i}</a></li>
							<%-- <li><a class="pageNum" href="?p=${startPage+i}">${startPage+i}</a></li> --%>
							<%-- <li><a class="pageNum">${startPage+i}</a></li> --%>
						</c:if>

						<c:if test="${startPage+i>lastPage}">
							<li>${startPage+i}</li>
						</c:if>
					</c:forEach>
				</ul>
				<div>
					<c:if test="${lastPage>=startPage+5}">
						<a href="?p=${startPage+5}">다음</a>
						<a>다음</a>
					</c:if>
				</div>
			</div>
		</div>
	
	
		<%-- <h2 class="main title">공지사항</h2>
		
		<div class="search-form margin-top first align-right">
			<h3 class="hidden">공지사항 검색폼</h3>
			<form class="table-form">
				<fieldset>
					<legend class="hidden">공지사항 검색 필드</legend>
					<label class="hidden">검색분류</label> 
					<select name="t">
						<option selected="selected" value="TITLE">제목</option>
						<option value="WRITER">작성자</option>
					</select> 
					<label class="hidden">검색어</label> 
					<input type="text" name="q"/>
					<input class="btn btn-search" type="submit" value="검색" />
				</fieldset>
			</form>
		</div>
					
		<div class="notice margin-top">
			<h3 class="hidden">공지사항 목록</h3>
			<table class="table">
				<thead>
					<tr>
						<th class="w60">번호</th>
						<th class="expand">제목</th>
						<th class="w100">작성자</th>
						<th class="w100">작성일</th>
						<th class="w60">조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="n" items="${list}">					
				<tr>
					<td>${n.id}</td>
					<td class="title indent"><a href="notice/${n.id}">JSP란 무엇인가JSP란 무엇인가JSP란 무엇인가JSP란 무엇인가JSP란 무엇인가JSP란 무엇인가JSP란 무엇인가JSP란 무엇인가JSP란 무엇인가JSP란 무엇인가</a></td>
					<td>newlec</td>
					<td>
						<fmt:formatDate pattern="yyyy-MM-dd" value="2017-02-28"/>		
					</td>
					<td>12</td>
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
		<a href="notice/reg">등록하기</a>
		</div>

		<div class="margin-top align-center pager">
			<new:pager />
		</div> --%>
	</main>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
	
	$(function(){
		var pageNum = $(".pageNum");
		var searchButton = $("#search");
		var deleteButton = $("#delete-button");
		var submitButton = $("#submit-button");
		var ajaxData;
		
		
		$.urlParam = function(name){
		    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
		    //return results[1] || 0;
		    if (results==null){
		        return null;
		     }
		     else{
		        return results[1] || 0;
		     }
		}
		
		var page = $.urlParam('p')?$.urlParam('p'):1;
		var field = $.urlParam('f')?$.urlParam('f'):"all";
		var query = $.urlParam('q')?$.urlParam('q'):"";
		
		$("#selectBox > option[value=" + field + "]").prop("selected", true);
		//alert(field);
		
		for(var i=0; i<pageNum.length; i++){
			var pathName = $(location).attr('pathname');
			var url = pathName + "?p=" + (i+1) + "&f=" + field;
			//alert(url);
			pageNum.eq(i).attr("href", url);
		}
		
		$("#selectBox").change(function(){
			field = $(this).val();
			var pathName = $(location).attr('pathname');
			var url = pathName + "?p=" + 1 + "&f=" + field;
			//alert(url);
			//alert($("#selectBox > option[value="+ok+"]").text());
			//$("#selectBox > option[value="+ok+"]").prop("selected", true);
			$(location).attr('href', url);
		});
		
		searchButton.click(function(){
			var query = $("input[name='query']").val();
			var pathName = $(location).attr('pathname');
			var url = pathName + "?p=" + page + "&f=" + field + "&q=" + query;
			//alert(query);
			
			$(location).attr('href', url);
		})
		
		/* deleteButton.click(function(){
			var ids = $("input[name='ids']:checked").length;
			//alert(ids);
			if(ids>0){
				if(confirm("정말 탈퇴 시키겠습니까?") == true)
					submitButton.click();
				else
					return;
			}
			else{
				alert("탈퇴시킬 회원을 선택하세요.");
				return;
			}
		}); */
		
		$("input[name='query']").keypress(function(event){
		    if (event.which == 13) {
		    	searchButton.click();
		        return false;
		    }
		});
		
		$.ajax({
			type:"POST",
			async: false,
			url: "../admin/notice-ajax?${_csrf.parameterName}=${_csrf.token}",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data: {"page":page, "f":field, "q":query},
			dataType:"json",
			success: function (data) {
				var json = JSON.stringify(data);
				//alert(json);
				ajaxData = data;
				//alert("success");
			}
		});
		//alert(ajaxData[0].name);
		
		
	});
	
	</script>
	
		