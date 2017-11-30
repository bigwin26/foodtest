<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- <link rel="stylesheet" href="resource/css/reset.css"> -->
<%-- <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/customer-restaurant.css"> --%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<!-- <div id="visual">
		<div class="content-container">
			<h1 class="customer-text">맛집 리스트</h1>
		</div>
	</div> -->
	
	<main id="main" />
		<div class="restaurant-cards">
		
		<c:forEach var="n" items="${list}" begin="0" end="${fn:length(list)}">
			
			<a href="restaurant/${n.id}">
			<div class="restaurant-card">
				<div class="img-wrapper">
					<!-- <img class="img-size" src="../resource/images/1.jpg"> -->
					<div class="gradation">
						<div class="inner-restaurant-info">
							<span class="name">${n.name}</span>
							<p class="tip">${n.genre}</p>
							<p class="tip">"${n.tip}"</p>
						</div>
					</div>
				</div>
			</div>
			</a>
		
		</c:forEach>
		
		</div>
	
		<div>
			<a href="restaurant/reg">가게 등록!</a>
		</div>
		<div class="">
			<h3 class="hidden">현재 페이지</h3>
			<div><input type="button" class="restaurant-ajax" value="더보기"/></div>
		</div>
	
	
	
	
	
		<%-- <div class="">
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
		</div> --%>
		<!-- <img src="../resource/customer/restaurant/2017/41/rockefeller-center-christmas-tree-2014.jpg" style="width: 320px; height: 130px;"> -->
		<!-- <div>
			<a href="restaurant/reg">가게 등록!</a>
		</div>
		<div class="">
			<h3 class="hidden">현재 페이지</h3>
			<div><input type="button" class="restaurant-ajax" value="더보기"/></div>
		</div> -->
		
		
	</main>
		
	<script type="text/javascript">
	$(function(){
		
		$("#visual")
		.css({
			"height": "300px",
			"background": "#313131 url(../resource/images/customer-visual3.jpg) center",
			"background-size": "cover",
		    "border-top": "solid 3px #f15c22",
		    "background-position": "30% 30%"
		});
		
		$("#visual .content-container")
		.css({
			"display": "flex",
		    "align-items": "center",
		    "justify-content": "center"
		});
		
		$("#visual .customer-text")
		.css({
			"font-size": "30px",
	    	"color": "white"
		});
		
		$("#visual .content-container .customer-text").text("맛집 리스트");
		
		
		
		var page = 1;
		
		$(".restaurant-ajax").click(function(){
           	page +=1;
			$.ajax({
				type:"POST",
				url: "restaurant-ajax?${_csrf.parameterName}=${_csrf.token}",
				data: {"page":page},
				dataType:"json", 
				success:function(data){
					//console.log(data)	
					var content="";
		            for(var i=0; i<data.length; i++){
		            	content +=
		            		"<a href='restaurant/"+data[i].id+"'>"+
			    			"<div class='restaurant-card'>"+
			    				"<div class='img-wrapper'>"+
			    					"<div class='gradation'>"+
			    						"<div class='inner-restaurant-info'>"+
			    							"<span class='name'>"+data[i].name+"</span>"+
			    							"<p class='tip'>"+data[i].genre+"</p>"+
			    							"<p class='tip'>"+data[i].tip+"</p>"+
			    						"</div>"+
		    						"</div>"+
	    						"</div>"+
    						"</div>"+
    						"</a>";
		            }
		            $(".restaurant-cards").append(content);
		            	
		            	/* content +=
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
				$("tbody").append(content);	 */  
				
				}, error:function(request,status,error){
		            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		           }
			});
		});
	});
	</script>
