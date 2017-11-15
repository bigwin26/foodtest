<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
					<select id="f" name="f">
						<option>선택</option>
						<option value="wait" selected="selected">승인대기</option>
						<option value="ok">승인</option>
						<option value="deny">비승인</option>
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
					<c:forEach var="n" items="${list}">					
					<tr>
						<td>${n.id}</td>
						<td class=""><a href="restaurant/${n.id}">${n.name} (${n.countCmt})</a></td>
						<td>${n.writerName}</td>
						<td>${n.writerImage}</td>
						<td>${n.image}</td>
						<td>${n.tip}</td>
						<td>${n.regDate}</td>
						<td>${n.ok}</td>
						<td><input class="ok" type="button" value="승인"/></td>
					</tr>
					</c:forEach>
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
						</c:if>

						<c:if test="${startPage+i>lastPage}">
							<li>${startPage+i}</li>
						</c:if>
					</c:forEach>
				</ul>
				<div>
					<c:if test="${lastPage>=startPage+5}">
						<a href="?p=${startPage+5}">다음</a>
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
		var num = $(".num");
		var i=1;
		/* num.click(function(){
			i = num.index($(this))+1;
			alert("page: " + i);
			//i = parseInt(i);
			//alert(num.eq(0).text());
		}) */
		
		/* okButton.click(function() {
			var index = okButton.index($(this));
			alert("hi~");
		}) */
		//var ajaxData;
		
		//var return_first;
		/* function callback(response) {
			//alert("hi");
		 	return_first = response;
		 	alert(return_first[1].name);
		} */
		var ajaxData;
		
		if(i==1){
			alert("page: " + i);
			$.ajax({
				type:"POST",
				url: "../admin/restaurant-ajax?${_csrf.parameterName}=${_csrf.token}",
				data: {"page":i},
				dataType:"json"
			}).done(function(data){
				var json = JSON.stringify(data);
				//alert(json);
				ajaxData = data;
				//test();
				/* okButton.click(function() {
			 		alert("hi");
					var index = okButton.index($(this));
					//alert(return_first);
				}) */
			});
		}
		
		num.click(function(){
			i = num.index($(this))+1;
			alert("page: " + i);
			
			$.ajax({
				type:"POST",
				url: "../admin/restaurant-ajax?${_csrf.parameterName}=${_csrf.token}",
				data: {"page":i},
				dataType:"json"
			}).done(function(data){
				var json = JSON.stringify(data);
				alert(json);
				ajaxData = data;
			});
			
		})
		
		okButton.click(function(){
			alert(ajaxData[1].name);
		})
		
		
		
		//alert(return_first);
		/* okButton.click(function() {
		 		//alert("hi");
				var index = okButton.index($(this));
				alert(return_first);
		}) */
		

		

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
		