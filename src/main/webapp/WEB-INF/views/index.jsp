<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="resource/css/reset.css">
<link rel="stylesheet" href="resource/css/index.css">

<main>

<div class="main-info">
	<div id="outline_div">
	<div id="back_div">
	<div class="main-info-slide">
		<div class="main-info-slide-image"
			style="background-image: url('resource/images/img-1.jpg');"></div>
		<div class="main-info-slide-image"
			style="background-image: url('resource/images/img-2.jpg');"></div>
		<div class="main-info-slide-image"
			style="background-image: url('resource/images/img-3.jpg');"></div>
		<div class="main-info-slide-image"
			style="background-image: url('resource/images/img-4.jpg');"></div>
	</div>
	<div id="op_div">
	<div class="main-info-container">
		<div class="main-info-container-logo"
			style="background-image: url('resource/images/main-logo.png');"></div>
		<div class="main-info-container-search">
			 <form action="customer/restaurant" method="get">
				<span class="main-info-container-search-inner"> <input
					type="text" class="main-info-container-search-inner-text" name="q" id="autocom"/>
				</span>
				<button id="search" class="main-info-container-search-inner-submit"
					style="background-image: url('resource/images/search.png');"
					type="submit"></button>
			</form> 
		</div>
	</div>
	</div>
	</div>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resource/js/slider.js"></script> 
<script>
$(function(){
	
	
	
	
	$("#autocom").keyup(function(){		
		
		$.ajax({
			
			type:"GET",
			url:"autocom",
			data:{
				
				autocomplete : $("#autocom").val() 
				
			},
			success : function(result){
				
				
				
				
			}
		})
		
		
		
		
		
		
		
		
	})
	
		
	
})


/* $(function(){
alert("a");
	updateData();
})
	function updateData(){
		$.ajax({
			url:"index",
			type:"GET",
			success: function(result){
				alert(result);				
			}
			
		});
		setTimeout("updateData()", 2000);
	}
	 */



		$(function(){
		        $('.main-info-slide').reSlider({
		            speed:1000,  //페이드속도
		            delay:5000,  //자동전환 속도
		            imgCount:4,  //이미지갯수
		            autoPlay:true//자동재생
		        })
	/* 	  
		var pageNum = $(".pageNum");
		var searchButton = $("#search");
		var ajaxData;
		
		$.urlParam = function(name){
		    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
		    //return results[1] || 0;
		    if (results==null){
		        return null;
		     }
		     else{
		        return results[1] || 0;
		     }
		}
		
		var page = $.urlParam('p')?$.urlParam('p'):1;
		var query = $.urlParam('q')?$.urlParam('q'):"";
		
	 	for(var i=0; i<pageNum.length; i++){
			var pathName = $(location).attr('pathname');
			var url = pathName + "?p=" + (i+1);
			//alert(url);
			pageNum.eq(i).attr("href", url);
		} 
		
		searchButton.click(function(){
			var query = $("input[name='query']").val();
			var path = $(location).attr('host');
			var url = path +'/food/customer/restaurant?'+'p=' + page + "&q=" + query;
			//alert(query);
			alert(url);
			
			$(location).attr('href', url);
		})
		
		$("input[name='query']").keypress(function(event){
		    if (event.which == 13) {
		    	searchButton.click();
		        return false;
		    }
		});
		
		$.ajax({
			type:"POST",
			async: false,
			url: "/food/customer/restaurant-ajax?${_csrf.parameterName}=${_csrf.token}",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data: {"page":page, "q":query},
			//data: {"page":page},
			dataType:"json",
			success: function (data) {
				var json = JSON.stringify(data);
				//alert(json);
				ajaxData = data;
				//alert("success");
			}
		}); */
		    });
		</script>
		</main>


<%--  <main id="main">
		<!-------검색창 및 스크린-------------->
		<div class="screen">
			<div class="screen-gradation"></div>
			<form action="/search" method="post" class="main-search">
				<input type="text" placeholder="맛집을 검색하세요" /> <input type="submit" />
			</form>
		</div>
		
		<div class="content">
			<div class="container">
				<ol class="">
					<!-- 최근 추가된 맛집 섹션 ------------------->
					<li id="newest section" class="clearfix">
						<h2>최근 추가된 맛집!</h2> 
						<!--------------- 맛집 카드들 ------------------->
						<div class="cards">
							<c:forEach var="i" begin="0" end="4">
								<div class="lunch-card">
									<div class="poster-wrapper">
										<img class="poster-size1" alt=""
											src="resource/images/jjambbong.jpg">
										<div class="detail-opener gradation"></div>
										<div class="action-wrapper">
											<div class="lunch-title">백짬뽕</div>
											<div class="eval"></div>
											<div class="wish-comment">
												<div class="wish">
													<span class="icon"></span> 먹고싶어!
												</div>
												<div class="comment">
													<span class="icon"></span> 후기쓰기!
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<div class="lunch-card">
								<div class="poster-wrapper">
									<img class="poster-size1" alt="" src="resource/images/jjambbong.jpg">
									<div class="detail-opener gradation"></div>
									<div class="action-wrapper">
										<div class="lunch-title">뺵짱뽐1212</div>
										<div class="eval"></div>
										<div class="wish-comment">
											<div class="wish">
												<span class="icon">먹고싶어!</span> 
											</div>
											<div class="comment">
												<span class="icon">후기쓰기!</span> 
											</div>
										</div>
									</div>
								</div>
							</div>
		
						</div>
					</li>
		
					<!-- 인기 최고  맛집 섹션 ------------------->
					<li id="best" class=" section clearfix">
						<h2>sist 인기 최고 식당!</h2>
						<div class="cards">
							<c:forEach var="i" begin="0" end="2">
								<div class="lunch-card">
									<div class="poster-wrapper">
										<img class="poster-size2" alt="" src="resource/images/nuddle.jpg">
										<div class="detail-opener gradation"></div>
										<div class="action-wrapper">
											<div class="lunch-title">백짬뽕</div>
											<div class="eval">평점 4.9!</div>
											<div class="wish-comment">
												<div class="wish">
													<span class="icon">먹고싶어!</span> 
												</div>
												<div class="comment">
													<span class="icon">후기쓰기!</span> 
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</li>
		
					<!-- 평점 최고 맛집 섹션 ------------------->
					<li id="highest" class="section clearfix">
						<h2>평점 최고 순위 맛집!</h2>
						<div class="cards">
							<div class="cards"></div>
						</div>
					</li>
		
					<!-- 카페 순위 섹션 ------------------------>
					<li id="cafe" class="section clearfix">
						<h2>밥먹고 가기 좋은 카페~</h2>
						<div class="cards">
							<div class="cards"></div>
						</div>
					</li>
				</ol>
			</div>
		</div>
	
	</main>  --%>