<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!-- <link rel="stylesheet" href="resource/css/reset.css"> -->
<%-- <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/customer-restaurant.css"> --%>
<!-- <!DOCTYPE html> -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<!-- <div id="visual">
		<div class="content-container">
			<h1 class="customer-text">맛집 리스트</h1>
		</div>
	</div> -->
	
	<main id="main">
		<div class="restaurant-reg">
			<!-- <a href="restaurant/reg">가게 등록!</a> -->
			<span>다녀온 맛집이 있으세요?</span>
			<a href="restaurant/reg">
				맛집 등록하기<img src="${ctx}/resource/images/folk-spoon.png">
			</a>
		</div>
		
		<div class="restaurant-cards">
				<c:forEach var="n" items="${list}" begin="0" end="${fn:length(list)}">
					
					<a href="restaurant/${n.id}">
					<div class="restaurant-card">
						<div id="menu-images" class="img-wrapper">
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
		
		
		<div class="ajax-loading" style="position:fixed; top: 40%; left: 45%; z-index: 999; display: none;" >
		   	<img src="${ctx}/resource/images/loading.gif" style="width: 100px; height: 100px; text-align: center;" >
	   	</div>
	
		<!-- <div>
			<h3 class="hidden">현재 페이지</h3>
			<div><input type="button" class="restaurant-ajax" value="더보기"/></div>
		</div> -->
	
	
	
	
	
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
    var page = 1;
    $(window).scroll(function() {

        if ($(document).height() <= $(window).scrollTop() + $(window).height()) {

            $(function() {
                page += 1;
				
                $.ajax({
                    type: "POST",
                    url: "restaurant-ajax?${_csrf.parameterName}=${_csrf.token}",
                    data: {
                        "page": page
                    },
                    dataType: "json",
                    beforeSend: function() {
                    	$(".ajax-loading").css("display","inline-block");
                    },
                    complete: function() {
                    	$(".ajax-loading").css("display","none");
                    },
                    success: function(data) {
                        //console.log(data);
                    	if(data.length == 0){
	                        page -= 1;
	                        return;
                        }
                        var content = "";
                        for (var i = 0; i < data.length; i++) {
                            content +=
                                "<a href='restaurant/" + data[i].id + "'>" +
                                "<div class='restaurant-card'>" +
                                "<div id='menu-images' class='img-wrapper'>" +
                                "<div class='gradation'>" +
                                "<div class='inner-restaurant-info'>" +
                                "<span class='name'>" + data[i].name + "</span>" +
                                "<p class='tip'>" + data[i].genre + "</p>" +
                                "<p class='tip'>\"" + data[i].tip + "\"</p>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "</a>";
                        }
                        $(".restaurant-cards").append(content);

                        for (var i = 0; i < data.length; i++) {
                            $("#menu-images").attr('id', 'menu-images' + data[i].id);

                            if (data[i].image.length == 0) {
                                $("#menu-images" + data[i].id).css({
                                    //"background-image": "url('../resource/customer/restaurant/2017/"+${n.id}+"/"+${n.image}+"')",
                                    "background-image": "url('../resource/images/no-image.png')",
                                    "background-size": "cover",
                                    "background-position": "center center"
                                });
                            } else {
                                $("#menu-images" + data[i].id).css({
                                    //"background-image": "url('../resource/customer/restaurant/2017/"+${n.id}+"/"+${n.image}+"')",
                                    "background-image": "url('../resource/customer/restaurant/2017/" + data[i].id + "/" + data[i].image + "')",
                                    "background-size": "cover",
                                    "background-position": "center center"
                                });
                            }
                        }
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
                     $("tbody").append(content);    */

                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });
        }
    });


    $(function(){
        var n = ${fn:length(list)};
        //alert('${list[0].name}');
        
        $("#visual")
        .css({
           "height": "300px",
           "background": "#313131 url(../resource/images/customer-visual3.jpg) center",
           "background-size": "cover",
            "border-top": "solid 3px #f15c22",
            "background-position": "30% 30%"
        });
        
        /* $("#visual .content-container")
        .css({
           "display": "flex",
            "align-items": "center",
            "justify-content": "center"
        }); */
        
        $("#visual .customer-text")
        .css({
           //"display": "flex",
            //"align-items": "center",
            //"justify-content": "center",
           "text-align": "center",
           "line-height": "300px",
           "font-size": "30px",
            "color": "white"
        });
        
        $("#visual .customer-text").text("맛집 리스트");
              
        var list = new Array();
        <c:forEach items="${list}" var="item">
           var restaurant = new Object();
           
           restaurant.id = ${item.id};
           restaurant.name = "${item.name}";
           restaurant.tip = "${item.tip}";
           restaurant.image = "${item.image}";
           
           list.push(restaurant);      
        </c:forEach>      
        
        
        for (var i=0; i<n; i++) {
           
           $("#menu-images").attr('id', 'menu-images'+list[i].id);
           
           if(list[i].image.length == 0){
              $("#menu-images"+list[i].id).css({
                 //"background-image": "url('../resource/customer/restaurant/2017/"+${n.id}+"/"+${n.image}+"')",
                 "background-image": "url('../resource/images/no-image.png')",
                 "background-size": "cover",
                 "background-position": "center center"
              });
           }
           else{
              $("#menu-images"+list[i].id).css({
                 //"background-image": "url('../resource/customer/restaurant/2017/"+${n.id}+"/"+${n.image}+"')",
                 "background-image": "url('../resource/customer/restaurant/2017/"+list[i].id+"/"+list[i].image+"')",
                 "background-size": "cover",
                 "background-position": "center center"               
              });
           }
        }
     });

</script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9c613e70636456cd2f3178169be248f"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
				var json = JSON.stringify(data);
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
						id : places[i].id,
						name : places[i].name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						address : places[i].address,
						position : places[i].latlng, // 마커를 표시할 위치
						image : markerImage // 마커 이미지 
					});
					
					marker.setMap(map); // 지도 위에 마커를 표출합니다
											
					(function(marker, id, name, address, position) {
						daum.maps.event.addListener(
								marker
								, 'click'
								, function() {
									
									displayInfowindow(marker, id, name, address, position);
								});
					
					})(marker, places[i].id, places[i].name, places[i].address, places[i].latlng);	
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
		function displayInfowindow(marker, id, name, address, position) {
			var content = '<div style="padding:5px; z-index:1; width: 180px; height: 180px;">'
					/* + '<img src="../resources/images/miboondang.jpg" style="width: 160px; padding: 2px;"><hr />' */
					+ '<a href="restaurant/'+ id +'">' + name + '</a>'
					+ '<br />'
					+ address
					+ '<br />'
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}
		
		
	</script>
