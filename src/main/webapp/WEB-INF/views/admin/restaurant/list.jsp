<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<main id="main" />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
		<h2 class="main title">런치 리스트</h2>
							
		<div class="">
			<h3 class="hidden">레스토랑 목록</h3>
			<div>
				<form action="list" method="get">
					<select id="selectBox" name="selectBox">
						<option value="3">전체</option>
						<option value="0">승인대기</option>
						<option value="1">승인</option>
						<option value="2">비승인</option>
					</select> 
					<!-- <input type="text" name="query" /> 
					<input type="submit" /> -->
				</form>
			</div>
			<table class="">
				<thead>
					<tr>
						<th class="">번호</th>
						<th class="">가게이름</th>
						<th class="">작성자</th>
						<th class="">작성자 사진</th>
						<th class="">음식 사진</th>
						<th class="">작성자 한마디</th>
						<th class="">날짜</th>
						<th class="">승인여부</th>
					</tr>
				</thead>
				<tbody>
					<form action="restaurant-delete?${_csrf.parameterName}=${_csrf.token}" method="post">
						<c:forEach var="n" items="${list}">					
							<tr>
								<td>${n.id}</td>
								<td class=""><a href="../customer/restaurant/${n.id}">${n.name} (${n.countCmt})</a></td>
								<td>${n.writerName}</td>
								<td>${n.writerImage}</td>
								<td>${n.image}</td>
								<td>${n.tip}</td>
								<td><fmt:formatDate	pattern="yyyy-MM-dd kk:mm:ss" value="${n.regDate}" /></td>
								<%-- <td>${n.ok}</td> --%>
								<c:if test="${'0' eq n.ok}">
									<td>승인대기</td>
									<td><input class="ok" type="button" value="승인"/></td>
									<td><input class="deny" type="button" value="비승인"/></td>
								</c:if>
								<c:if test="${'1' eq n.ok}">
									<td>승인</td>
								</c:if>
								<c:if test="${'2' eq n.ok}">
									<td>비승인</td>
									<td><input type="checkbox" name="ids" value="${n.id}"/></td>
								</c:if>
							</tr>
						</c:forEach>
						<tr>
							<td>
								<input type="submit" value="삭제" />
							</td>
						</tr>
					</form>
				</tbody>
			</table>
			
			<c:set var="page" value="${param.p}" /> 
			<c:set var="startPage"	value="${page-(page-1)%5 }" />
			<c:set var="lastPage" value="${fn:substringBefore((count%10 ==0 ? count / 10 : count/10+1),'.')}" /><!-- 삼항연산자 -->
						
			<div>
				<div><a href="?p=1">이전</a></div>
				<ul>
					<c:forEach var="i" begin="0" end="4">
						<c:if test="${startPage+i<=lastPage}">
							<li><a class="num" href="?p=${startPage+i}">${startPage+i}</a></li>
							<%-- <li><a class="num">${startPage+i}</a></li> --%>
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
		var num = $(".num");
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
		var ok = $.urlParam('o')?$.urlParam('o'):3;
		$("#selectBox > option[value="+ok+"]").prop("selected", true);
		
		$("#selectBox").change(function(){
			ok = $(this).val();
			var pathName = $(location).attr('pathname');
			var url = pathName + "?p=" + page + "&o=" + ok;
			
			//alert($("#selectBox > option[value="+ok+"]").text());
			//$("#selectBox > option[value="+ok+"]").prop("selected", true);
			$(location).attr('href', url);
		});
				
		$.ajax({
			type:"POST",
			async: false,
			url: "../admin/restaurant-ajax?${_csrf.parameterName}=${_csrf.token}",
			data: {"page":page, "ok":ok},
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
						alert("success");
					}
				});
				
			location.reload();
		})
		
		denyButton.click(function() {
				var index = denyButton.index($(this));
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
						alert("success");
					}
				});
				
			location.reload();
		})
		
		/* $.getJSON("restaurant-ajax")
				.done(function(data) {
					//alert(data.length);
					okButton.click(function() {
						var index = okButton.index($(this));
						//alert(index);
						//alert(okButton.index($(this)));
			
						alert(data[index].id + ": " + data[index].name);
						//alert(data[index].regDate);
			
						var formData = new FormData();
						formData.append("name", data[index].name);
						formData.append("restaurantId", data[index].id);
						formData.append("regDate", data[index].regDate);
			
						var xhr = new XMLHttpRequest();
			
						xhr.onerror = function(e) {
							alert("예기치 못한 오류");
						};
						xhr.open("POST", "?${_csrf.parameterName}=${_csrf.token}", true);
						xhr.send(formData);
			
					})
				}); */

		
	});
	</script>
		