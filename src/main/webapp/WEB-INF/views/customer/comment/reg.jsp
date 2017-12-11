<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${path}/resource/js/star.js"></script>
<script type="text/javascript">
	window.addEventListener("load", function() {
		var fileInput = document.querySelector(".ex3-upload input");
		var spanButton = document.querySelector(".ex3-upload span");
		/*  var progressBar =  document.querySelector("#ex3-upload #progress-bar");
		 progressBar.style.width = "0px"; */

		/*  var fileViewer =  document.querySelector("#ex3-upload ul"); */
		//파일 목록 초기화 
		/* var xhr = new XMLHttpRequest();
			xhr.onload = function(){
		var files = JSON.parse(xhr.responseText);
		
		for(var i = 0; i<files.length; i++){
		var li =  document.createElement("li");
		li.textContent = files[i];
		fileViewer.appendChild(li);
		}
		
		};
		xhr.open("GET","../../file-list");
		xhr.send(); */

		//var a = document.createElement("a");
		spanButton.onclick = function(e) {
			var event = new MouseEvent("click", {
				'view' : window,
				'bubbles' : true,
				'cancelable' : true
			});

			fileInput.dispatchEvent(event);
			fileInput.onchange = function() {

				var file = fileInput.files[0];
				var formData = new FormData();

				formData.append("title", "테스트");
				formData.append("file", file);

				/* var xhr = new XMLHttpRequest();
				xhr.upload.onprogress = function(e){
					var percentage = Math.round(e.loaded*100/e.total);
					
					progressBar.textContent = percentage +"%";
					progressBar.style.width = percentage +"px";
					progressBar.style.background = "green";

				} */
				xhr.onload = function() {

				};
				xhr.onerror = function(e) {
					alert("예기치 못한 오류가 발생했습니다.")
				};
				xhr.open("POST",
						"${c.id}?${_csrf.parameterName}=${_csrf.token}");
				xhr.send(formData);
			};
		};
	});
</script>
<main>
<div class="container">
	<div class="row" style="padding: 50px 0;">
		<div class="rest_info">
			<span class="fs-20 fw-b">'${r.name}' 평가하기</span><br />
			<div style='padding: 24px 0;'>
				<img
					src='https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/52671/54138/52671_54138_86_5_7288_2016520232152807_496x331.jpg'
					width='300' height='200' />
			</div>
			<div style="padding-bottom: 5px;">${r.genre}</div>
			<div class="bb-gray" style="padding-bottom: 12px;">${r.keyword}</div>
			<div style="padding: 12px 0 5px 0;">${r.address}</div>
			<div>${r.phoneNumber}</div>
		</div>
		<form id="comment-form"
			action="?${_csrf.parameterName}=${_csrf.token}" method="post"
			enctype="multipart/form-data">
			<div class="review_info">
				<!-- score -->
				<div class="section">
					<div class="title fl">
						전체평점<i>*</i> <span><br />이 음식점에 대한 전반적인 평가를 해주세요.</span>
					</div>
					<span class="star-input"> <span class="input"> <input
							type="radio" name="point" value="1" id="p1"> <label
							for="p1">1</label> <input type="radio" name="point" value="2"
							id="p2"> <label for="p2">2</label> <input type="radio"
							name="point" value="3" id="p3"> <label for="p3">3</label>
							<input type="radio" name="point" value="4" id="p4"> <label
							for="p4">4</label> <input type="radio" name="point" value="5"
							id="p5"> <label for="p5">5</label>
					</span> <output for="star-input">
							<b></b>
						</output>
					</span>
					<div class="clear"></div>
				</div>
				<!-- 방문후기 -->
				<input id="hid_contents_deny" type="hidden" value="" />
				<div class="section">
					<div>
						<div class="title fl">
							방문후기 <span class="fs-11 fc-red"></span>
						</div>
						<div class="clear"></div>
					</div>

					<textarea id="txt_contents" name="content" class="fs-13"
						placeholder="음식, 서비스, 분위기, 위생상태 등의 방문 경험을 적어주세요."
						style="border: solid 1px #D5D5D5; width: 100%; height: 120px;"></textarea>
					<div style="padding-top: 5px;">
						<div class="fr">
							<span id="lbl_limit">0</span> / 1000
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<!-- </form> -->
				<!-- 이곳까지 form_data 전송 -->
				<!-- 사진 -->
				<input id="hid_photo_deny" type="hidden" value="" />
				<div class="section">
					<div class="title fl">
						사진첨부 <span class="fs-11 fc-red"></span><br /> <span>음식,
							인테리어 외관 등 사진을 첨부해주세요.</span><br /> <span class="fc-gray"
							style="line-height: 1.0;">※저작권에 위배되는 사진첨부시 법적 처벌 조치를 받으실 수
							있습니다.</span>
					</div>
					<div class="fr">
					<div class="ex3-upload">
						<input type="file" name="file" style="display: none;" multiple="multiple"/> <span
							style="border: 1px solid #999; border-radius: 5px; background: #f15c22; padding: 10px; cursor: pointer;color: white;">파일선택</span>
						<div>
							<ul>
								<li></li>
							</ul>
						</div>
					</div>
					</div>
					<!-- <div class="fr">
						<input type="file" name="file" multiple="multiple" />
					</div> -->
					<div class="clear"></div>
					<div id="div_photo">
						<div class="clear"></div>
					</div>
				</div>

				<!-- 매장정보 -->
				<input id="hid_menu_deny" type="hidden" value="" />
				<div class="section">
					<div class="title fl">
						메뉴판 사진첨부 <span class="fs-11 fc-red"></span><br /> <span>메뉴판,
							영업시간, 주차 등 매장정보사진을 첨부해주세요.</span><br /> <span class="fc-gray"
							style="line-height: 1.0;">※저작권에 위배되는 사진첨부시 법적 처벌 조치를 받으실 수
							있습니다.</span>
					</div>
					<div class="fr">
					<div class="ex3-upload">
						<input type="file" name="image" style="display: none;" /> <span
							style="border: 1px solid #999; border-radius: 5px; background: #f15c22; padding: 10px; cursor: pointer;color: white;">파일선택</span>
						<div>
							<ul>
								<li></li>
							</ul>
						</div>
					</div>
					</div>
					<!-- <<div class="fr">
						<input type="file" name="image" />
					</div> -->
					<div class="clear"></div>
					<div id="div_menu">
						<div class="clear"></div>
					</div>
				</div>

				<!-- 클린평가 -->
				<div class="tc">
					<input id="btn_save" type="submit" class="btn btn-black w240"
						style="margin-bottom: 100px;">
				</div>
			</div>
		</form>
		<div class="clear"></div>
	</div>
</div>
</main>

