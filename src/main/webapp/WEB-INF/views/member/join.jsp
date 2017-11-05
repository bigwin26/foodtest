<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="../resource/css/reset.css">
<link rel="stylesheet" href="../resource/css/join.css">
<style>
/*파일업로드디자인
왜 css파일에 넣으면 f12할떄 포즈되는걸까*/
 .where {
  display: block;
  margin: 25px 15px;
  font-size: 11px;
  color: #000;
  text-decoration: none;
  font-family: verdana;
  font-style: italic;
} 

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip:rect(0,0,0,0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #E73524;
	border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em;
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}

/* imaged preview */
.filebox .upload-display {
	margin-bottom: 5px;
}

@media(min-width: 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap {
	display: inline-block;
	width: 100px;
	height: 100px;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img {
	display: block;
	max-width: 100%;
	width: 100% \9;
	height: auto;
	
}

.filebox.bs3-primary label {
  color: #ffffff;
  background-color: #E73524;
}
</style>


<div id="div_activate" class="container">
        <div class="title"><div class="row">신규 회원가입하기</div></div>
        <!-- 회원가입 폼 -->
        <div class="row">
<form action="?${_csrf.parameterName}=${_csrf.token}" method="post" id="joinsubmit" enctype="multipart/form-data">
            <table id="tbl_info" class="table table-user">

                <tr id="tr_name">
                    <th>닉네임</th>
                    <td>
                        <input name="nickName" id="nickName" class="input-text w400" type="text" value="" placeholder="닉네임" /><br /><br />
                        런치 컨테이너에서 회원정보로 등록하실 닉네임을 입력해주세요. <br/>영문 혹은 한글2~15자 이내로 입력해주세요.
                    </td>
                </tr>


                <tr id="tr_email">
                    <th>이메일</th>
                    <td>
                        <input name="email" id="email" class="input-text w400" type="text" value="" placeholder="이메일" />
                       <br /><br />
                        런치 컨테이너에서 이용하실 이메일을 입력해 주세요.
                    </td>
                </tr>
                <tr id="tr_pw">
                    <th>비밀번호</th>
                    <td>

                        <div id="div_password_Y">
                            <input name="pwd" id="pwd" class="input-text w400" type="password" style="margin-bottom:8px;" placeholder="비밀번호" />
                            <!-- <input id="txt_password2" class="input-text w400" type="password" placeholder="비밀번호 확인" /><br /><br /> -->
                            <br /><br />
                            특수문자(예: !@#$ 등) 1자 이상을 포함한 8~15 글자의 비밀번호로 설정해주세요.
                        </div>
                    </td>
                </tr>
                <tr id="tr_mentor">
	<th>멘토</th>
	<td><input name="mentor" id="mentor" class="input-text w400" type="text"
		value="" placeholder="멘토" /><br />
	<br /> 런치 컨테이너에서 회원정보로 등록하실 멘토를 입력해주세요. </td>
</tr>
                <tr id="tr_photo">
                    <th>프로필 사진</th>
                    <td>
                        
                                    
						<div class="filebox bs3-primary preview-image">
							<input class="upload-name"  disabled="disabled" style="width: 200px;">

							<label for="input_file">찾아보기</label> 
						  <input type="file" id="input_file" class="upload-hidden"> 
						</div>
                        
                        <br /><br />
                     런치 컨테이너의 회원 프로필 사진으로 사용될 이미지를 등록해 주세요.
                    </td>
                </tr>
            </table>
            </form>
        </div>

        <!-- 약관 동의 -->
        <div class="row">
            <div class="title bb-gray">이용약관</div>
            <div style="padding:30px 50px;">
                <div>
                    <label class="checkbox fl"><input id="ckb_service" type="checkbox" value="Y" /><i class="check-icon"></i> <span class="fs-13 fw-b">이용약관</span></label>
                    <span class="fr"><a href="" target="_blank" style="color:#222222;">내용보기</a></span>
                    <div class="clear"></div>
                </div>
                <div style="margin:12px 0;">
                    <label class="checkbox fl"><input id="ckb_policy" type="checkbox" value="Y" /><i class="check-icon"></i> <span class="fs-13 fw-b">개인정보 취급방침</span></label>
                    <span class="fr"><a href="" target="_blank" style="color:#222222;">내용보기</a></span>
                    <div class="clear"></div>
                </div>
                <div>
                    <h2>회원가입시 위 약관에 동의합니다</h2>
                </div>
            </div>

        </div>
        <div class="row tc" style="padding:50px 0 55px 0;">
            <button id="btn_submit" type="button" class="btn btn-red w400 fs-16" style="height:65px;"><a href="javascript:joinsubmit.submit()" style="text-decoration: none; color: #ffffff;">회원가입하기</a></button>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

        </div>
    </div>



<script type="text/javascript">
$(function(){
	$("input[type='submit']").click(function(){
		alert('가입되었습니다.');
	});
});


$(document).ready(function(){
	   var fileTarget = $('.filebox .upload-hidden');
	   var filename = null;
	   
	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            // 파일명 추출
	            filename = $(this)[0].files[0].name;
	        } 

	        else {
	            // Old IE 파일명 추출
	            filename = $(this).val().split('/').pop().split('\\').pop();
	        };

	        $(this).siblings('.upload-name').val(filename);
	        
	        if (filename != "") {
		         
	            ext = filename.slice(filename.lastIndexOf(".") + 1).toLowerCase();
	         
	            if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
	            	
	                alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");	               
	                $(this).siblings('.upload-name').val("");
	                
	            }
	         
	        }
	        
	        
	    });

	    //preview image 
	    var imgTarget = $('.preview-image .upload-hidden');

	    imgTarget.on('change', function(){
	        var parent = $(this).parent();
	        parent.children('.upload-display').remove();

	        if(window.FileReader){
	            //image 파일만
	            if (!$(this)[0].files[0].type.match(/image\//)) return;
	            
	            var reader = new FileReader();
	            reader.onload = function(e){
	                var src = e.target.result;
	                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
	            }
	            reader.readAsDataURL($(this)[0].files[0]);
	        }
	        
	        else {
	            $(this)[0].select();
	            $(this)[0].blur();
	            var imgSrc = document.selection.createRange().text;
	            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

	            var img = $(this).siblings('.upload-display').find('img');
	            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
	        }
	    });
	});

</script>


<%-- <main>
<form action="?${_csrf.parameterName}=${_csrf.token}" method="post">
<table>
<tr id="tr_name">
	<th>이메일</th>
	<td><input name="email" id="email" class="input-text w400" type="text"
		value="" placeholder="이름" /><br />
	<br /> 런치 컨테이너에서 회원정보로 등록하실 이메일을 입력해주세요. </td>
</tr>
<tr id="tr_pwd">
	<th>비밀번호</th>
	<td><input name="pwd" id="pwd" class="input-text w400" type="password"
		value="" placeholder="비밀번호" /><br />
	<br /> 런치 컨테이너에서 회원정보로 등록하실 비밀번호를 입력해주세요. </td>
</tr>
<tr id="tr_nickName">
	<th>닉네임</th>
	<td><input name="nickName" id="nickName" class="input-text w400" type="text"
		value="" placeholder="닉네임" /><br />
	<br /> 런치 컨테이너에서 회원정보로 등록하실 닉네임을 입력해주세요. </td>
</tr>
<tr id="tr_mentor">
	<th>선생님 성함</th>
	<td><input name="mentor" id="mentor" class="input-text w400" type="text"
		value="" placeholder="멘토" /><br />
	<br /> 런치 컨테이너에서 회원정보로 등록하실 선생님 성함을 입력해주세요. </td>
</tr>
</table>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="submit" value="회원가입"/>
</form>
</main> --%>
