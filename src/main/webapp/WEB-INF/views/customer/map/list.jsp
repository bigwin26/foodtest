<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<main id="main" ng-controller="notice-controller">
	
	<div id="container" style="min-width: 1100px;">
	
		<div class="map_wrap" style="margin-top: 20px;">
			<div id="map"
				style="width: 100%; height: 800px; position: relative; overflow: hidden;"></div>
				
			<div class="list-wrapper">
				<div class="list-area">
					<ul class="list-place">
						<c:forEach var="n" items="${list}">
							<li class="list-item">
								<%-- <div class="list-item-inner" onclick="location.href='restaurant/${n.id}'"> --%>
								<div class="list-item-inner">
									<div class="list-item-inner-title">${n.name}<%-- <span>(${n.countCmt})</span> --%></div>
									<div>${n.address}</div>
									<div class="list-item-inner-tip">작성자의 한마디</div>
									<div>"${n.tip}"</div>
									<%-- <div style="display: none;">${n.id}</div>
									<div style="display: none;">${n.location}</div>
									<div style="display: none;">${n.image}</div>
									<div style="display: none;">${n.writerName}</div> --%>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
</main>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9c613e70636456cd2f3178169be248f"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	var listInner = $(".list-item-inner");
	var listTitle = $(".list-item-inner-title");
	//alert("listTitle-length: " + listTitle.length);
	//alert(listTitle.eq(0).text());
	
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
			
	(function(baseMarker, name) {
		daum.maps.event.addListener(
				baseMarker
				, 'click'
				, function() {
					baseDisplayInfowindow(baseMarker, name);
				});
	})(baseMarker, "쌍용강북교육센터");
	
	function baseDisplayInfowindow(baseMarker, name) {
		var content = '<div style="padding:5px;z-index:1;">' + name + '</div>';

		infowindow.setContent(content);
		infowindow.open(map, baseMarker);
	}
	
	/* -----------------------------------------------------------------------------------------*/
	
	$.getJSON("map-ajax")
		.done(function(data) {
			//var json = JSON.stringify(data);
			//alert(json);
			var locations = new Array();
			for(var i=0; i<data.length; i++){
				var location = data[i].location.replace(/\(|\)/g,"");
				locations.push(location);
			}
				
			var places = new Array();
			for(var i=0; i<data.length; i++){
				var restaurant = new Object();
				var coordinate = locations[i].split(", ");
				
				restaurant.id = data[i].id;
				restaurant.name = data[i].name;
				restaurant.address = data[i].address;
				restaurant.foodImage = data[i].image;
				restaurant.latlng = new daum.maps.LatLng(coordinate[0], coordinate[1]);
				
				places.push(restaurant);
			}
								
			//var positions = JSON.stringify(places);
			
			for (var i = 0; i < data.length; i++) {
				// 마커 이미지의 이미지 주소입니다
				/* var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; */
				var imageSrc = "${ctx}/resource/images/markerStar.png";
				
				// 마커 이미지의 이미지 크기 입니다
				var imageSize = new daum.maps.Size(24, 35);

				// 마커 이미지를 생성합니다    
				var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);

				// 마커를 생성합니다
				var marker = new daum.maps.Marker({
					map : map, // 마커를 표시할 지도
					id : places[i].id,
					name : places[i].name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					address : places[i].address,
					foodImage : places[i].foodImage,
					position : places[i].latlng, // 마커를 표시할 위치
					image : markerImage // 마커 이미지 
				});
				
				var restaurantName = listTitle.eq(i).text();
				var index = i;
				//alert(restaurantName);
				
				function mOver(marker, id, name, address, position, restaurantName, index){
					var imageSrc = "${ctx}/resource/images/markerStar2.png";
					var imageSize = new daum.maps.Size(24, 35);
					var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
					
					marker.setImage(markerImage);
					
					if(name == restaurantName){
						listInner.eq(index).css({
							"opacity": "1"
						});
						listInner.eq(index).hover(
								function(){
									$(this).css("opacity", "1")
								},
								function(){
									$(this).css("opacity", "0.7")
								});
					}
				}
				
				function mOut(marker, name, restaurantName, index){
					var imageSrc = "${ctx}/resource/images/markerStar.png";
					var imageSize = new daum.maps.Size(24, 35);
					var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
					
					marker.setImage(markerImage);
					
					if(name == restaurantName){
						listInner.eq(index).css({
							"opacity": "0.7"
						});
						listInner.eq(index).hover(
								function(){
									$(this).css("opacity", "1")
								},
								function(){
									$(this).css("opacity", "0.7")
								});
					}
				}
				
				// 즉시실행함수
				(function(marker, id, name, address, foodImage, position, restaurantName, index) {
					
					listInner.eq(index).click(function(){
						displayInfowindow(marker, id, name, address, foodImage, position);
					});
					
					listInner.eq(index).hover(
							function(){
								mOver(marker, name, restaurantName, index);
							},
							function(){
								mOut(marker, name, restaurantName, index);
							});
					
					daum.maps.event.addListener(marker, 'click', function() {
						displayInfowindow(marker, id, name, address, foodImage, position);
					});
											
					daum.maps.event.addListener(marker, 'mouseover',function() {
						mOver(marker, name, restaurantName, index);
					})
					
					daum.maps.event.addListener(marker, 'mouseout', function() {
						mOut(marker, name, restaurantName, index);
					});
				
				})(marker, places[i].id, places[i].name, places[i].address, places[i].foodImage, places[i].latlng, restaurantName, index);
				// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다 
				
				marker.setMap(map); // 지도 위에 마커를 표출합니다
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
	function displayInfowindow(marker, id, name, address, foodImage, position) {
		var imageUrl;
		
		if(foodImage.length == 0){
			imageUrl = "${ctx}/resource/images/no-image.png";
		}
		else{
			imageUrl = "${ctx}/resource/customer/restaurant/2017/" + id +"/" + foodImage;
		}
			//$("#foodImage").attr("src", "${ctx}/resource/images/no-image.png");
			//foodImage = 'no-image.png';
		
		var content = 
				'<div style="padding-top: 10px; z-index:1; width: 250px; height: 220px; text-align: center;">'
				+ '<div>' + name + '</div>'
				+ '<div>' + address +'</div>'
				+ '<img id="foodImage" src="' + imageUrl + 
					'" style="margin-top: 5px; width: 220px; cursor: pointer;" onclick="location.href=\'restaurant/'+ id +'\'">'
				+ '</div>';
		
		infowindow.setContent(content);
		infowindow.open(map, marker);
	}
		
</script>
