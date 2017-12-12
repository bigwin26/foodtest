<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

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
<%-- likeCount: ${likeCount} --%>
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
                     <span class="restaurant-location" style="display: none">${r.location}</span>
                  </div>
                  <div id="item-category"></div>
               </div>
               <div id="item-header-right">
                  <div id="item-sharer">
                     <span class="item-rn-subtitle">${r.genre}, ${r.keyword}</span>
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
                     <div class="item-stats">
                        <div id="like-count" class="item-stats-count">${r.countLiked}</div>
                        <div class="item-stats-title">좋아요</div>
                     </div>
                     <div class="item-stats">
                           <div class="item-stats-count">${r.countCmt}</div>
                           <div class="item-stats-title">평가</div>
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
                        <a class='item-button-like' id='favorite_btn' value='Y'>
                           <input type="hidden" id="restaurant_Id" name="restaurant_Id" value="${r.id}" />
                           <c:if test="${like eq 0}">
                           		<div id='fvr-icon' style="
                           						background: url('${ctx}/resource/images/dislike.png') center no-repeat; 
                           						background-size: cover;">
                    			</div>
                           </c:if>
                           <c:if test="${like eq 1}">
                           		<div id='fvr-icon' style="
                           						background: url('${ctx}/resource/images/like2.png') center no-repeat; 
                           						background-size: cover;">
                    			</div>
                           </c:if>
                           <div id='fvr-text'>좋아요</div>
                        </a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
      <div id="item-body">
         <div id="item-body-contents">
            <div class="item-information tip-line">
               <div class="item-information-icon">
                  <img src="${ctx}/resource/images/tip.png">
               </div>
               <div class="item-information-text">
                  ${r.writerName} 님의 한 줄 평: "${r.tip}"
               </div>
               	<div id="" style="background: url('${ctx}/resource/customer/restaurant/2017/${r.id}/${r.image}');
               				width: 200px;
               				height: 150px;
               				border-radius: 10px;
							background-size: cover;
							background-position: center center;">
            	</div>
               <%-- <img id="foodImage" src="${ctx}/resource/customer/restaurant/2017/${r.id}/${r.image}"> --%>
            </div>
            <div class="item-information">
               <div class="item-information-icon">
                  <img src="${ctx}/resource/images/menu.png">
               </div>
               <div class="item-information-text">
               		메뉴: 
               </div>
               <img id="menuImage">
            </div>
            <div class="item-information">
               <div class="item-information-icon">
                  <img src="${ctx}/resource/images/location.png">
               </div>
               <div class="item-information-text">
                  ${r.address}
               </div>
            </div>
         </div>
      </div>
   </div>
   
   <div class="div_section">
      <div id="div_review" class="keyword-title">
         	총 ${cmtp}건의 방문자 평가
      </div>
	
	<ul class="review-list">
		<c:if test="${not empty cmtList}">
	         <c:forEach var="c" items="${cmtList}">
	         	<li>
		         	<div class="blur-area">
						<a href="" class="user-pic">
							<img alt="회원사진" src="${ctx}/resource/images/1.jpg">
						</a>
						<div class="review">
							<%-- <c:forEach var="i" items="${cmtImageList}">
								<p>${i.id}</p>
							</c:forEach> --%>
							<p class="commentId" id="commentId" style="display: none">${c.id}</p>
							<p class="restaurantId" style="display: none">${c.restaurantId}</p>
							<p class="review-name">${c.writerName}</p>
							<%-- <p class="review-text">${c.content}</p> --%>
							<div class="review-content">
								<div class="review-text">${c.content}</div>
								<div class="comment-image" id="comment-image">
									<ul>
									</ul>
								</div>
							</div>
							<div class="review-bottom">
								<div class="review-date">
									<fmt:formatDate pattern="yyyy-MM-dd kk:mm:ss" value="${c.regDate}" />
								</div>
								<c:if test="${email == c.memberEmail}">
									<div id="end" style="position: absolute; right: 20px;">
				                        <input type="button" onclick="location.href='../comment/edit/${c.id}?restaurantId=${r.id}'" value="수정" />
				                        <input type="button" onclick="location.href='../deleteComment?id=${c.id}'" value="삭제" />
					                </div>
			                  	</c:if>
							</div>
							
			                <div style="display: none;">${c.memberEmail}</div>
		                  
						</div>
					</div>
					<!-- <span class="baloon-arrow"></span> -->
				</li>
	         </c:forEach>
	    </c:if>
    </ul>
    
   </div>
</div>

<div class="ajax-loading" style="position: fixed; top: 40%; left: 45%; z-index: 999; display: none;">
	<img src="${ctx}/resource/images/loading.gif" style="width: 100px; height: 100px; text-align: center;">
</div>

