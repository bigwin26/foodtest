<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%-- <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/map.css"> --%>
<style>
  #footer_div {
    position:relative;
    bottom:0px;
    width:100%;
    height:30px;
    background-color: #e1e0db;
}
</style>
	<main id="main">
		
		<div class="map-form-wrapper">
			<div class="map_wrap_reg">
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
		
				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<form onsubmit="searchPlaces(); return false;">
								키워드 : <input type="text" value=" " id="keyword" size="15">
								<button type="submit">검색</button>
							</form>
						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>
				
			<div class="restaurant-reg-form">
				<form action="?${_csrf.parameterName}=${_csrf.token}" 
									method="post" enctype="multipart/form-data">
					<table class="table table-list space-top">
						<tbody>
							<tr>
								<th>가게 이름</th>
								<td><input id="n" type="text" name="name"/></td>
							</tr>
							<tr>
								<th>주소</th>
								<td>
									<input id="a" type="text" name="address"/>
									<input id="l" type="text" name="location" style="display: none;"/>
								</td>
							</tr>
							<tr>
								<th>상세내용</th>
								<td><input type="text" name="content" placeholder="예) 2인 1.5만원대"/></td>
							</tr>
							<tr>
								<th colspan="2">음식 종류</th>
							</tr>
							<tr>
								<td colspan="2">
									<input type="radio" name="genre" value="한식"/>한식
									<input type="radio" name="genre" value="일식"/>일식
									<input type="radio" name="genre" value="중식"/>중식
									<input type="radio" name="genre" value="양식"/>양식
									<input type="radio" name="genre" value="뷔페"/>뷔페
									<input type="radio" name="genre" value="세계음식"/>세계음식
									<input type="radio" name="genre" value="카페"/>카페
									<input type="radio" name="genre" value="술집"/>술집
								</td>
							</tr>
							<!-- <tr>
								<td><input type="radio" name="genre" value="한식"/>한식</td>
								<td><input type="radio" name="genre" value="일식"/>일식</td>
								<td><input type="radio" name="genre" value="중식"/>중식</td>
								<td><input type="radio" name="genre" value="양식"/>양식</td>
								<td><input type="radio" name="genre" value="뷔페"/>뷔페</td>
								<td><input type="radio" name="genre" value="세계음식"/>세계음식</td>
								<td><input type="radio" name="genre" value="카페"/>카페</td>
								<td><input type="radio" name="genre" value="술집"/>술집</td>
							</tr> -->
							
							<!--<tr>
								<th>가게까지 거리</th>
							</tr>
							<tr>
								<td>
									<select name="time">
										<option selected="selected" value="5">가까워요</option>
										<option value="10">갈만해요</option>
										<option value="15">멀어요ㅠㅠ</option>
									</select>
								</td>
							</tr> -->
							<tr>
								<th>대표 사진</th>
								<td><input id="f" type="file" name="file"/></td>
							</tr>
							<tr>
								<th>대표 음식</th>
								<td><input type="text" name="keyword"/></td>
							</tr>
							<tr>
								<th>작성자 한마디!</th>
								<td><input type="text" name="tip"/></td>
							</tr>
						</tbody>
					</table>
					
					<input class="" style="
									color: #ffffff;
									border: none;
									background: #f15c22; 
									width:100px; 
									height: 50px; 
									margin-top:30px; 
									float: right;
									" 
									type="submit" value="등록하기"/>
				</form>
			</div>
		
		</div>
	
		<!-- <div class="margin-top text-align-center">
			<a class="btn btn-list" href="../restaurant">목록</a>
		</div> -->
	
	</main>
	
	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9c613e70636456cd2f3178169be248f&libraries=services"></script>
		<!-- 형주 admin key: e9c613e70636456cd2f3178169be248f -->
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.55325832462685, 126.93698692019638), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);
		
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
		
		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places();
		
		//infowindow를 끌 수 있는 x표시를 만듦
		var iwRemoveable = true;
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
			zIndex : 1,
			removable : iwRemoveable
			//removable : true;
		});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;
			
			if (!keyword.replace(/^\s+|\s+$/g)) {
				//!keyword.replace(/^\s+|\s+$/g, '') //공백 포함 정규표현식
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === daum.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			}/*  else if (status === daum.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} */ else if (status === daum.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList');
			var menuEl = document.getElementById('menu_wrap');
			var fragment = document.createDocumentFragment();
			var bounds = new daum.maps.LatLngBounds();
			var listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {
				
				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new daum.maps.LatLng(places[i].y, places[i].x);
				//alert(placePosition);
				
				var marker = addMarker(placePosition, i);
				var itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title, address, phone, placePosition) {
					daum.maps.event.addListener(
							marker
							, 'click'
							, function() {
								//alert(placePosition);
								$("#test").text(placePosition);
								$("#n").val(title);
								$("#a").val(address);
								$("#l").val(placePosition);
								displayInfowindow(marker, title, address, phone, placePosition);
							});

					/* daum.maps.event.addListener(marker, 'click', function() {
						infowindow.close();
					}); */

					itemEl.onclick = function() {
						//alert(placePosition);
						$("#test").text(placePosition);
						$("#n").val(title);
						$("#a").val(address);
						$("#l").val(placePosition);
						displayInfowindow(marker, title, address, phone, placePosition);
					};

					/* itemEl.onmouseout = function() {
						infowindow.close();
					}; */
				})(marker, places[i].place_name, places[i].road_address_name, places[i].phone, placePosition);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new daum.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new daum.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new daum.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination');
			var fragment = document.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} 
				else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title, address, phone, placePosition) {
			//var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
			var content = '<div style="padding:5px; z-index:1; width: 180px; height: 180px;">'
							+ '<img src="../resources/images/miboondang.jpg" style="width: 160px; padding: 2px;"><hr />'
							+ title +'<br />'
							+ address +'<br />'
							+ phone +'<br />'
							//+ placePosition+'<br />'
							+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
		
		//파일업로드------------------------------------------------------------------------------------------------------
 		$(function(){
			var submitButton = $("#submit");
			var fileInput = $("#f");
			
			var name;
			var address;
			var location;
			var file;
			
			/* fileInput.click(function(e){
				var event = new MouseEvent("click", {
					'view': window,
					'bubbles': true,
					'cancelable': true
				});
				
				
			}); */
				/* fileInput.change(function(){
					file = fileInput[0].files[0];
					alert(file.name);
				}); */
						
			/* submitButton.click(function(e){
				name = $("#n").val();
				address = $("#a").val();
				location = $("#l").val();
				file = fileInput[0].files[0];
				
				alert(name);
				alert(address);
				alert(location);
				alert(file.name);
								
				var formData = new FormData();
				formData.append("name", name);
				formData.append("address", address);
				formData.append("location", location);
				formData.append("file", file);
				
				var xhr = new XMLHttpRequest();
				
				xhr.onerror = function(e){
					alert("예기치 못한 오류");
				};
				xhr.open("POST", "?${_csrf.parameterName}=${_csrf.token}", true);	
				xhr.send(formData);
				
			}); */
					
		});
		
		
	</script>