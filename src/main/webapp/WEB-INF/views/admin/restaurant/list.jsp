<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<main id="main">
		<h1 class="main title">런치 리스트</h1>
		
		<div class="text-right space-top-1">
			<h3 class="hidden">식당 목록</h3>
			<div>
				<form action="list" method="get">
					<label class="hidden">검색분류</label>
					<select id="selectBox" name="selectBox">
						<option value="3">전체</option>
						<option value="0">승인대기</option>
						<option value="1">승인</option>
						<option value="2">비승인</option>
					</select> 
					<input type="text" name="query" />
					<input id="search" type="button" value="검색"/>
				</form>
			</div>
			<table class="table table-list space-top">
				<thead>
					<tr>
						<th class="w60">번호</th>
						<th class="w150">가게이름</th>
						<th class="w60">작성자</th>
						<!-- <th class="w80">작성자 사진</th>
						<th class="w80">음식 사진</th> -->
						<th class="w200">작성자 한마디</th>
						<th class="w100">날짜</th>
						<%-- <th class="w60"><input id="delete-button"  type="button" value="삭제" /></th> --%>
						<c:if test="${null eq param.o}">
							<th class="w60">승인여부</th>
							<th class="w60"><input id="delete-button"  type="button" value="삭제" /></th>
						</c:if>
						<c:if test="${'0' eq param.o}">
							<th class="w150" colspan="2">승인여부</th>
							<th class="w60" style="display:none"><input id="delete-button"  type="button" value="삭제" /></th>
						</c:if>
						<c:if test="${'1' eq param.o}">
							<th class="w100">승인여부</th>
							<th class="w60" style="display:none"><input id="delete-button"  type="button" value="삭제" /></th>
						</c:if>
						<c:if test="${'2' eq param.o or '3' eq param.o}">
							<th class="w100">승인여부</th>
							<th class="w60"><input id="delete-button"  type="button" value="삭제" /></th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<form action="restaurant-delete?${_csrf.parameterName}=${_csrf.token}" method="post">
						<c:forEach var="n" items="${list}">					
							<tr>
								<td>${n.id}</td>
								<td class=""><a href="../customer/restaurant/${n.id}">${n.name} (${n.countCmt})</a></td>
								<td>${n.writerName}</td>
								<%-- <td>${n.writerImage}</td>
								<td>${n.image}</td> --%>
								<td>${n.tip}</td>
								<td><fmt:formatDate	pattern="yyyy-MM-dd kk:mm:ss" value="${n.regDate}" /></td>
								<%-- <td>${n.ok}</td> --%>
								<c:if test="${'0' eq n.ok}">
									<td>승인대기</td>
									<td>
										<input type="checkbox" name="ids" value="${n.id}" style="display:none"/>
										<input class="ok" type="button" value="승인"/>
										<input class="deny" type="button" value="비승인"/>
									</td>
								</c:if>
								<c:if test="${'1' eq n.ok}">
									<td>승인</td>
									<td style="display:none">
										<input type="checkbox" name="ids" value="${n.id}" style="display:none"/>
										<input class="ok" type="button" value="승인" style="display:none"/>
										<input class="deny" type="button" value="비승인" style="display:none"/>
									</td>
								</c:if>
								<c:if test="${'2' eq n.ok}">
									<td>비승인</td>
									<td>
										<input type="checkbox" name="ids" value="${n.id}"/>
										<input class="ok" type="button" value="승인"  style="display:none"/>
										<input class="deny" type="button" value="비승인"  style="display:none"/>
									</td>
								</c:if>
							</tr>
						</c:forEach>
						<!-- <input type="submit" value="delete" style="display:none"/> -->
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
		
	</main>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- <script src="../../resource/js/moment.min.js"></script> -->
	<script>
	$(function(){
		//var okButton = $("input[value='승인']");
		var okButton = $(".ok");
		var denyButton = $(".deny");
		var pageNum = $(".pageNum");
		var searchButton = $("#search");
		var deleteButton = $("#delete-button");
		var submitButton = $("#submit-button");
		var ajaxData;
		
		//alert(okButton.length);
		//alert(denyButton.length);
		
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
		var ok = $.urlParam('o')?$.urlParam('o'):3;
		var query = $.urlParam('q')?$.urlParam('q'):"";
		
		$("#selectBox > option[value="+ok+"]").prop("selected", true);
		
		/* pageNum.click(function(){
			var index = pageNum.index($(this))+1;
			//alert(index);
			//alert("p: "+ index + "o: " + ok);
			
			var pathName = $(location).attr('pathname');
			var url = pathName + "?p=" + index + "&o=" + ok;
			
			$(location).attr('href', url);
		}) */
		
		for(var i=0; i<pageNum.length; i++){
			var pathName = $(location).attr('pathname');
			var url = pathName + "?p=" + (i+1) + "&o=" + ok;
			//alert(url);
			pageNum.eq(i).attr("href", url);
		}
		
		$("#selectBox").change(function(){
			ok = $(this).val();
			var pathName = $(location).attr('pathname');
			var url = pathName + "?p=" + 1 + "&o=" + ok;
			//alert(url);
			//alert($("#selectBox > option[value="+ok+"]").text());
			//$("#selectBox > option[value="+ok+"]").prop("selected", true);
			$(location).attr('href', url);
		});
		
		searchButton.click(function(){
			var query = $("input[name='query']").val();
			var pathName = $(location).attr('pathname');
			var url = pathName + "?p=" + page + "&o=" + ok + "&q=" + query;
			//alert(query);
			
			$(location).attr('href', url);
		})
		
		deleteButton.click(function(){
			var ids = $("input[name='ids']:checked").length;
			//alert(ids);
			if(ids>0){
				if(confirm("정말 삭제하시겠습니까?") == true)
					submitButton.click();
				else
					return;
			}
			else{
				alert("삭제할 식당을 선택하세요.");
				return;
			}
		});
		
		
		$("input[name='query']").keypress(function(event){
		    if (event.which == 13) {
		    	searchButton.click();
		        return false;
		    }
		});
		
		$.ajax({
			type:"POST",
			async: false,
			url: "../admin/restaurant-ajax?${_csrf.parameterName}=${_csrf.token}",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data: {"page":page, "ok":ok, "q":query},
			//data: {"page":page},
			dataType:"json",
			success: function (data) {
				var json = JSON.stringify(data);
				//alert(json);
				ajaxData = data;
				//alert("success");
			}
		});
		//alert(ajaxData[0].name);
		
		okButton.click(function() {
			var index = okButton.index($(this));
			alert(index);
			alert(ajaxData[index].name);
			
			$.ajax({
				type:"POST",
				//async: false,
				url: "restaurant?${_csrf.parameterName}=${_csrf.token}",
				data: {
					"restaurantId":ajaxData[index].id,
					"name":ajaxData[index].name,
					"regDate":ajaxData[index].regDate,
					"ok":1
				},
				dataType:"text",
				success: function (data) {
					//alert("success");
				}
			});
			
			location.reload();
		})
		
		denyButton.click(function() {
			var index = denyButton.index($(this));
			alert(index);
			alert(ajaxData[index].name);
			
			$.ajax({
				type:"POST",
				//async: false,
				url: "restaurant?${_csrf.parameterName}=${_csrf.token}",
				data: {
					"restaurantId":ajaxData[index].id,
					"name":ajaxData[index].name,
					"regDate":ajaxData[index].regDate,
					"ok":2
				},
				dataType:"text",
				success: function (data) {
					//alert("success");
				}
			});
			
			location.reload();
		})
		
	});
	</script>
		