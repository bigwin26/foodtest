<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<main>
	<div class="container">
        <div class="row">
            <form id="${path}/member/login" method="POST">
                <div class="login">
                    <div class="title bb-gray">로그인 및 회원가입</div>
                    <div class="fs-15 fw-b" style="padding:24px 0;">
                        로그인을 통해 런치 컨테이너의 다양한 혜택을 누리세요.
                    </div>
                    <div>
                        <input id="txt_id" type="text" class="input-text" placeholder="아이디 입력" style="margin-bottom:7px;" />
                        <input id="txt_pw" type="password" class="input-text" placeholder="비밀번호 입력" />
                    </div>
                    <div style="padding:24px 0;">
                        <div class="fl">
                            <label class="checkbox"><input id="ckb_auto" type="checkbox" value="Y" checked /><i class="check-icon"></i> <span class="fs-13 fw-b">로그인상태 유지</span></label>
                        </div>
                        <div class="fr" style="padding-top:3px;"><a href="" style="color:#222222;">비밀번호 찾기</a></div>
                        <div class="clear"></div>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <button type="submit" class="btn btn-red">로그인</button>

                    <div style="margin:24px 0 100px 0; padding:24px 0; border:solid #E0E0E0 1px;">
                        <span class="fw-b">아직 회원이 아니신가요?</span><br />
                        <span>회원가입을 하시면 더 많은 정보와 혜택을 받으실 수 있습니다.</span>
                        <button id="btn_intro" type="button" class="btn btn-white w200" style="margin-top:12px;"><a href="join.html" style="text-decoration: none; color: #000000;">회원가입</a></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</main>