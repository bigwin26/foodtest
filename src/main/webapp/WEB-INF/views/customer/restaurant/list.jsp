<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<main id="main" />
		<h2 class="main title">런치 리스트</h2>
		<div class="">
			<h3 class="hidden">레스토랑 목록</h3>
			<table class="restaurant-list">
				<thead>
					<tr>
						<th class="">번호</th>
						<th class="">가게이름</th>
						<th class="">음식 사진</th>
						<th class="">작성자</th>
						<th class="">작성자 사진</th>
						<th class="">작성자 한마디</th>
						<th class="">좋아요</th>
						<th class="">평점</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${list}">					
						<tr>
							<td>${n.id}</td>
							<td><a href="restaurant/${n.id}">${n.name} (${n.countCmt})</a></td>
							<td>${n.image}</td>
							<td>${n.writerName}</td>
							<td>${n.writerImage}</td>
							<td>${n.tip}</td>
							<td>${n.countLiked}</td>
							<td>${n.avgPoint}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<a href="restaurant/reg">가게 등록!</a>
		</div>
		<div class="">
			<h3 class="hidden">현재 페이지</h3>
			<div><input type="button" class="restaurant-ajax" value="더보기"/></div>
		</div>
	</main>
		
	<script type="text/javascript">
	$(function(){
		var page = 1;
		
		$(".restaurant-ajax").click(function(){
           	page +=1;
			$.ajax({
				type:"POST",
				url: "../customer/restaurant-ajax?${_csrf.parameterName}=${_csrf.token}",
				data: {"page":page},
				dataType:"json", 
				success:function(data){
					//console.log(data)	
					var content="";
		            for(var i=0; i<data.length; i++){
		                content +=
		                "<tr>"+
		                    "<td>"+data[i].id+"</td>"+
		                    "<td><a href=restaurant/"+data[i].id+">"+data[i].name+"</a></td>"+
		                    "<td>"+data[i].image+"</td>"+
		                    "<td>"+data[i].writerName+"</td>"+
		                    "<td>"+data[i].writerImage+"</td>"+
		                    "<td>"+data[i].tip+"</td>"+
		                    "<td>"+data[i].countLiked+"</td>"+
		                    "<td>"+data[i].avgPoint+"</td>"+
		                "</tr>";
		            }
				$("tbody").append(content);	  
				
				}, error:function(request,status,error){
		            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		           }
			});
		});
	});
	</script>
