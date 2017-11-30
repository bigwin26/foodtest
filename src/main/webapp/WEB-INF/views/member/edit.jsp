<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="../../resource/css/reset.css">
<link rel="stylesheet" href="../../resource/css/join.css">
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
	clip: rect(0, 0, 0, 0);
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

@media ( min-width : 768px) {
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
	<div class="title">
		<div class="row">신규 회원가입하기</div>
	</div>
	<!-- 회원가입 폼 -->

	<div class="row">
		<form action="?${_csrf.parameterName}=${_csrf.token}" method="post"
			id="joinsubmit" enctype="multipart/form-data">
			<table id="tbl_info" class="table table-user">

				<tr id="tr_name">
					<th>닉네임</th>
					<td><input name="nickName" id="nickName"
						class="input-text w400" type="text" value="${member.nickName}" placeholder="닉네임" /><br />
						<br /> 런치 컨테이너에서 회원정보로 등록하실 닉네임을 입력해주세요. <br />영문 혹은 한글2~15자 이내로
						입력해주세요.</br> <span id="checkName"></span></td>
				</tr>


				<tr id="tr_email">
					<th>이메일</th>
					<td><input name="email" id="email" class="input-text w400"
						type="text" value="${member.email}" placeholder="이메일" /> <br />런치 컨테이너에서 이용하실
						이메일을 입력해 주세요. </br></td>
				</tr>
				<tr id="tr_pw">
					<th>현재 비밀번호</th>
					<td>

						<div id="div_password_Y">
							<input name="pwd" id="pwd" class="input-text w400"
								type="password" style="margin-bottom: 8px;" placeholder="비밀번호" />
							<div id="guidepwd" style="color: red; display: none;"></div>
							<br />특수문자(예: !@#$ 등) 1자 이상을 포함한 4~15 글자의 비밀번호로 설정해주세요.
						</div>
					</td>
				</tr>
				<tr id="tr_pw">
					<th>변경할 비밀번호</th>
					<td>

						<div id="div_password_Y">
							<input name="pwdchk" id="pwdchk" class="input-text w400"
								type="password" style="margin-bottom: 8px;"
								placeholder="변경할 비밀번호" />
							<div id="guidepwdchk" style="color: red; display: none;"></div>
							<br /> <br /> 비밀번호를 한번 더 입력해주세요.
						</div>
					</td>
				</tr>
				<tr id="tr_mentor">
					<th>선생님</th>
					<td><input name="mentor" id="mentor" class="input-text w400"
						type="text" value="${member.mentor}" placeholder="멘토" /><br /> <br /> 본인이 속한
						클래스의 선생님 성함을 입력해주세요.</td>
				</tr>
				<tr id="tr_photo">
					<th>프로필 사진</th>
					<td>


						<div class="filebox bs3-primary preview-image">
							<input class="upload-name" disabled="disabled"
								style="width: 200px;"> <label for="input_file">찾아보기</label>
							<input type="file" id="input_file" class="upload-hidden"
								name="file" value="${member.image}">
						</div> <br /> <br /> 런치 컨테이너의 회원 프로필 사진으로 사용될 이미지를 등록해 주세요.
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div class="row tc" style="padding: 50px 0 55px 0;">
		<a href="javascript:joinsubmit.submit()"
			style="text-decoration: none; color: #ffffff;"><button
				id="btn_submit" type="button" class="btn btn-red w400 fs-16"
				style="height: 65px;">수정하기</button></a>


	</div>
</div>
<div id="system_alert"
	style="position: fixed; width: 400px; top: 20px; left: 50%; margin-left: -200px; z-index: 9999; text-align: center;">
	<!-- <button type="button" class="close" data-dismiss="alert">&times;</button> -->
</div>
<script>
$(document).ready(function() {
var cfmId = "";		// 중복 체크 완료된 아이디 저장
/* 이메일 중복체크 */
$('#nickName').keyup(function() {
	var inputId = $('#nickName').val();
	 
	if ( inputId.length < 2 ) {
		$('#checkName').html('<strong>최소 2글자이상 입력해주세요.</strong>');
		$('#checkName').css("color","red");
		return false;
	}
	 else if( inputId.length > 2 ){
		
		$.ajax({
			url: "sameCheckId?${_csrf.parameterName}=${_csrf.token}",
			type: "POST",
			data: { "nickName" : inputId },
			success: function(result) {
				
				if ( result.message == "true" )	{
					//$('#system_alert').attr('class', 'alert alert-dismissible alert-danger');
					$('#checkName').html('<strong>이미 존재하는 아이디입니다!</strong>');
					$('#checkName').css("color","red");
					cfmId = '';
					
				} else {
					//$('#system_alert').attr('class', 'alert alert-dismissible alert-success');
					$('#checkName').html('<strong>사용 가능한 아이디입니다.</strong>');
					$('#checkName').css("color","green");
					cfmId = inputId;
				}
				
				/* $('#checkEmail').slideDown('fast', function() {
					setTimeout(function() { $('#checkEmail').slideUp('fast'); }, 1000);
				}); */
				
				$('#id_cfm').text("중복 체크").attr('disabled', false);
			},
			error: function(result) {
				alert("잠시 후 다시 이용해주세요.");
			}
});
	 }	 
});

/* 이메일 중복체크 */
	/*  비밀번호 검사 */
		$('#pwd').keyup(checkPw).blur(checkPw).focus(checkPw);
			
		function checkPw() {
			
			var inputId = $('#nickName').val();
			var inputPw = $(this).val();
			
			var strId = "";
			var strPw = "";
			for ( var i = 0; i < inputId.length-3; i++ ) {
				strId = inputId.substr(i, 4);
				
				for ( var j = 0; j < inputPw.length-3; j++ ) {
					strPw = inputPw.substr(j, 4);
					
					if ( strId == strPw ) {
						$('#guidepwd').text("아이디와 동일한 글자 사용불가");
						$('#guidepwd').show();
						completePw = false;
						
						return true;
					}
				}
			}
			
			// 동일한 문자 4개 이상 반복 확인
			if ( inputPw.length >= 4 ) {
				
				for ( var i = 0; i < inputPw.length-3; i++ ) {
					var sameCnt = 0;
					
					for ( var j = i; inputPw.length; j++ ) {
						if ( inputPw.charAt(i) == inputPw.charAt(j) ) {
							sameCnt++;
						} else {
							break;
						}
						
						if ( sameCnt >= 4 ) {
							$('#guidepwd').text("동일한 글자 4개 이상 사용불가");
							$('#guidepwd').show();
							completePw = false;
							
							return true;
						}
					}
				}
			}
			var regexEngL = getRegex("regexEngL");
			var regexEngU = getRegex("regexEngU");
			var regexNum = getRegex("regexNum");
			var regexSpe = getRegex("regexSpe");
			var regexNotEngNumSpe = getRegex("regexNotEngNumSpe");
			
			// 공백 확인
			if ( inputPw == '' ) {
				$('#guidepwd').text("비밀번호를 입력해주세요.");
				$('#guidepwd').show();
				completePw = false;
			
			// 글자수 확인
			} else if (inputPw.length < 4 || inputPw.length > 15 ) {
				$('#guidepwd').text("최소 4글자 이상, 최대 15글자 이하로 입력해주세요.");
				$('#guidepwd').show();
				completePw = false;
			
			// 문자 확인
			} else if (regexNotEngNumSpe.test(inputPw)){
				$('#guidepwd').text("올바르게 입력해주세요.");
				$('#guidepwd').show();
				completePw = false;
			
			// 정상 입력
			} else if (regexSpe.test(inputPw)&& regexNum.test(inputPw)||regexEngU.test(inputPw)||regexEngL.test(inputPw)) {
				
				$('#guidepwd').hide();
				completePw = true;
				
			} else {
				$('#guidepwd').text("올바르게 입력해주세요.");
				$('#guidepwd').show();
				completePw = false;
			}
		}	
		
		// 비밀번호 확인 검사
		$('#pwd').blur(checkPwCfm);
		$('#pwdchk').keyup(checkPwCfm);
		
		function checkPwCfm() {
			var inputPw = $('#pwd').val();
			var inputPwCfm = $('#pwdchk').val();
			
			if ( inputPw != inputPwCfm ) {
				$('#guidepwdchk').text("비밀번호가 일치하지 않습니다.");
				$('#guidepwdchk').show();
				
				completePwCfm = false;
			} else {
				$('#guidepwdchk').hide();
				completePwCfm = true;
			}
		}
		/*  비밀번호 검사 */
		
		$("input[type='submit']").click(function(){
		alert('가입되었습니다.');
	});
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
	
/*		정규식 반환		*/
function getRegex(type) {
	var regexKor = /[ㄱ-힣]/;
	var regexEngL = /[a-z]/;
	var regexEngU = /[A-Z]/;
	var regexEngLU = /[a-z]/i;
	var regexNum = /[0-9]/;
	var regexSpe = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/;
	var regexSpace = /[\s]/;
	var regexKorEng = /[ㄱ-힣a-z]/i;
	var regexEngNum = /[a-z0-9]/i;
	var regexKorEngNum = /[ㄱ-힣a-z0-9]/i;
	var regexEngNumSpe = /[a-z0-9\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/i;
	var regexNotNum = /[^0-9]/;
	var regexNotKorEng = /[^ㄱ-힣a-z]/i;
	var regexNotEngNum = /[^a-z0-9]/i;
	var regexNotEngNumSpe = /[^a-z0-9\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/i;
	var regexEmail = /[^ㄱ-힣a-z0-9.\-_]/i;		// 회원-이메일 전용
	
	if ( type == "regexKor" )				return regexKor;
	else if ( type == "regexEngL" )			return regexEngL;
	else if ( type == "regexEngU" )			return regexEngU;
	else if ( type == "regexEngLU" )		return regexEngLU;
	else if ( type == "regexNum" )			return regexNum;
	else if ( type == "regexSpe" )			return regexSpe;
	else if ( type == "regexSpace" )		return regexSpace;
	else if ( type == "regexKorEng" )		return regexKorEng;
	else if ( type == "regexEngNum" )		return regexEngNum;
	else if ( type == "regexKorEngNum" )	return regexKorEngNum;
	else if ( type == "regexEngNumSpe" )	return regexEngNumSpe;
	else if ( type == "regexNotNum" )		return regexNotNum;
	else if ( type == "regexNotKorEng" )	return regexNotKorEng;
	else if ( type == "regexNotEngNum" )	return regexNotEngNum;
	else if ( type == "regexNotEngNumSpe" )	return regexNotEngNumSpe;
	else if ( type == "regexEmail" )		return regexEmail;
}
/*	 // 정규식 반환		*/

</script>