<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<style>
h1{
font-size: 100%;
}
.restaurant-photos {
	display: block; overflow : hidden;
	width: 100%;
	overflow: hidden;
}

.list-photo_wrap {
	height: 340px;
	opacity: 1;
	display: block;
	visibility: visible;
}

.owl-wrapper-outer {
	overflow: hidden;
	position: relative;
	width: 100%;
	height: inherit;
	
}

.owl-wrapper {
	width: 1250px;
    left: -100px;
    display: block;
    transition: all 0ms ease;
    transform: translate3d(0px, 0px, 0px);
    height: inherit;
    position: relative;
    overflow: hidden;
}

.owl-item {
	position: relative;
	width: 415px;
	height: inherit;
	    overflow: hidden;
	    float: left;
}
.restaurant-photos-item {
    display: block;
    position: relative;
    width: 100%;
    overflow: hidden;
    -webkit-background-size: cover;
    background-size: cover;
    background-position: 50% 50%;
    cursor: pointer;
    height: inherit;
}
.center-croping {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
/* --main-- */
.column-wrapper {
    display: flex;
    border-top: 6px solid #fff;
}
.column-contents {
    width: calc(100% - 400px);
    background-color: #fff;
    flex: 1;
    float: left;
}
.column-contents>.inner {
    box-sizing: border-box;
}
.column-contents>.inner>section {
    width: 100%;
    margin: 0 auto;
    margin-top: 20px;
}
.restaurant-detail>header {
    position: relative;
    padding-bottom: 10px;
    border-bottom: 1px solid #dbdbdb;
    min-height: 74px;
}
.restaurant-detail>header .wannago_wrap {
    display: inline-block;
    text-align: center;
    float: right;
}
button {
    appearance: none;
    cursor: pointer;
    border: 0px;
    border-radius: 0;
    background-color: transparent;
}
.btn-type-icon {
    display: inline-block;
    text-indent: -9999px;
    vertical-align: middle;
}
.btn-type-icon.favorite {
    background-image: url(${ctx}/resource/images/like.png);
    width: 32px;
    height: 31px;
}
.restaurant-detail>header .wannago_wrap .wannago_txt {
    color: #9b9b9b;
    font-size: 0.8rem;
}
.restaurant-detail>header .title {
    padding-right: 50px;
    max-width: 75%;
    font-size: 1.8rem;
    line-height: 46px;
    display: block;
    box-sizing: border-box;
    position: relative;
    color: #000000;
}
.restaurant-detail>header .title .restaurant_name {
    display: inline-block;
    max-width: 100%;
    word-break: break-all;
}
.restaurant-detail>header .title>.rate-point {
    color: #ff792a;
    margin-left: 5px;
}
.restaurant-detail>header .status {
    margin: 30px 0 10px;
    font-size: 0.8rem;
    margin-left: 2px;
    color: #9b9b9b;
}
.restaurant-detail>header .status .cnt {
    margin-right: 20px;
}

.restaurant-detail .info {
    padding-top: 20px;
    padding-bottom: 20px;
    position: relative;
}
.restaurant-detail .info th {
    width: 105px;
    font-size: .9rem;
    color: #9b9b9b;
    line-height: 20px;
    text-align: left;
    vertical-align: middle;
    padding-right: 10px;
    padding-bottom: 5px;
}
.restaurant-detail .info td {
    font-size: .9rem;
    color: #000000;
    line-height: 20px;
    text-align: left;
    vertical-align: middle;
    padding-bottom: 5px;
}
.list-reivews {
    margin-top: 14px;
}
.review-content {
    font-size: .95rem;
    line-height: 1.6rem;
    overflow: hidden;
    font-size: 0.875rem;
    color: #333;
}
.review-content .user.big {
    margin-right: 35px;
    float: left;
    width: 70px;
    text-align: center;
    display: inline;
    position: static;
}
.review-content .user .thumb {
    position: relative;
    top: 0;
    overflow: hidden;
    margin-bottom: 5px;
    height: 70px;
    width: 70px;
    border-radius: 70px;
    background-size: cover;
    background-position: 50% 50%;
}
.center-croping {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.review-content .user figcaption {
    display: block;
    font-size: 0.8rem;
    line-height: 1.2em;
    font-weight: normal;
    word-break: break-all;
    color: #555;
}
.review-content .review_wraper {
    color: #000000;
    float: left;
    max-width: 605px;
}
.review-content .review_content {
    display: inline-block;
    word-break: break-all;
}
.review-item .sub-info {
    position: absolute;
    top: 19px;
    left: 105px;
}
.side-wrap {
    position: relative;
    float: right;
    width: 370px;
    background-color: #f6f6f6;
    left:10px;
}
.column-side {
    height: 100%;
    width: 400px;
    padding-bottom: 50px;
}
.map-container {
    display: block;
    height: 328px;
    width: 100%;
    background-color: #3e3e3e;
    position: relative;
    cursor: pointer;
}
</style>
<aside class="restaurant-photos">
	<div class="list-photo_wrap">
		<div class="owl-wrapper-outer">
			<div class="owl-wrapper">
				<div class="owl-item">
					<figure class="list-photo" style="display:block; height:inherit;">
						<figure class="restaurant-photos-item">
							<img class="center-croping" src="${ctx}/resource/images/staek.jpg">
						</figure>
					</figure>
				</div>
				<div class="owl-item">
					<figure class="list-photo" style="display:block; height:inherit;">
						<figure class="restaurant-photos-item">
							<img class="center-croping" src="${ctx}/resource/images/staek.jpg">
						</figure>
					</figure>
				</div>
				<div class="owl-item">
					<figure class="list-photo" style="display:block; height:inherit;">
						<figure class="restaurant-photos-item">
							<img class="center-croping" src="${ctx}/resource/images/staek.jpg">
						</figure>
					</figure>
				</div>
			</div>
		</div>
	</div>
</aside>
<main>
<div class="column-wrapper"> <%-- <h2 class="main title">점심 디테일 페이지</h2>

<div class="">
	<h3 class="hidden">가게 내용</h3>
	<table class="">
		<tbody>
			<tr>
				<th>가게 이름</th>
				<td>${r.name} (${r.countCmt})</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${r.regDate}" />
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${r.writerName}</td>
				<td>${r.writerImage}</td>
				<th>평점</th>
				<td>${r.avgPoint}</td>
				<th>좋아요</th>
				<td>${r.countLiked}</td>
			</tr>
			<tr>
				<th>종류</th>
				<td>${r.genre}</td>
				<th>걸어가는 시간</th>
				<td>${r.time}</td>
				<th>상세내용</th>
				<td>${r.content}</td>
			</tr>
		</tbody>
	</table>
</div>

<div>
	<h4 class="hidden">후기 내용</h4>
	<table class="">
		<tbody>
			<c:if test="${empty cmtList}">
				<tr>
					<td colspan="3" class=""><a href="../comment/${r.id}">첫번째
							후기를 작성해 주세요!</a></td>
				</tr>
			</c:if>
			<c:if test="${not empty cmtList}">
				<tr>
					<td>생생한 후기들! (${cmtp})</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>내용</td>
					<td>작성자</td>
					<td>사진</td>
				</tr>
				
				<c:forEach var="c" items="${cmtList}">
				<tr class="comment">
					<td>${c.id}</td>
					<td class="">${c.content}</td>
					<td>${c.writerName}</td>
					<td id="cmt-image">
						<table id="menu-images">	
						</table>
					</td>
					<td style="display: none;">${c.memberEmail}</td>
					<c:if test="${email == c.memberEmail}">
					<td>
					<input type="button" onclick="location.href='../deleteComment?id=${c.id}'" value="삭제"/>
					</td>
					<td>
					<input type="button" onclick="location.href='../comment/edit'" value="수정"/>
					</td>
					</c:if>
				</tr>
				</c:forEach>
					
				<tr>
					<td><a href="../comment/${r.id}">후기작성!</a></td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>

<div class="margin-top text-align-center">
	<a class="btn btn-list" href="../restaurant">목록</a>
</div>

<div class="">
	<table class="">
		<tbody>
			<c:if test="${empty next}">
				<tr>
					<th>다음글</th>
					<td colspan="3" class="">다음글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty next}">
				<tr>
					<th>다음글</th>
					<td colspan="3" class=""><a class="" href="${next.id}">${next.name}</a></td>
				</tr>
			</c:if>
			<c:if test="${empty prev}">
				<tr>
					<th>이전글</th>
					<td colspan="3" class="">이전글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty prev}">
				<tr>
					<th>이전글</th>
					<td colspan="3" class=""><a class="" href="${prev.id}">${prev.name}</a></td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div> --%>
