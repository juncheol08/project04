<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강의 목록</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <style>
        .hero {
            height: 50px;
            margin-top: 40px;
        }

        .teacherList{
            height: 600px;
            padding-top: 40px;
        }
        .listTitle{
            border-bottom: 1px solid #cccccc;
            height: 60px;
            margin-bottom: 30px;
        }
        .listTitle h2{
            text-align: center;
            font-size: 30px;
            line-height: 60px;
        }

        .teacherCard {
            width:250px;
            height: 420px;
            margin-right: 60px;
            background-color: #fff;
            border: 1px solid #e0e0e0;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s;
            float: left;
        }
        .teacherCard:last-child{
            margin-right: 0;
        }

        .teacherCard:hover {
                transform: scale(1.05); /* 확대 효과*/

        }

        .teacherImage {
            width: 250px;
            /*height: 320px;*/
            /*margin: 0 auto;*/
            text-align: center;

        }
        .teacherImage img {
            width: 250px;
            /*height: 320px;*/
            overflow: hidden;
        }

        .teacherInfo {
            padding: 0px 15px 15px 15px;
        }
        .teacherCate {
            font-size: 16px;
            margin-bottom: 2px;
            color: #6b6b6b;
        }
        .teacherTitle {
            font-size: 20px;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .teacherPrice {
            font-size: 16px;
            font-weight: bold;
        }

        .is-active{
            font-weight: bold;
        }
    /* -------------------------------------------------*/
        /* 테이블 스타일 */
        .tb1 {
            width: 80%;
            margin: 50px auto;
            font-size: 20px;
            border-collapse: collapse;
        }
        .tb1 th {
            background-color: #527AF2;
            color: #fff;
            padding: 16px;
            border: 1px solid #527AF2;
        }

        .tb1 th:first-child {
            width: 40px;
        }

        #myTable td {
            height: 180px;
            overflow: hidden; /* Overflow 처리 (필요한 경우) */
            vertical-align: middle; /* 상단 정렬로 변경 */

        }

        #myTable td > div {
            text-align: center;
        }

        .img_tit {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
        }

        #myTable tbody tr:not(:last-child) td {
            border-bottom: 1px solid #333;
        }

        .img_tit img {
            max-height: 280px;
            overflow: hidden;
        }


        .tb1 .item1 {
            width: 25%;
        }
        .tb1 .item2 {
            width: 20%;
            text-align: left;
            font-weight: bold;
        }
        .tb1 .item3 {
            width: 12%;

        }
        .tb1 .item4 {
            width: 23%;

        }
        .tb1 .item5 {
            width: 20%;

        }

        .tb1 p {
            padding: 4px;
        }
        /* 기타 버튼 스타일 */

        .btn1 {
            display: inline-block;
            border-radius: 4px;
            line-height: 36px;
            width: 90px;
            padding: 4px;
            /*max-width: 120px;*/
            text-align: center;
            background-color: #527AF2;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-bottom: 10px;
            margin-left: 10px;
            float: right;
        }

        .btn1:hover {
            background-color: #666666;
        }
        .likebtn {
            display: block;
            border-radius: 4px;
            width: 34px;
            line-height: 36px;
            padding: 4px 8px 4px 8px;
            /*max-width: 120px;*/
            text-align: center;
            background-color: #527AF2;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
            float: right;
            font-size: 24px;

        }

        .likebtn:hover {
            background-color: #666666;
        }


        .inbtn {
            display: block;
            border-radius: 10px;
            min-width: 60px;
            padding-right: 10px;
            padding-left: 10px;
            margin-left: 15px;
            text-align: center;
            line-height: 38px;
            background-color: #527AF2;
            color: #fff;
            font-size: 18px;
            float: right;
            cursor: pointer;
            transition: background-color 0.3s;

        }
        .inbtn:hover {
            background-color: #666666;
        }

        .btn_group {
            margin-top: -38px;
            z-index: 1000;
            position: relative;
        }
        .btn_group p {
            float: right;
        }
    </style>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<%--<section class="hero is-medium is-white">--%>
<%--    <div class="hero-body has-text-centered">--%>
<%--    </div>--%>
<%--</section>--%>

<div class="content" id="content">
    <div class="row column text-center">
        <div class="container" id="cate" style="text-align: center">

            <h2 style="margin-top: 10px">${subjectKor} 전체 강의</h2>
            <div class="tabs is-centered is-boxed">
                <ul>
                    <li id="selectKor">
<%--                    <li class="is-active" id="selectKor">--%>
                        <a href="${path}/lecture/lectureList.do?category=kor" >
                            <span>국어</span>
                        </a>
                    </li>
                    <li id="selectMath">
                        <a href="${path}/lecture/lectureList.do?category=math" >
                            <span>수학</span>
                        </a>
                    </li>
                    <li id="selectEng">
                        <a href="${path}/lecture/lectureList.do?category=eng" >
                            <span>영어</span>
                        </a>
                    </li>
                    <li id="selectHis">
                        <a href="${path}/lecture/lectureList.do?category=his" >
                            <span>한국사</span>
                        </a>
                    </li>
                    <li id="selectSoc">
                        <a href="${path}/lecture/lectureList.do?category=soc" >
                            <span>사회탐구</span>
                        </a>
                    </li>
                    <li id="selectSci">
                        <a href="${path}/lecture/lectureList.do?category=sci" >
                            <span>과학탐구</span>
                        </a>
                    </li>
                </ul>
            </div>

        </div>
