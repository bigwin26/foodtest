<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<main id="main">
		<%-- admin member page
		${list} --%>
		<h1 class="main title">회원 리스트</h1>
							
		<div class="text-right space-top-1">
			<h3 class="hidden">식당 목록</h3>
			<div>
				<form action="list" method="get">
					<label class="hidden">검색분류</label>
					<select id="selectBox" name="selectBox">
						<option value="all">전체</option>
						<option value="email">이메일</option>
						<option value="nickName">닉네임</option>
						<option value="mentor">멘토</option>
					</select> 
					<input type="text" name="query" />
					<input id="search" type="button" value="검색"/>
				</form>
			</div>
			
			<table class="table table-list space-top">
				<thead>
					<tr>
						<th class="w60">번호</th>
						<th class="w100">이메일</th>
						<th class="w100">닉네임</th>
						<th class="w60">역할</th>
						<th class="w150">가입일</th>
						<th class="w60">멘토</th>
						<th class="w60"><input id="" type="button" value="탈퇴" /></th>
					</tr>
				</thead>
				<tbody>
					<form action="member-delete?${_csrf.parameterName}=${_csrf.token}" method="post">
						<c:forEach var="n" items="${list}">					
							<tr>
								<td>${n.id}</td>
								<td>${n.email}</td>
								<td>${n.nickName}</td>
								<c:if test="${'0' eq n.role}">
									<td>일반회원</td>
								</c:if>
								<c:if test="${'1' eq n.role}">
									<td>관리자</td>
								</c:if>
								<td><fmt:formatDate	pattern="yyyy-MM-dd kk:mm:ss" value="${n.regDate}" /></td>
								<td>${n.mentor}</td>
								<td><input type="checkbox" name="ids" value="${n.id}"/></td>
							</tr>
						</c:forEach>
						<input type="submit" value="delete" style="display:none"/>
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
		
	</main>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
	$(function(){
		var pageNum = $(".pageNum");
		var searchButton = $("#search");
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
		
		$("input[name='query']").keypress(function(event){
		    if (event.which == 13) {
		    	searchButton.click();
		        return false;
		    }
		});
		
		$.ajax({
			type:"POST",
			async: false,
			url: "../admin/member-ajax?${_csrf.parameterName}=${_csrf.token}",
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