<div class="column-contents">
	<div class="inner">
		<section class="restaurant-detail">
			<header>
				<div>
					<div class="wannago_wrap">
						<button class="btn-type-icon favorite wannago_btn"></button>
						<p class="wannago_txt">가고 싶다</p>
					</div>
					<span class="title">
						<h1 class="restaurant_name">${r.name}</h1>
						<strong class="rate-point">
							<span class="rate-point">${r.avgPoint}</span>
							</strong>
					</span>
				</div>
				<div class="status">
					<span class="cnt hit">
					<img src="${ctx}/resource/images/count.PNG">${r.countLiked}
					<span class="hidden">조회수</span>
					</span>
					<span class="cnt comment">
					<img src="${ctx}/resource/images/comment.png">${r.countLiked}
					<span class="hidden">코멘트수</span>
					</span>
					<span class="cnt favorite">
					<img src="${ctx}/resource/images/star.png">${r.countLiked}
					<span class="hidden">좋아요수</span>
					</span>
				</div>
			</header>
			<table class="info">
				<tbody>
					<tr>
					<th class="show_none">주소:</th>
					<td><a class="addr-txt">${r.address}</a></td>
					</tr>
					<tr>
					<th class="show_none">전화번호:</th>
					<td><a class="addr-txt">${r.address}</a></td>
					</tr>
					<tr>
					<th class="show_none">음식종류:</th>
					<td><a class="addr-txt">${r.genre}</a></td>
					</tr>
					<tr>
					<th class="show_none">가격대:</th>
					<td><a class="addr-txt">${r.address}</a></td>
					</tr>
					<tr>
					<th class="show_none">영업시간:</th>
					<td><a class="addr-txt">${r.address}</a></td>
					</tr>
				</tbody>
			</table>
		</section>
		<%-- <c:if test="${empty cmtList}">
				<tr>
					<td colspan="3" class=""><a href="../comment/${r.id}">첫번째
							후기를 작성해 주세요!</a></td>
				</tr>
			</c:if>
			<c:if test="${not empty cmtList}">
				<tr>
					<td>생생한 후기들! (${cmtp})</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>내용</td>
					<td>작성자</td>
					<td>사진</td>
				</tr>
				
				<c:forEach var="c" items="${cmtList}">
				<tr class="comment">
					<td>${c.id}</td>
					<td class="">${c.content}</td>
					<td>${c.writerName}</td>
					<td id="cmt-image">
						<table id="menu-images">	
						</table>
					</td>
					<td style="display: none;">${c.memberEmail}</td>
					<c:if test="${email == c.memberEmail}">
					<td>
					<input type="button" onclick="location.href='../deleteComment?id=${c.id}'" value="삭제"/>
					</td>
					<td>
					<input type="button" onclick="location.href='../comment/edit'" value="수정"/>
					</td>
					</c:if>
				</tr>
				</c:forEach>
					
				<tr>
					<td><a href="../comment/${r.id}">후기작성!</a></td>
				</tr>
			</c:if> --%>
		<section class="module review-container">
		<c:if test="${empty cmtList}">
				<tr>
					<td colspan="3" class=""><a href="../comment/${r.id}">첫번째
							후기를 작성해 주세요!</a></td>
				</tr>
	    </c:if>
		<c:if test="${not empty cmtList}">
			<div class="title_fliter_wrap">
				<h2 class="title">${r.name}의리뷰(${cmtp})</h2>
				<ul class="list-reivews">
				<c:forEach var="c" items="${cmtList}">
					<li class="default_review">
						<section class="review-item">
							<div>
								<div class="review-content">
									<figure class="user big">
										<div class="thumb">
											<img class="center-croping lazy" />
										</div>
										<figcaption>${c.writerName}</figcaption>
									</figure>
									<div class="review_wraper">
										<span class="short_review more_review_bind review_content">${c.content}</span>
										<span class="sub-info">
										<time>
												<span class="past-time ng-binding"></span>
											</time>
										</span>
										<div class="list-thumb-photos">
										</div>
									</div>
								</div>
							</div>
						</section>
					</li>
					<div style="display: none;">${c.memberEmail}</div>
					<c:if test="${email == c.memberEmail}">
					<td>
					<input type="button" onclick="location.href='../deleteComment?id=${c.id}'" value="삭제"/>
					</td>
					<td>
					<input type="button" onclick="location.href='../comment/edit'" value="수정"/>
					</td>
					</c:if>
					</c:forEach>
				</ul>
			</div>
			<div><a href="../comment/${r.id}">후기작성!</a></div>
			</c:if>
		</section>
	</div>
