<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.area {
	overflow: hidden;
	margin: 0px;
	padding: 0px;
	min-width: 960px !important;
	width: 100%;
}

.wrapper {
	overflow: hidden;
	margin: auto;
	width: 960px;
}
.bkbox1{
float: left;
}
.bkbox{
float: right;

}
#bk-list-area {
	margin: 30px 0px;
}

.defaultbks {
	border-bottom: 1px solid #e0e0e0;
	padding-bottom: 30px;
}

.default-bks:first-child {
	margin-right: 20px;
}

.bk-default-title {
	margin-bottom: 20px;
}

.default-title {
	font-size: 22px;
	font-weight: bold;
	color: #4a4a4a;
}

.text-ellipsis {
	word-wrap: break-word;
	word-break: break-all;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.default-desc {
	font-size: 14px;
	color: #9b9b9b;
	margin-top: 5px;
	height: 20px;
}

.bk-default-card {
	padding: 12px;
	background-color: #00cdcd;
	height: 265px;
	border-radius: 5px;
	margin-bottom: 15px;
	position: relative;
	background:
		url(https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/52433/59940/52433_59940_85_4_5577_201311100417407_300x200.jpg);
	background-size: cover;
	background-repeat: no-repeat;
}

.bk-default-card-back-img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.3);
	border-radius: 4px;
}

.bk-default-content {
	position: relative;
}

.like-count {
	font-size: 16px;
	color: #ffffff;
}

.like-count img, .bk-item-count-info img {
	width: 24px;
	height: 22px;
	margin-right: 5px;
}

.title-text {
	font-size: 30px;
	font-weight: bold;
	color: #ffffff;
	text-align: center;
	margin-top: 62px;
}

.title-desc {
	font-size: 16px;
	text-align: center;
	opacity: 0.75;
	color: #ffffff;
}
.bkbox1{
	float:left;
}
.bkbox{
	float:right;
}
</style>
<main id="main" />
<div class="area">
	<div class="wrapper" id="mainWrapper">
		<!--            <div id="bk_ext_area">-->
		<!--                <button class="button1 radius pull-right" data-toggle="modal" data-target="#modalNewBucket">+ 새로운 버킷 만들기</button>-->
		<!--            </div>-->

		<div id="bk-list-area">

			<div class="defaultbks flex">
				<div id="bkDefault" class="default-bks">
				<a href="${path}/member/liked">
						<div class="bk-box1">
							<div class="bk-default-title">
								<div class="default-title text-ellipsis">내가 좋아요한 맛집</div>
								<div class="default-desc"></div>
							</div>
							<div class="bk-default-card"
								style="background: url(https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/59780/54476/59780_54476_86_5_7858_201311992215452_300x200.jpg); background-size: cover; background-repeat: no-repeat;">
								<div class="bk-default-card-back-img"></div>
								<div class="bk-default-content">
									<div class="like-count">
										<img
											src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/bucket/icon-like-counter@2x.png">2
									</div>
									<div class="title-text">내가 좋아요한 맛집</div>
									<div class="title-desc"></div>
								</div>
							</div>
						</div>
					</a>
				</div>
				<div id="bkReview" class="default-bks">
				<a href="${path}/member/commented">
						<div class="bk-box">
							<div class="bk-default-title">
								<div class="default-title text-ellipsis">내가 평가한 맛집</div>
								<div class="default-desc"></div>
							</div>
							<div class="bk-default-card"
								style="background: url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/bucket/bg/bg-my-rating-store.jpg); background-size: cover;">
								<div class="bk-default-card-back-img"></div>
								<div class="bk-default-content">
									<div class="like-count review-count">
										<img
											src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/bucket/icon-review-counter@2x.png">0
									</div>
									<div class="title-text">내가 평가한 맛집</div>
									<div class="title-desc"></div>
								</div>
							</div>

						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
</main>
<script type="text/javascript">
	$(function(){
		
		$("#visual")
		.css({
			"height": "300px",
			"background": "#313131 url(https://dcicons.s3.amazonaws.com/dicons/img/bucket/mypage_bg.jpg) center no-repeat",
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
		
		$("#visual .content-container .customer-text").text("좋아하는 맛집을 기록하고, 공유할 수 있습니다.");
		
		
		
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
