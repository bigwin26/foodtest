<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<main id="main" />
		<h2 class="main title">런치 리스트</h2>
		<div class="">
			<h3 class="hidden">레스토랑 목록</h3>
			<table class="">
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
							<td class=""><a href="restaurant/${n.id}">${n.name} (${n.countCmt})</a></td>
							<td>${n.image}</td>
							<td>${n.writerName}</td>
							<td>${n.writerImage}</td>
							<td>${n.tip}</td>
							<td>${n.countLiked}</td>
							<td>${n.avgPoint}</td>
						</tr>
					</c:forEach>
					<template>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</template>
				</tbody>
			</table>
		</div>
		<div>
			<a href="restaurant/reg">가게 등록!</a>
		</div>
		<div class="">
			<h3 class="hidden">현재 페이지</h3>
			<div><a href="restaurant-ajax" class="">더보기</a></div>
		</div>
	</main>
		
	<script>
	addEventListener("load", function() {
		var cloneButton = document.querySelector("#ex2-clone input[value='단순복제']");
		var ajaxButton = document.querySelector("#ex2-clone input[value='Ajax요청']");
		var tbody = document.querySelector("#ex2-clone tbody");
		var template = document.querySelector("#ex2-clone template");
		var btn = document.querySelector(".btn");
		
		var data = [
			{id:"1", title:"자바스크립트", writerId:"newlec"},
			{id:"2", title:"자바스크립트2", writerId:"newl2ec"},
			{id:"3", title:"자바스크립트3", writerId:"newl3ec"}
		];
		
		ajaxButton.onclick = function(e){
			/* 동기형으로 일하는 방식 */
			/* var xhr = new XMLHttpRequest();
			xhr.open("GET", "../../customer/notice-ajax", false); //요청하기 위한 설정
			xhr.send(); // 요청을 하는것
			data = eval(xhr.responseText); */
			
			/* 비동기형 */
			var xhr = new XMLHttpRequest();
			/* xhr.onreadystatechange = function(e){
				if(xhr.readyState == 4)	
					data = eval(xhr.responseText);
			}; */
			xhr.onload = function(){
				data = JSON.parse(xhr.responseText);
				btn.removeChild(btn.lastChild);
			};
			
			xhr.onerror = function(e){
				alert("오류가 발생하였씁니다.");
			};
			
			xhr.open("GET", "../../customer/notice-ajax", true); //요청하기 위한 설정
			xhr.send(); // 요청을 하는것
			
			
			//1. ajax icon 추가
			var img = document.createElement("img");
			img.src = "../images/Pacman.gif";
			img.style.width = "20px";
			img.style.height = "20px";
			btn.appendChild(img);
			
		};
		
		cloneButton.onclick = function(e){
			//template을 지원하는지
			
			//계속해서 새로운 클론을 만들어 냄. 
			if('content' in template){
				
				for(var i =0; i<data.length; i++){
					var clone = document.importNode(template.content, true);
					var tds = clone.querySelectorAll("td");
					
					tds[0].textContent = data[i].id;
					tds[1].textContent = data[i].title;
					tds[2].textContent = data[i].writerId;
					
					tbody.appendChild(clone);
				}
				//값이 성정된 content 를 복제
				
			}
		};
		
	});
	</script>
