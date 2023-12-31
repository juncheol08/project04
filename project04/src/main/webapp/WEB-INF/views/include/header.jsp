
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path2" value="<%=request.getContextPath() %>" />



<header id="header">
    <nav class="navbar is-dark is-fixed-top nav-bg has-border-bottom" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
            <a class="navbar-item" href="${path2}/">
                <img src="${path2}/resources/img/smart_haebeop_logo.png" width="112" height="28">
            </a>

            <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
            </a>
        </div>
        <!-- header menu -->
        <div class="navbar-start">
            <div class="navbar-item has-dropdown is-hoverable">
                <a class="navbar-link is-arrowless" id="menu1" onmouseover="$(this).css({'background-color': '#ebebeb', 'color': 'white'});"
                   onmouseout="$(this).css({'background-color': '', 'color': ''});">
                    <strong>강의</strong>
                </a>
                <div class="navbar-dropdown is-transparent is-size-6 is-dark is-outlined" onmouseover="$('#menu1').css({'background-color': '#ebebeb', 'color': 'white'});"
                     onmouseout="$('#menu1').css({'background-color': '', 'color': ''});">
                    <a href="${path2}/lecture/lecList" class="button is-link2 is-rounded b2" >
                        강의 목록
                    </a>
                </div>
            </div>

            <div class="navbar-item has-dropdown is-hoverable">
                <a class="navbar-link is-arrowless" id="menu2" onmouseover="$(this).css({'background-color': '#ebebeb', 'color': 'white'});"
                   onmouseout="$(this).css({'background-color': '', 'color': ''});">
                    <strong>선생님</strong>
                </a>
                <div class="navbar-dropdown is-transparent is-size-6 is-dark is-outlined" onmouseover="$('#menu2').css({'background-color': '#ebebeb', 'color': 'white'});"
                     onmouseout="$('#menu2').css({'background-color': '', 'color': ''});">
                    <a href="${path2}/instructor/instructorList" class="button is-link2 is-rounded b2" >
                        선생님 목록
                    </a>
                </div>
            </div>

            <div class="navbar-item has-dropdown is-hoverable">
                <a class="navbar-link is-arrowless" id="menu3" onmouseover="$(this).css({'background-color': '#ebebeb', 'color': 'white'});"
                   onmouseout="$(this).css({'background-color': '', 'color': ''});">
                    <strong>정보</strong>
                </a>
                <div class="navbar-dropdown is-transparent is-size-6 is-dark is-outlined" onmouseover="$('#menu3').css({'background-color': '#ebebeb', 'color': 'white'});"
                     onmouseout="$('#menu3').css({'background-color': '', 'color': ''});">
                    <a href="${path2}/file/filelist1.do" class="navbar-item">
                        자료실
                    </a>
                </div>
            </div>

            <div class="navbar-item has-dropdown is-hoverable">
                <a class="navbar-link is-arrowless" id="menu4" onmouseover="$(this).css({'background-color': '#ebebeb', 'color': 'white'});"
                   onmouseout="$(this).css({'background-color': '', 'color': ''});">
                    <strong>커뮤니티</strong>
                </a>
                <div class="navbar-dropdown is-transparent is-size-6 is-dark is-outlined" onmouseover="$('#menu4').css({'background-color': '#ebebeb', 'color': 'white'});"
                     onmouseout="$('#menu3').css({'background-color': '', 'color': ''});">
                    <a href="${path2}/board/list.do" class="navbar-item">
                        자유 게시판
                    </a>

                </div>
            </div>


        </div>
        <!-- header menu end -->
        <div class="navbar-end">
            <div class="navbar-item">
                <div style="padding-right: 10px">
                    <c:if test="${not empty sid}">
                        ${sid} 회원님 환영합니다.
                    </c:if>
                </div>
                <div class="buttons">
                    <c:if test="${not empty sid && sid != 'admin'}"> <%-- 회원으로 로그인한 경우 --%>
                        <%--<a href="${path1}/member/mypage.do" class="button is-link is-rounded" >--%>
                        <a href="${path2}/member/mypage.do" class="button is-link is-rounded b1 button-bg" >
                            마이페이지
                        </a>
                        <%--<a href="${path1}/member/logout.do" class="button is-link2 is-rounded" >--%>
                        <a href="${path2}/member/logout.do" class="button is-link2 is-rounded b2 button-bg2" >
                            로그아웃
                        </a>
                    </c:if>
                    <c:if test="${empty sid}"> <%-- 로그인을 안 한 경우 --%>
                        <%--<a href="${path1}/member/term.do" class="button is-link is-rounded" >--%>
                        <a href="${path2}/member/join.do" class="button is-link is-rounded b1 button-bg" >
                            회원가입
                        </a>
                        <%--<a href="${path1}/member/login.do" class="button is-link2 is-rounded" >--%>
                        <a href="${path2}/member/login.do" class="button is-link2 is-rounded b2 button-bg2" >
                            로그인
                        </a>
                    </c:if>
                    <c:if test="${sid.equals('admin')}"> <%-- 관리자로 로그인 한 경우 --%>
                        <%--<a href="${path1}/admin/adminMain.do" class="button is-link is-rounded " >--%>
                        <a href="${path2}/admin/adminMain.do" class="button is-link is-rounded b1 button-bg" >
                            관리자페이지
                        </a>
                        <%--<a href="${path1}/member/logout.do" class="button is-link2 is-rounded" >--%>
                        <a href="${path2}/member/logout.do" class="button is-link2 is-rounded b2 button-bg2" >
                            로그아웃
                        </a>
                    </c:if>
                </div>
            </div>
            <div class="navbar-item has-dropdown is-hoverable">
                <a class="navbar-link is-arrowless">
                    <strong>고객센터</strong>
                </a>
                <div class="navbar-dropdown is-transparent is-size-6 is-dark is-outlined">
                    <a href="${path2}/notice/list.do" class="navbar-item">
                        공지 사항
                    </a>
                    <a href="${path2}/faq/list.do" class="navbar-item">
                        자주 묻는 질문
                    </a>
                    <a href="${path2}/qna/list.do" class="navbar-item">
                        QnA
                    </a>
                </div>
            </div>
        </div>
    </nav>
</header>