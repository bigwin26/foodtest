<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<main>
<div id="div_activate" class="container">
        <div class="title"><div class="row">신규 회원가입하기</div></div>
        <!-- 회원가입 폼 -->
        <div class="row">

            <table id="tbl_info" class="table table-user">

                <tr id="tr_name">
                    <th>닉네임</th>
                    <td>
                        <input id="txt_name" class="input-text w400" type="text" value="" placeholder="이름" /><br /><br />
                        런치 컨테이너에서 회원정보로 등록하실 닉네임을 입력해주세요. 영문 혹은 한글2~15자 이내로 입력해주세요.
                    </td>
                </tr>


                <tr id="tr_email">
                    <th>이메일</th>
                    <td>
                        <input id="txt_email" class="input-text w400" type="text" value="" placeholder="아이디" />
                        <span id="lbl_email_check" style="display:none;"></span><br /><br />
                        런치 컨테이너에서 이용하실 이메일을 입력해 주세요.
                    </td>
                </tr>
                <tr id="tr_pw">
                    <th>비밀번호</th>
                    <td>

                        <div id="div_password_Y">
                            <input id="txt_password" class="input-text w400" type="password" style="margin-bottom:8px;" placeholder="비밀번호" /><br />
                            <input id="txt_password2" class="input-text w400" type="password" placeholder="비밀번호 확인" /><br /><br />
                            특수문자(예: !@#$ 등) 1자 이상을 포함한 8~15 글자의 비밀번호로 설정해주세요.
                        </div>
                    </td>
                </tr>
                 <tr id="tr_mentor">
                    <th>선생님</th>
                    <td>
                        <input id="txt_name" class="input-text w400" type="text" value="" placeholder="선생님성함" /><br /><br />
                        담당 선생님의 성함을 입력해주세요.
                    </td>
                </tr>
                <tr id="tr_photo">
                    <th>프로필 사진</th>
                    <td>
                        <iframe name="fImage" frameborder="0" style="display:none; width:0; height:0;"></iframe>
                        <form id="frm_image" method="POST" action="/aws/uploader.php" target="fImage" enctype="multipart/form-data">

                            <input id="hid_photo" type="hidden" value="" />
                            <input id="hid_image" name="fImage" type="file" class="hide" />

                            <div class="fl" style="width:110px; height:110px; background:url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/img-profile-default.png);">
                                <img id="img_photo" src="" width="110" height="110" style="border-radius:50%; display:none;" />
                            </div>
                            <div class="fl" style="height:110px; padding-top:70px;">
                                <button id="btn_image" type="button" class="btn btn-red w150" style="margin-left:12px;">찾아보기</button>
                            </div>
                            <div class="clear"></div>
                        </form>
                        <br /><br />
                        런치 컨테이너의 회원 프로필 사진으로 사용될 이미지를 등록해 주세요.
                    </td>
                </tr>
            </table>
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
                    <label class="checkbox fl"><input id="ckb_location" type="checkbox" value="Y" /><i class="check-icon"></i> <span class="fs-13 fw-b">위치기반 서비스 이용약관</span></label>
                    <span class="fr"><a href="" target="_blank" style="color:#222222;">내용보기</a></span>
                    <div class="clear"></div>
                </div>
            </div>

        </div>
        <div class="row tc" style="padding:50px 0 55px 0;">
            <button id="btn_submit" type="button" class="btn btn-red w400 fs-16" style="height:65px;"><a href="index.html" style="text-decoration: none; color: #ffffff;">회원가입하기</a></button>
        </div>
    </div>

</main>