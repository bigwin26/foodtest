<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<style>

</style>

<main id="main">
<!-- <div class="map_area">
   <div id="map" style="width: 100%; height: 250px; position: relative; overflow: hidden;"></div>
</div> -->

<div id="main_area" style="position: relative;">
   <div id="enc_item_area">
      <div id="item-header">
         <div class="item-container" style="width: 100%;">
            <div id="item-header-top">
               <div id="item-header-left">
                  <div id="item-rn">
                     <span class="item-rn-title">${r.name}</span>
                     <span class="item-rn-divider" ></span>
                     <span class="item-rn-subtitle">${r.genre}, ${r.keyword}</span>
                  </div>
                  <div id="item-category"></div>
               </div>
               <div id="item-header-right">
                  <div id="item-sharer">
                     <span class="item-rn-tip tip-writer">${r.writerName}</span>
                     <span class="item-rn-tip">님의 한줄평: "${r.tip}"</span>
                  </div>
               </div>
            </div>
            <div id="item-header-divider"></div>
            <div id="item-header-bottom">
               <div id="item-header-left">
                  <div id="item-stats">
                     <div class="item-stats">
                        <div class="item-stats-count">${r.avgPoint}</div>
                        <div class="item-stats-title">평점</div>
                     </div>
                     <div class="item-stats" dc-like-history-popover
                        dc-like-history-modal mode="restaurant" id-key="OSEnXQWBYLcf"
                        ng-if="profile.favorite.count>0">
                        <div class="item-stats-count" ng-bind="profile.favorite.count">${r.countLiked}</div>
                        <div class="item-stats-title">좋아요</div>
                     </div>
                     <div class="item-stats" ng-if="profile.review_total>0">
                        <a ng-click="profile.anchor('review')" title="바로가기">
                           <div class="item-stats-count" ng-bind="profile.review_total">${r.countCmt}</div>
                           <div class="item-stats-title">평가</div>
                        </a>
                     </div>
                  </div>
               </div>

               <div id='item-header-right' style='margin-top: 10px;'>
                  <div class='pull-right'>
                     <div class='item-button-review'>
                        <a href='#'>
                           <div id='review-icon'></div>
                           <div id='review-text'>
                              <a href="../comment/${r.id}">평가하기</a>
                           </div>
                        </a>
                     </div>
                     <div class='item-button-like'>
                        <a href='#' class='item-button-like' id='favorite_btn' value='Y'>
                           <input type="hidden" id="restaurant_Id" name="restaurant_Id" value="${r.id}" />
                           <div id='fvr-icon'></div>
                           <div id='fvr-text'>좋아요</div>
                        </a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
      <div id="item-body">
         <div class="item-container" style="width: 100%;">
            <div id="item-body-contents">
               <div class="item-information">
                  <div class="item-information-icon">
                     <img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/profile/main/icon-profile-tag@2x.png">
                  </div>
                  <div class="item-information-text">
                     <a>${r.tip}</a>
                  </div>
               </div>
               <div class="item-information">
                  <div class="item-information-icon">
                     <img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/profile/main/icon-profile-address@2x.png">
                  </div>
                  <div class="item-information-text">${r.address}</div>
               </div>
               <div class="item-information" id="item-tel">
                  <div class="item-information-icon">
                     <img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/profile/main/icon-profile-call@2x.png">
                  </div>
                  <div class="item-information-text">${r.phoneNumber}</div>
               </div>
            </div>
         </div>
      </div>
      <div style="margin: 10px 0 30px 0;">
         <a href="JavaScript:setAdLog('{|u_id|:|852656|,|device|:|web|,|type|:|view|,|dcad_id|:|19|,|inven_id|:|63|,|inven_type|:|w_profile_middle_banner|,|image_id|:|503|,|v_rid|:|OSEnXQWBYLcf|,|page_type|:|profile|,|lat|:||,|lng|:||,|ip|:|10.253.32.54|}', 'https://box.diningcode.com/shop/item.php?it_id=1510644103');" target="_blank">
            <img src="https://d2u8ukm27m1oiz.cloudfront.net/banner/dcbox_ad_1511398484.jpg" width="960px" height="120" />
         </a>
      </div>
      <div style='width: 960px; margin: 0 auto;'>
         <div class="rest-info-wrapper" style="float: left;">
            <div class="rest-time _flex_1">
               <div class="rest-info-icon">
                  <img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/profile/main/icon-profile-time@2x.png">
               </div>
               <div class="rest-info-title">영업 시간</div>
               <div class="rest-info-contents">
                  <div class="rest-time-block">
                     <div class="rest-time-left">매일</div>
                     <div class="rest-time-right">
                        <div class="time">오전 11시 - 오후 9시</div>
                     </div>
                  </div>
                  <div class="rest-time-block">
                     <div class="rest-time-left">쉬는시간 매일</div>
                     <div class="rest-time-right">
                        <div class="time">오후 3시 - 오후 5시</div>
                     </div>
                  </div>
               </div>
            </div>
               
            <div class="rest-menu _flex_1">
               <div class="rest-info-icon">
                  <img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/profile/main/icon-profile-menu@2x.png">
               </div>
               <div class="rest-info-title">메뉴 정보</div>
               <div class="rest-info-contents">
                  <div class="rest-menu-block">
                     <div class="rest-menu-left">1인당 평균가격</div>
                     <div class="rest-menu-right">
                        <div class="time">1만원대</div>
                     </div>
                  </div>
                  <div class="rest-menu-block">
                     <div class="rest-menu-left">차돌박이 쌀국수</div>
                     <div class="rest-menu-right">
                        <div class="time">7,000원</div>
                     </div>
                  </div>
                  <div class="rest-menu-block">
                     <div class="rest-menu-left">양지 쌀국수</div>
                     <div class="rest-menu-right">
                        <div class="time">7,500원</div>
                     </div>
                  </div>
                  <div class="rest-menu-block">
                     <div class="rest-menu-left">차돌양지쌀국수</div>
                     <div class="rest-menu-right">
                        <div class="time">8,000원</div>
                     </div>
                  </div>
               </div>
               <div class="more-extra" id="more-extra-menu">
                  메뉴 더 보기<i class="fa fa-angle-down" aria-hidden="true"></i>
               </div>
            </div>
         </div>
         <div style='clear: both;'></div>
      </div>
   </div>

   <div style="width: 960px; margin: 0 auto;"></div>
   <div style="clear: both;"></div>
   <div style="width: 960px;"></div>
   
   <div class="div_section">
      <div id="div_review" class="keyword-title">총 ${cmtp}건의 방문자 평가</div>

      <!-- Review -->
      <c:if test="${not empty cmtList}">
         <c:forEach var="c" items="${cmtList}">
            <div style="padding: 24px 0; border-bottom: #E0E0E0 solid 1px;">
               <div>
                  <div class="fl" style="width: 60px; height: 60px; border-radius: 50%; overflow: hidden;">
                     <div style="background: url('https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/review/ic_profile_review_default.png') no-repeat; background-size: auto 60px; background-position: center; width: auto; height: 60px;"></div>
                  </div>
                  <div class="fl" style="padding: 5px 0 0 12px;">
                     <div class="fs-15 fw-b">${c.writerName}</div>
                     <div style="padding: 8px 0;">
                        <i class="fa fa-star" aria-hidden="true" style="width: 20px; margin-top: -5px; font-size: 18px; color: #2483ff;"></i>
                        <i class="fa fa-star" aria-hidden="true" style="width: 20px; margin-top: -5px; font-size: 18px; color: #2483ff;"></i>
                     </div>
                     <div class="fs-15" style="width: 888px; padding: 8px 0; line-height: 27px;">${c.content}</div>
                     <div>
                        <!--// Image -->
                        <div class="review_image">
                           <div style='width: 180px; height: 125px; overflow: hidden;'>
                              <img src='https://s3-ap-northeast-1.amazonaws.com/dcreviewsresized/300_300_20171203094217183_photo1_557fcd08bcab.jpg' width='180'
                                 onClick='showImage([{"origin":"https:\/\/s3-ap-northeast-1.amazonaws.com\/dcreviewsresized\/20171203094217183_photo1_557fcd08bcab.jpg","thumb":"https:\/\/s3-ap-northeast-1.amazonaws.com\/dcreviewsresized\/300_300_20171203094217183_photo1_557fcd08bcab.jpg"},{"origin":"https:\/\/s3-ap-northeast-1.amazonaws.com\/dcreviewsresized\/20171203094216804_photo0_557fcd08bcab.jpg","thumb":"https:\/\/s3-ap-northeast-1.amazonaws.com\/dcreviewsresized\/300_300_20171203094216804_photo0_557fcd08bcab.jpg"}], "sue", "https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/review/ic_profile_review_default.png", "1일 전");'
                                 style='cursor: pointer;' />
                           </div>
                           <div class="review_ico">
                              <img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/review/icProfileReviewMenu.png" class="fl" />
                              <div class="review_count">2</div>
                              <div class="clear"></div>
                           </div>
                        </div>
                        <div class="review_image">
                           <div style='width: 180px; height: 125px; overflow: hidden;'>
                              <img
                                 src='https://s3-ap-northeast-1.amazonaws.com/dcreviewsresized/300_300_20171203094252679_menu0_557fcd08bcab.jpg'
                                 width='180'
                                 onClick='showImage([{"origin":"https:\/\/s3-ap-northeast-1.amazonaws.com\/dcreviewsresized\/20171203094252679_menu0_557fcd08bcab.jpg","thumb":"https:\/\/s3-ap-northeast-1.amazonaws.com\/dcreviewsresized\/300_300_20171203094252679_menu0_557fcd08bcab.jpg"}], "sue", "https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/review/ic_profile_review_default.png", "1일 전");'
                                 style='cursor: pointer' />
                           </div>
                           <div class="review_ico">
                              <img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/review/icProfileReviewStoreinfo.png" class="fl" />
                              <div class="review_count">1</div>
                              <div class="clear"></div>
                           </div>
                        </div>
                        <div class="clear"></div>
                     </div>
                     <!-- image // -->

                     <div style="width: 880px; padding-top: 8px;" style="display:none;">
                        <div class="keyword-text">점심식사</div>
                        <div class="keyword-text">저녁식사</div>
                        <div class="keyword-text">조용한</div>
                        <div class="keyword-text">아담한</div>
                        <div class="clear"></div>
                     </div>
                  </div>
                  <div class="clear"></div>
               </div>

               <div class="tr" style="margin-top: 8px;">
                  <div style="display: none;">${c.memberEmail}</div>
                  <c:if test="${email == c.memberEmail}">
                     <div>
                        <input type="button" onclick="location.href='../deleteComment?id=${c.id}'" value="삭제" />
                     </div>
                     <div>
                        <input type="button" onclick="location.href='../comment/edit/${c.id}'" value="수정" />
                     </div>
                  </c:if>
               </div>
            </div>
         </c:forEach>
      </c:if>
      <div id="seemore_review" style="margin: 0;" onClick="$(this).remove(); $('#div_loading').show();">
         <a href="JavaScript:getMore('web', 2);">
            평가 더 보기 <i class="fa fa-angle-down" aria-hidden="true"></i>
         </a>
      </div>
      <div id="div_loading"
         style="margin: 5px 0; width: 100%; text-align: center; display: none;">
         <img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/ajax-loader.gif" alt="Loading..." />
      </div>
      <div id="div_review_2" style="margin: 0;"></div>
   </div>
   <div id="enc_review_area" style="margin: 0; padding: 0; height: 0; overflow: hidden;">
      <div class="review-wrapper" style="margin: 0; padding: 0; height: 0; overflow: hidden;">
         <div id="review-title">유저 평가</div>
         <div class="review-list">
            <div id="review-area">
               <dc-review ng-repeat="item in profile.review" ng-model="item" index="$index"></dc-review>
               <div id="seemore_review"
                  ng-if="profile.review_total-profile.review.length>0 && !profile.loading.review"
                  ng-click="profile.load_more_review()">
                  <a>
                     평가 더 보기 <i class="fa fa-angle-down" aria-hidden="true"></i>
                  </a>
               </div>
               <dc-loader class="review-seemore-loading" type="1" ng-if="profile.loading.review"></dc-loader>
               <dc-review-composer data-rid="profile.id"></dc-review-composer>
            </div>
         </div>
      </div>
   </div>

   <!-- <script>
