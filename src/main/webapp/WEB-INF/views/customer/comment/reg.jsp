<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.container {
    width: 100%;
    padding-bottom: 24px;
    font-size: 13px;
}
.row {
    width: 100%;
    margin: 0 auto;
}
.rest_info {
    float: left;
    width: 30%;
    height: 405px;
    background-color: #F9F9F9;
    border: solid #E0E0E0 1px;
    padding: 24px;
    text-align: center;
}
.review_info {
    float: right;
    width: 60%;
    padding-left: 24px;
}
form {
    margin: 0;
    padding: 0;
    color: #222222;
}
.section {
    line-height: 1.5;
    padding-bottom: 100px;
    margin-bottom: 24px;
    border-bottom: solid #E0E0E0 1px;
}
.fl {
    float: left;
}
.score_box {
    float: right;
    width: 270px;
    padding: 15px 15px 15px 24px;
    border: solid #E0E0E0 1px;
}
.score_title {
    float: right;
    width: 65px;
    height: 20px;
    border-radius: 2px;
    color: #FFFFFF;
    text-align: center;
    padding-top: 2px;
}
.bc-gray-review {
    background-color: #D5D5D5;
}
.score_star {
    float: right;
    width: 110px;
    padding-top: 5px;
}
.title {
    padding-bottom: 4px;
    font-weight: bold;
}
.title span {
    line-height: 2.0;
    font-weight: normal;
}
.fr {
    float: right;
}
.w90 {
    width: 90px;
}
.btn {
    border: none;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    width: 100%;
    cursor: pointer;
    height: 40px;
    font-size: 13px;
}
.btn-black {
    background-color: #f15c22;
    color: #FFFFFF;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<main>
	<%-- <h2 class="main title">'${r.name}'후기 등록 페이지</h2>
	
	<div class="">
		<h3 class="hidden">후기 등록 내용</h3>
		<table class="">
			<tbody>
				<tr>
					<th>가게 이름</th>
					<td>${r.name}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td class="text-align-left text-indent" colspan="3"><fmt:formatDate	pattern="yyyy-MM-dd" value="${r.regDate}" /></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${r.writerName}</td>
					<th>좋아요</th>
					<td>${r.countLiked}</td>
				</tr>
				<tr>
					<th>상세내용</th>
					<td>${r.content}</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<form id="comment-form" action="?${_csrf.parameterName}=${_csrf.token}" method="post"	enctype="multipart/form-data">
		<table class="">
			<tbody>
				<tr>
					<th>전체 평점</th>
					<td><input type="radio" name="point" value="5"/>훌륭해요!</td>
					<td><input type="radio" name="point" value="3"/>보통이에요</td>
					<td><input type="radio" name="point" value="1"/>별로에요..</td>
				</tr>
				<tr>
					<th>후기</th>
					<td><textarea cols="40" rows="5" name="content" placeholder="음식, 서비스, 분위기, 위생상태 등의 방문 경험을 적어주세요."></textarea></td>
				</tr>
				<tr>
					<th>사진첨부</th>
					<td><input type="file" name="file" multiple="multiple"/></td>
				</tr>
				<tr>
					<th>메뉴판 사진</th>
					<td><input type="file" name="image" /></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="등록하기" />
	</form>
	
	
	<div class="margin-top text-align-center">
		<a class="btn btn-list" href="../restaurant/${r.id}">취소</a>
	</div> --%>
	<div class="container">
		<div class="row" style="padding:50px 0;">
			<div class="rest_info">
				<span class="fs-20 fw-b">'풀사이드228' 평가하기</span><br />
			<div style='padding:24px 0;'><img src='https://d2t7cq5f1ua57i.cloudfront.net/images/r_images/52671/54138/52671_54138_86_5_7288_2016520232152807_496x331.jpg' width='300' height='200' /></div>				<div style="padding-bottom:5px;">파스타, 레스토랑, 피자</div>
				<div class="bb-gray" style="padding-bottom:12px;">분위기있는, 고급스러운, 여유로운, 분위기좋은, 야경, 이국적, 런치</div>
				<div style="padding:12px 0 5px 0;">인천광역시 연수구 송도동 22-8</div>
				<div>032-817-0000</div>
			</div>
			<div class="review_info">
				<!-- form -->
				<form id="frm_action" method="POST" action="./review.php" target="action" enctype="multipart/form-data">
				<input name="retURL" type="hidden" value="https://www.diningcode.com/profile.php?rid=gnxkJYukvDFg" />
				<input name="v_rid" type="hidden" value="gnxkJYukvDFg" />
				<input name="rv_id" type="hidden" value="" />
				<input name="contents_point" type="hidden" value="100" />
				<input name="photo_point" type="hidden" value="100" />
				<input name="menu_point" type="hidden" value="100" />

				<input id="hid_keyword_check_purpose" type="hidden" name="checkPurpose" value="" />
				<input id="hid_keyword_check_mood" type="hidden" name="checkMood" value="" />
				<input id="hid_keyword_check_facility" type="hidden" name="checkFacility" value="" />

				<input id="hid_keyword_etc_purpose" type="hidden" name="etcPurpose" value="" />
				<input id="hid_keyword_etc_mood" type="hidden" name="etcMood" value="" />
				<input id="hid_keyword_etc_facility" type="hidden" name="etcFacility" value="" />

				<input id="hid_add_photo" type="hidden" name="addPhoto" value="" />
				<input id="hid_remove_photo" type="hidden" name="removePhoto" value="" />
				<input id="hid_add_menu" type="hidden" name="addMenu" value="" />
				<input id="hid_remove_menu" type="hidden" name="removeMenu" value="" />

				<!-- score -->
				<div class="section">
					<div class="title fl">
						전체평점<i>*</i>
						<span><br />이 음식점에 대한 전반적인 평가를 해주세요.</span>
					</div>
					<div class="score_box">
						<input id="hid_score" name="score" type="hidden" value="" />
						<div class="fl">평점</div>
						<div class="score_title bc-gray-review">평가없음</div>
						<div class="score_star"><i class="fa fa-star star_off" aria-hidden="true" style="width:20px; margin-top:-5px; font-size:18px; cursor:pointer;"></i><i class="fa fa-star star_off" aria-hidden="true" style="width:20px; margin-top:-5px; font-size:18px; cursor:pointer;"></i><i class="fa fa-star star_off" aria-hidden="true" style="width:20px; margin-top:-5px; font-size:18px; cursor:pointer;"></i><i class="fa fa-star star_off" aria-hidden="true" style="width:20px; margin-top:-5px; font-size:18px; cursor:pointer;"></i><i class="fa fa-star star_off" aria-hidden="true" style="width:20px; margin-top:-5px; font-size:18px; cursor:pointer;"></i></div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
				<!-- 방문후기 -->
				<input id="hid_contents_deny" type="hidden" value="" />
				<div class="section">
					<div>
						<div class="title fl">방문후기 <span class="fs-11 fc-red"></span></div>
						<div class="clear"></div>
					</div>

					<textarea id="txt_contents" name="content" class="fs-13" placeholder="음식, 서비스, 분위기, 위생상태 등의 방문 경험을 적어주세요." style="border:solid 1px #D5D5D5; width:100%; height:120px;"></textarea>
					<div style="padding-top:5px;">
						<div class="fr"><span id="lbl_limit">0</span> / 1000</div>
						<div class="clear"></div>
					</div>
				</div>
				</form>
				<!-- 이곳까지 form_data 전송 -->
				<!-- 사진 -->
				<input id="hid_photo_deny" type="hidden" value="" />
				<div class="section">
					<div class="title fl">
						사진첨부 <span class="fs-11 fc-red"></span><br />
						<span>음식, 인테리어 외관 등 사진을 첨부해주세요.</span><br />
						<span class="fc-gray" style="line-height:1.0;">※저작권에 위배되는 사진첨부시 법적 처벌 조치를 받으실 수 있습니다.</span>
					</div>
					<form id="frm_photo" method="POST" action="/aws/uploader.php" target="action" enctype="multipart/form-data">
						<input id="hid_photo" name="fImage" type="file" style="display:none;" />
						<input name="key" type="hidden" value="review" />
						<input name="val" type="hidden" value="photo_6a225df186b8" />
					</form>
					<div class="fr">
						<button id="btn_photo" type="button" class="btn btn-black w90 fr">사진첨부</button>
					</div>
					<div class="clear"></div>
					<div id="div_photo">
						<div class="clear"></div>
					</div>
				</div>

				<!-- 매장정보 -->
				<input id="hid_menu_deny" type="hidden" value="" />
				<div class="section">
					<div class="title fl">
						매장정보 사진첨부 <span class="fs-11 fc-red"></span><br />
						<span>메뉴판, 영업시간, 주차 등 매장정보사진을 첨부해주세요.</span><br />
						<span class="fc-gray" style="line-height:1.0;">※저작권에 위배되는 사진첨부시 법적 처벌 조치를 받으실 수 있습니다.</span>
					</div>
					<form id="frm_menu" method="POST" action="/aws/uploader.php" target="action" enctype="multipart/form-data">
						<input id="hid_menu" name="fImage" type="file" style="display:none;" />
						<input name="key" type="hidden" value="review" />
						<input name="val" type="hidden" value="menu_6a225df186b8" />
					</form>
					<div class="fr">
						<button id="btn_menu" type="button" class="btn btn-black w90 fr">사진첨부</button>
					</div>
					<div class="clear"></div>
					<div id="div_menu">
						<div class="clear"></div>
					</div>
				</div>

				<!-- 클린평가 -->
				<div class="tc">
					<button id="btn_save" type="review" class="btn btn-black w240" style="margin-bottom:100px;">평가제출</button>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</main>