<%--       ---------------------------국어--------------------------------- --%>
        <div class="container" id="${subject}List">
            <table class="tb1" id="myTable">
                <thead>
                <tr>
                    <th></th>
                    <th>정보</th>
                    <th>가격</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="lecture" items="${lectureList }">
                    <tr class="${lecture.category }">
                        <td class="item1">
                            <div class="img_tit"><a href="${path}/lecture/lectureDetail.do?no=${lecture.no}"><img src="${path }/storage/${lecture.no }"/></a></div>
                        </td>
                        <td class="item2">
                            <p>${lecture.teachername }</p>
                            <a href="${path}/lecture/lectureDetail.do?no=${lecture.no}"><p>${lecture.title}</p></a>
                            <p>수강인원 : ${lecture.cnt}/${lecture.max_cnt}</p>
                        </td>
                        <td class="item3">
                            <p>${lecture.price}</p>

                        </td>
                        <td class="item4">
                            <c:if test="${not empty sid}">
<%--                                <c:set var="isLiked" value="${likedProductIds.contains(pro.no)}" />--%>
                                <p style="margin-bottom: 4px; height: 50px">
                                    <a href="${path }/lecture.do?pno=${lecture.no }" class="btn1">맛보기</a>
                                    <a href="${path }/lecture.do?pno=${lecture.no }" class="btn1">OT</a>
                                </p>
                                <p>
                                    <a href="${path }/lecture.do?pno=${lecture.no }&cate=${lecture.title}" class="btn1">장바구니</a>
                                    <a href="${path }/lecture/lectureEnroll.do?no=${lecture.no }" class="btn1" onclick="return checkEnrollment(${lecture.cnt}, ${lecture.max_cnt});">수강신청</a>
                                </p>
<%--                                <c:choose>--%>
<%--                                    <c:when test="${isLiked }">--%>
<%--                                        &lt;%&ndash; 눌러도 새로고침 안되게 처리 ///                         현재 로그인한 사용자 ID                 pro.no을 저장하기 위한 역할 &ndash;%&gt;--%>
<%--                                        <a href="javascript:void(0);" onclick="toggleLike(${lecture.no}, '${sessionScope.sid}');" class="likebtn" data-product-id="${lecture.no}" style="color: #ff5050">♥</a>--%>
<%--                                    </c:when>--%>
<%--                                    <c:otherwise>--%>
<%--                                        <a href="javascript:void(0);" onclick="toggleLike(${lecture.no}, '${sessionScope.sid}');" class="likebtn" data-product-id="${lecture.no}"  style="color: #b4b4b4">♥</a>--%>
<%--                                    </c:otherwise>--%>
<%--                                </c:choose>--%>

                            </c:if>
                            <script>
                                // ajax 방식으로 바꿔야함
                                function checkEnrollment(cnt, maxCnt) {
                                    if (cnt >= maxCnt) {
                                        alert('수강 인원이 가득 찼습니다.');
                                        return false; // 링크 이동 X
                                    }
                                    return true; // 링크 이동 허용
                                }
                            </script>
                            <script>
                                function toggleLike(productNo, ${sid }) {
                                    $.ajax({
                                        url: "ProductLike.do",
                                        method: "POST",
                                        data: {
                                            pno: productNo,
                                            sid: ${sid }
                                        },
                                        success: function(response) {
                                            var likeButton = $("[data-product-id='" + productNo + "']");

                                            if (response.trim() === "liked") {
                                                alert("상품을 좋아요 했습니다!");
                                                likeButton.css("color","#ff5050");
                                            } else if (response.trim() === "unliked") {
                                                alert("상품의 좋아요를 취소했습니다.");
                                                likeButton.css("color","#b4b4b4");                                                } else {
                                                alert("오류가 발생했습니다. 다시 시도해주세요.");
                                            }
                                        }
                                    });
                                }
                                $(document).ready(function() {
                                    // 좋아요 상태를 기반으로 버튼 색 변경
                                    $(".inbtn").each(function() {
                                        var isLiked = $(this).hasClass("liked");
                                        if (isLiked) {
                                            $(this).addClass("liked");
                                        }
                                    });
                                });
                            </script>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <script>
                $(document).ready( function () {
                    $('#myTable').DataTable({
                        pageLength : 5,
                        order: [[3, 'desc']], // 0번째 컬럼을 기준으로 내림차순 정렬
                        info: false,
                        dom: 't<f>p',
                        language: {
                            emptyTable: '등록된 강의가 없습니다.'
                        }

                    });
                } );
                $(document).ready(function() {
                    $('.dataTables_paginate').css({
                        'textAlign':'left',
                        'float': 'none',
                        'margin-top':'10px',
                    });
                    $('.dataTables_filter').css({
                        'float': 'left',
                        'margin-top':'14px',
                        'margin-right':'280px'
                    });
                    $('#myTable_paginate').css({
                        'margin-right':'120px'
                    });


                });

            </script>
            <div class="btn_group">
                <c:if test="${sid eq 'admin' }">
                    <a href="${path}/AddProduct.do" class="inbtn">강의 등록</a>
                </c:if>
            </div>
        </div> <%-- 국어 end --%>





        <script>
            $(document).ready(function() {
                $('.tabs ul li').on('click', function() {
                    // 모든 탭에서 is-active 클래스 제거
                    $('.tabs ul li').removeClass('is-active');

                    // 클릭한 탭에 is-active 클래스 추가
                    $(this).addClass('is-active');

                    // 모든 컨테이너를 숨김
                    $('.container:not(#cate)').hide();

                    // 해당하는 컨테이너만 표시
                    var id = $(this).attr('id').replace('select', '').toLowerCase() + 'List';
                    $('#' + id).show();

                });
            });
        </script>
    </div>
</div>
<footer id="footer" class="footer-nav row expanded collapse">
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>