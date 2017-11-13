<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<main class="main" ng-controller="notice-controller">
<%-- 			<h2 class="main title">고객문의</h2>
			
			<div class="breadcrumb">
				<h3 class="hidden">경로</h3>
				<ul>
					<li>home</li>
					<li>고객센터</li>
					<li>고객문의</li>
				</ul>
			</div>
			
			<div class="search-form margin-top first align-right">
				<h3 class="hidden">고객문의  검색폼</h3>
				<form class="table-form">
					<fieldset>
						<legend class="hidden">고개문의 검색 필드</legend>
						<label class="hidden">검색분류</label> 
						<select name="t">
							<option selected="selected" value="TITLE">제목</option>
							<option value="WRITER">작성자</option>
						</select> 
						<label class="hidden">검색어</label> 
						<input type="text" name="q" /> 
						<input class="btn btn-search" type="submit" value="검색" />
					</fieldset>
				</form>
			</div>
						
			<div class="notice margin-top">
				<h3 class="hidden">고객문의 목록</h3>
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
						<td class="title indent"><a href="question/${n.id}">JSP란 무엇인가JSP란 무엇인가JSP란 무엇인가JSP란 무엇인가JSP란 무엇인가JSP란 무엇인가JSP란 무엇인가JSP란 무엇인가JSP란 무엇인가JSP란 무엇인가</a></td>
						<td>newlec</td>
						<td>
							<fmt:formatDate pattern="yyyy-MM-dd" value="2017-02-28"/>		
						</td>
						<td>12</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="4" class="title indent text-align-left"><a href="question/${n.id}/answer"  class="re text-strong text-orange">답변이</a></td>						
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="indexer margin-top align-right">
				<h3 class="hidden">현재 페이지</h3>
				<div><span class="text-orange text-strong">1</span> / 3 pages</div>
			</div>
			
			<div class="margin-top text-align-right">
				<a href="question/reg" class="btn btn-ask">문의하기</a>
			</div>

			<div class="margin-top align-center pager">
				<new:pager />
			</div> --%>
			
			
		<div class="">
			<h3 class="hidden">레스토랑 목록</h3>
			<table class="">
				<thead>
					<tr>
						<th class="">번호</th>
						<th class="">가게이름</th>
						<th class="">주소</th>
						<th class="">좌표</th>
						<th class="">음식 사진</th>
						<th class="">작성자</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="n" items="${list}">					
				<tr>
					<td>${n.id}</td>
					<td class=""><a href="restaurant/${n.id}">${n.name} (${n.countCmt})</a></td>
					<td>${n.address}</td>
					<td>${n.location}</td>
					<td>${n.image}</td>
					<td>${n.writerName}</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="map_wrap">
			<div id="map"
				style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
		</div>
			
	</main>
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9c613e70636456cd2f3178169be248f"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			mapOption = {
				center : new daum.maps.LatLng(37.55325832462685, 126.93698692019638), // 지도의 중심좌표
				level : 4 // 지도의 확대 레벨
			};
	
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		/* 학원 마커 고정 --------------------------------------------------------------------------------*/
				
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(37.55325832462685, 126.93698692019638); 
		
		// 마커를 생성합니다
		var baseMarker = new daum.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		baseMarker.setMap(map);
				
		(function(baseMarker, title) {
			daum.maps.event.addListener(
					baseMarker
					, 'click'
					, function() {
						baseDisplayInfowindow(baseMarker, title);
					});
		})(baseMarker, "쌍용강북교육센터");
		
		function baseDisplayInfowindow(baseMarker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

			infowindow.setContent(content);
			infowindow.open(map, baseMarker);
		}
		
		/* -----------------------------------------------------------------------------------------*/
		
		$.getJSON("map-ajax")
			.done(function(data) {
					var locations = new Array();
					for(var i=0; i<data.length; i++){
						var location = data[i].location.replace(/\(|\)/g,"");
						locations.push(location);
					}
					
					var places = new Array();
					for(var i=0; i<data.length; i++){
						var restaurant = new Object();
						var coordinate = locations[i].split(", ");
						
						restaurant.name = data[i].name;
						restaurant.address = data[i].address;
						restaurant.latlng = new daum.maps.LatLng(coordinate[0], coordinate[1]);
						
						places.push(restaurant);
					}
					
					//var positions = JSON.stringify(places);
					
					
					for (var i = 0; i < data.length; i++) {
						// 마커 이미지의 이미지 주소입니다
						var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
						
						// 마커 이미지의 이미지 크기 입니다
						var imageSize = new daum.maps.Size(24, 35);
	
						// 마커 이미지를 생성합니다    
						var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
	
						// 마커를 생성합니다
						var marker = new daum.maps.Marker({
							map : map, // 마커를 표시할 지도
							name : places[i].name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
							address : places[i].address,
							position : places[i].latlng, // 마커를 표시할 위치
							image : markerImage // 마커 이미지 
						});
						
						marker.setMap(map); // 지도 위에 마커를 표출합니다
						
						
						(function(marker, name, address, position) {
							daum.maps.event.addListener(
									marker
									, 'click'
									, function() {
										displayInfowindow(marker, name, address, position);
									});
						
						})(marker, places[i].name, places[i].address, places[i].latlng);	
						// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다 
		
					}
	
				})

		//infowindow를 끌 수 있는 x표시를 만듦
		var iwRemoveable = true;
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
			zIndex : 1,
			removable : iwRemoveable
		//removable : true;
		});

		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title, address, position) {
			var content = '<div style="padding:5px; z-index:1; width: 180px; height: 180px;">'
					+ '<img src="../resources/images/miboondang.jpg" style="width: 160px; padding: 2px;"><hr />'
					+ title
					+ '<br />'
					+ address
					+ '<br />'
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}
		
		
	</script>
		