$(function(){   
$("#favorite_btn").click(function(){

   var restaurantId = ${r.id};
   var memberId = '<security:authentication property="name"/>';
   
   
$.ajax({
   type:"GET",
   url:"like",
   data : {
      "restaurantId":restaurantId,
      "memberId":memberId
      
   }
   , success : function(result){
      if(result ==1){
         alert("저장되었습니다");
      }else if(result==0){
         alert("삭제되었습니다");
      }
      
   }
   
   
});
})
})
</script> -->
</main>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9c613e70636456cd2f3178169be248f"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
   $(document).ready(function(){
      
      $("#cover").css("display","none");
      $("#visual")
        .css({
           "width": "100%", 
           "height": "300px", 
           "position": "relative",
           "background": "#f15c22",
        });
      $("#visual").attr("id", "map");
      $(".content-container")
      .css({
         "margin": "auto",
          "height": "100%",
          "min-height": "inherit",
          "width": "55%"
      });
      $("#main")
      .css({
         "margin": "auto",
          "height": "100%",
          "min-height": "inherit",
          "width": "100%",
          "padding": "0px"
      });
            
      /* 지도 부분 =================================================================================*/
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
      
      /* ==================================================================================================== */
      
      
        var isTimeOpened = false;    
    
        $("#more-extra-time").click(function(){
           
           if(!isTimeOpened){
          
               var append = "";$(".rest-time .rest-info-contents").append(append);
                    isTimeOpened = true;
                    $("#more-extra-time").html("접기<i class=\"fa fa-angle-up\" aria-hidden=\"true\"></i>"); 
            }else{
           
                $(".rest-time .rest-info-contents .rest-time-block:gt(1)").remove();
                    $("#more-extra-time").html("시간 더 보기<i class=\"fa fa-angle-down\" aria-hidden=\"true\"></i>");
                    isTimeOpened = false;
            }
       });
       
       
       var isMenuOpen = false;    
       $("#more-extra-menu").click(function(){
           if(!isMenuOpen){
               var append = "";append +="<div class=\"rest-menu-block\"><div class=\"rest-menu-left\">모듬전식</div><div class=\"rest-menu-right\"><div class=\"time\">7,500원</div></div></div>";append +="<div class=\"rest-menu-block\"><div class=\"rest-menu-left\">감자말이새우</div><div class=\"rest-menu-right\"><div class=\"time\">2,500원</div></div></div>";$(".rest-menu .rest-info-contents").append(append);
                    isMenuOpen = true;
                    $("#more-extra-menu").html("접기<i class=\"fa fa-angle-up\" aria-hidden=\"true\"></i>");
         }
           else {
              $(".rest-menu .rest-info-contents .rest-menu-block:gt(3)").remove();
              $("#more-extra-menu").html("시간 더 보기<i class=\"fa fa-angle-down\" aria-hidden=\"true\"></i>");
              isMenuOpen = false;
           }
       });
       
       //db좋아요올리기
       //댓글을 다는 이벤트
       $("#favorite_btn").click(function() {
         alert('눌렸다');
         console.log("restaurant_Id" + $("#restaurant_Id").val());
         //값 셋팅
         var objParams = {
            restaurant_Id : $("#restaurant_Id").val()
         };
         //ajax 호출

         $.get("${path}/food/customer/restaurant/like?restaurant_Id="
            + $("#restaurant_Id").val(), function(data) {
               //                   alert(data);
               //                   alert(JSON.parse(data)['idCheck']);
               //                   console.log("data" + data);
               //                   console.log("data type" + typeof data);
               var json = JSON.parse(data);
               console.log(json);
               var idCheck = json['idCheck'];
               //var idCheck = data.idCheck;//안대~
               /*  var likeCount = json['likeCount']; */
               console.log("idCheck : " + idCheck);
               //console.log("likeCount : " + likeCount);
               if (idCheck > 0)
                  alert("이미 좋아요를 누르셨습니다.");
            /*   else if(idCheck==-10)
                 alert("죄송합니다. 오류가 생겼습니다. 빠른시일내로 복구하겠습니다.");
              $("#likeCount").text(likeCount); */
            });
      });
      //좋아요

   });
   
</script>