<script>
/* $(function(){   
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
}) */
</script>
</main>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9c613e70636456cd2f3178169be248f"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${ctx}/resource/js/moment.min.js"></script>
<script>
	
	var page = 1;
	var commentIds = $(".commentId");
	var restaurantIds = $(".restaurantId");
	
	for(var i=0; i<commentIds.length; i++){
		var commentId = commentIds.eq(i).text();
		var restaurantId = restaurantIds.eq(i).text();
		$(".commentId").eq(i).attr("id", "commentId"+commentId);
		
		$.ajax({
			type: "POST",
			async: false,
			url: "../comment-image-ajax?${_csrf.parameterName}=${_csrf.token}",
			data: {
            	"commentId": commentId
            },
            dataType: "json",
            success: function(data) {
            	var json = JSON.stringify(data);
            	//alert(commentId + ": " + data.length);
            	if(data.length > 0){
            		$(".comment-image").eq(i).attr("id", "comment-image"+commentId);
            		
            		for(var j=0; j<data.length; j++){
		            	//$("#comment-image"+commentId+" ul").append("<li>" + data[j].src + "</li>");
            			$("#comment-image"+commentId+" ul")
            			.append('<li><img src="${ctx}/resource/customer/restaurant/2017/' + restaurantId + "/commentImage/" + data[j].src + '"></li>');
            			
            			$("#comment-image"+commentId+" ul img").css({
            				"margin-right": "10px",
            				"margin-top": "10px",
            				"width": "100px",
            				"height:": "100px"
            			})
            		}
            		
            	}
            	
            }
		});
	}
	
	$(window).scroll(function() {
	
	    if ($(document).height() <= $(window).scrollTop() + $(window).height()) {
	
	        $(function() {
	            page += 1;
	            var test;
	        
	            $.ajax({
	                type: "POST",
	                url: "../comment-ajax?${_csrf.parameterName}=${_csrf.token}",
	                data: {
	                	"id": ${r.id},
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
	                    //var json = JSON.stringify(data);
	                    //alert(json);
	                    
	                    if(data.length == 0){
	                        page -= 1;
	                        return;
	                    }
						
	                    var content = "";
	                    for (var i = 0; i < data.length; i++) {
	                    	var date = new Date(data[i].regDate);
	                    	date = moment(date);
	                    	//alert(date.format('YYYY-MM-DD hh:mm:ss'));
	                    	if("${email}" == data[i].memberEmail){
		                        content =
		                        	'<li>' +
			    		         		'<div class="blur-area">' +
				    						'<a href="" class="user-pic">' +
				    						'<img alt="회원사진" src="${ctx}/resource/images/1.jpg">' + 
				    						'</a>' +
				    						'<div class="review">' +
				    							'<p class="commentId" id="commentId' + data[i].id + '" style="display: none">' + data[i].id + '</p>' +
												'<p class="restaurantId" style="display: none">' + data[i].restaurantId + '</p>' +
				    							'<p class="review-name">' + data[i].writerName + '</p>' + 
				    							/* '<p class="review-text">' + data[i].content + '</p>' +  */
				    							'<div class="review-content">' + 
													'<div class="review-text">' + data[i].content + '</div>' +
													'<div class="comment-image" id="comment-image'+ data[i].id +'">' + 
														'<ul>' + 
														'</ul>' +
													'</div>' +
												'</div>' +
				    							'<div class="review-bottom">' + 
				    								'<div class="review-date">' +
				    									date.format('YYYY-MM-DD hh:mm:ss') + 
				    								'</div>' +
			    									'<div id="end" style="position: absolute; right: 20px;">' +
			    										'<input type="button" onclick="location.href=\'../deleteComment?id=' + data[i].id +'\'" value="삭제" />' +
			    				                        '<input type="button" onclick="location.href=\'../comment/edit\'" value="수정" />' +
			    					                '</div>' +
				    							'</div>' +
				    			                '<div style="display: none;">' + data[i].memberEmail + '</div>' +
				    						'</div>' +
			    						'</div>' +
		    						'</li>'
	                    	}
	                    	else{
	                    		content =
		                        	'<li>' +
			    		         		'<div class="blur-area">' +
				    						'<a href="" class="user-pic">' +
				    						'<img alt="회원사진" src="${ctx}/resource/images/1.jpg">' + 
				    						'</a>' +
				    						'<div class="review">' +
					    						'<p class="commentId' + data[i].id + '" style="display: none">' + data[i].id + '</p>' +
												'<p class="restaurantId" style="display: none">' + data[i].restaurantId + '</p>' +
				    							'<p class="review-name">' + data[i].writerName + '</p>' + 
				    							/* '<p class="review-text">' + data[i].content + '</p>' +  */
				    							'<div class="review-content">' + 
													'<div class="review-text">' + data[i].content + '</div>' +
													'<div class="comment-image" id="comment-image'+ data[i].id +'">' + 
														'<ul>' + 
														'</ul>' +
													'</div>' +
												'</div>' +
				    							'<div class="review-bottom">' + 
				    								'<div class="review-date">' +
				    									date.format('YYYY-MM-DD hh:mm:ss') + 
				    								'</div>' +
				    							'</div>' +
				    			                '<div style="display: none;">' + data[i].memberEmail + '</div>' +
				    						'</div>' +
			    						'</div>' +
		    						'</li>'
	                    	}
		                    $(".review-list").append(content);
		                    
		                    var commentId = $("#commentId" + data[i].id).text();
                    		var restaurantId = $(".restaurantId").eq(i).text();
		                    
                    		$.ajax({
                    			type: "POST",
                    			async: false,
                    			url: "../comment-image-ajax?${_csrf.parameterName}=${_csrf.token}",
                    			data: {
                                	"commentId": commentId
                                },
                                dataType: "json",
                                success: function(data) {
                                	if(data.length > 0){
                                		for(var j=0; j<data.length; j++){
                                			$("#comment-image"+commentId+" ul")
                                			.append('<li><img src="${ctx}/resource/customer/restaurant/2017/' + restaurantId + "/commentImage/" + data[j].src + '"></li>');
                                			
                                			$("#comment-image"+commentId+" ul img").css({
                                				"margin-right": "10px",
                                				"margin-top": "10px",
                                				"width": "100px",
                                				"height:": "100px"
                                			})
                                		}
                                	}
                                }
                    		});
	                    }
	                },
	                error: function(request, status, error) {
	                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	                }
	            });
	        });
	    }
	});

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
      

  	var restaurantLocation = $(".restaurant-location").text().replace(/\(|\)/g,"");
    var coordinate = restaurantLocation.split(", ");
    //alert(coordinate[0]);
	            
      /* 지도 부분 =================================================================================*/
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
         mapOption = {
            //center : new daum.maps.LatLng(37.55325832462685, 126.93698692019638), // 지도의 중심좌표
            center : new daum.maps.LatLng(coordinate[0], coordinate[1]), // 지도의 중심좌표
            level : 5 // 지도의 확대 레벨
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
      
      /* ---------------------------------------------------------------------------------------- */
	
   // 마커 이미지의 이미지 주소입니다
      var imageSrc = "${ctx}/resource/images/markerStar2.png";
      
      // 마커 이미지의 이미지 크기 입니다
      var imageSize = new daum.maps.Size(24, 35);

      // 마커 이미지를 생성합니다    
      var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
      
      var latlng = new daum.maps.LatLng(coordinate[0], coordinate[1]);

      // 마커를 생성합니다
      var marker = new daum.maps.Marker({
         map : map, // 마커를 표시할 지도
         id : ${r.id},
         name : "${r.name}", // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
         address : "${r.address}",
         position : latlng, // 마커를 표시할 위치
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
      
      })(marker, ${r.id}, "${r.name}", "${r.address}", latlng);   
      // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다 
      
      /* -----------------------------------------------------------------------------------------*/
   
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
         var content = '<div style="padding:5px; z-index:1; width: 180px;">'
        	 	+ '<div>' + name + '</div>'
				+ '<div>' + address +'</div>'
               + '</div>';
   
         infowindow.setContent(content);
         infowindow.open(map, marker);
      }
      
      /* ==================================================================================================== */
       
      //좋아요
      $("#favorite_btn").click(function(){
		  var restaurantId = ${r.id};
		  //var memberId = '<security:authentication property="name"/>';
		  $.ajax({
		  		type:"GET",
		  		url:"like",
		  		
		  		data : {
		  			"restaurant_Id":restaurantId
		  			//"memberId":memberId
		  			}, 
	  			dataType: "json",
		  		success : function(result){
		  			//var json = JSON.stringify(result);
		  			//alert(json);
		  			var likeCount = result.likeCount;
		  			var checkResult = result.checkResult;
		  			$("#like-count").text(likeCount);
		  			
		  			if(checkResult == 1){
		  				$("#fvr-icon").css({
		  					"background": "url(${ctx}/resource/images/dislike.png)",
		  					"background-size": "cover"
		  				});
		  			}
		  			if(checkResult == 0){
		  				$("#fvr-icon").css({
		  					"background": "url(${ctx}/resource/images/like2.png)",
		  					"background-size": "cover"
		  				});
		  			}
		  			
		  			/* if(result == 1){
		  				alert("저장되었습니다");
		  			}
		  			else if(result == 0){
		  				alert("삭제되었습니다");
		  			} */
		  		}
		  });
	  })
	  
   });
   
</script>
