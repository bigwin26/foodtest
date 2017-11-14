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
					<td><input type="button" value="승인"/></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="">
			<h3 class="hidden">현재 페이지</h3>
			<div><span class="">1</span> / 3 pages</div>
		</div>
	</main>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="../../resource/js/moment.min.js"></script>
	<script>
		var okButton = $("input[value='승인']");
				
		$.getJSON("restaurant-ajax")
			.done(function(data) {
				
				okButton.click(function(){
					var index = okButton.index($(this));
					//alert(index);
					//alert(okButton.index($(this)));
					/* var moment = monent();
					var dateTime = data[index].regDate;
					dateTime = moment(dateTime).format("YYYY-MM-DD HH:mm:ss"); */
					
					alert(data[index].name);
					alert(data[index].id);
					alert(data[index].regDate);
					
					var formData = new FormData();
					formData.append("name", data[index].name);
					formData.append("restaurantId", data[index].id);
					formData.append("regDate", data[index].regDate);
					
					var xhr = new XMLHttpRequest();
					
					xhr.onerror = function(e){
						alert("예기치 못한 오류");
					};
					xhr.open("POST", "?${_csrf.parameterName}=${_csrf.token}", true);	
					xhr.send(formData);
					
				})
				
			})
		
		
		
	</script>
		