</div>
<div class="side-wrap">
	<div class="column-side">
		<div class="map-container">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
	</div>
	</div>
</div>
</div>
</main>
<script type="text/javascript">
	$(function(){
		var id = $(".comment td:first-child");
		for(var i=0; i<id.length; i++){
			//alert(id.eq(i).text());
			//alert(k);
			 $.ajax({
				type:"POST",
				url:"../../customer/restaurant-menu-ajax?${_csrf.parameterName}=${_csrf.token}",
				data: {"id":id.eq(i).text()},
				async: false,
				dataType:"json", 
				success:function(data){
					//console.log(data);
					//var json = JSON.stringify(data);
					//alert(json);
					var content ="";
					for(var j=0; j<data.length; j++){
						//alert("id: " + data[i].id + ", commentId: " + data[i].commentId);
						content += 
			                "<tr>"+
			                    "<td>"+data[j].id+"</td>"+
			                    "<td><a href=restaurant/"+data[j].id+">"+data[j].src+"</a></td>"+
			                    "<td>"+data[j].commentId+"</td>"+
			                    "<td>"+data[j].memberId+"</td>"+
			                "</tr>";
						
					}
					var text = id.eq(i).text();
					//alert(text);
					$("#menu-images").attr('id', 'menu-images'+text).append(content);
				}, error:function(request,status,error){
		            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		           }
			});
			//alert(i);
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


