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
    <title>선생님 목록</title>
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
            <h2 style="margin-top: 10px">스마트해법 선생님</h2>
            <div class="tabs is-centered is-boxed">
                <ul>
                    <li class="is-active" id="selectKor">
                        <a>
                            <span>국어</span>
                        </a>
                    </li>
                    <li id="selectMath">
                        <a>
                            <span>수학</span>
                        </a>
                    </li>
                    <li id="selectEng">
                        <a>
                            <span>영어</span>
                        </a>
                    </li>
                    <li id="selectHis">
                        <a>
                            <span>한국사</span>
                        </a>
                    </li>
                    <li id="selectSoc">
                        <a>
                            <span>사회탐구</span>
                        </a>
                    </li>
                    <li id="selectSci">
                        <a>
                            <span>과학탐구</span>
                        </a>
                    </li>
                </ul>
            </div>

        </div>
<%--       ---------------------------국어--------------------------------- --%>
        <div class="container" id="korList">
            <div class="columns" style="margin: 0 auto; padding-top: 20px; width: 1200px">
                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=김국어"><img src="${path}/resources/img/teacher_img/국어_권순규_1.png"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 국어</div>
                        <div class="teacherTitle">김국어</div>
                    </div>
                </div>


                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=이국어"><img src="${path}/resources/img/teacher_img/국어_김면수%20(2).jpg"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 국어</div>
                        <div class="teacherTitle">이국어</div>
                    </div>
                </div>


                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=박국어"><img src="${path}/resources/img/teacher_img/국어_이현민.png"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 국어</div>
                        <div class="teacherTitle">박국어</div>
                    </div>
                </div>

                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=최국어"><img src="${path}/resources/img/teacher_img/국어_김진아.jpg"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 국어</div>
                        <div class="teacherTitle">최국어</div>
                    </div>
                </div>

            </div>
            <div class="columns" style="margin: 0 auto; padding-top: 20px; width: 1200px">
                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=한국어"><img src="${path}/resources/img/teacher_img/국어_서지은.jpg"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 국어</div>
                        <div class="teacherTitle">한국어</div>
                    </div>
                </div>


                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=홍국어"><img src="${path}/resources/img/teacher_img/국어_모세은%20(2).jpg"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 국어</div>
                        <div class="teacherTitle">홍국어</div>
                    </div>
                </div>



            </div>

        </div> <%-- 국어 end --%>

        <%--       ---------------------------수학--------------------------------- --%>
        <div class="container" id="mathList" style="display: none">
            <div class="columns" style="margin: 0 auto; padding-top: 20px; width: 1200px">
                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=김수학"><img src="${path}/resources/img/teacher_img/수학_김라나_Img13.jpg"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 수학</div>
                        <div class="teacherTitle">김수학</div>
                    </div>
                </div>


                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=이수학"><img src="${path}/resources/img/teacher_img/수학_김수경_0.jpg"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 수학</div>
                        <div class="teacherTitle">이수학</div>
                    </div>
                </div>


                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=박수학"><img src="${path}/resources/img/teacher_img/수학_류준상.jpg"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 수학</div>
                        <div class="teacherTitle">박수학</div>
                    </div>
                </div>

                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=최수학"><img src="${path}/resources/img/teacher_img/수학_서준성.jpg"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 수학</div>
                        <div class="teacherTitle">최수학</div>
                    </div>
                </div>

            </div>
        </div> <%-- 수학 end --%>

        <%--       ---------------------------영어--------------------------------- --%>
        <div class="container" id="engList" style="display: none">
            <div class="columns" style="margin: 0 auto; padding-top: 20px; width: 1200px">
                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=김영어"><img src="${path}/resources/img/teacher_img/영어_bella.jpg"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 영어</div>
                        <div class="teacherTitle">김영어</div>
                    </div>
                </div>


                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=이영어"><img src="${path}/resources/img/teacher_img/영어_강혜진.jpg"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 영어</div>
                        <div class="teacherTitle">이영어</div>
                    </div>
                </div>


                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=박영어"><img src="${path}/resources/img/teacher_img/영어_이용희_0.png"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 영어</div>
                        <div class="teacherTitle">박영어</div>
                    </div>
                </div>

                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=최영어"><img src="${path}/resources/img/teacher_img/영어_신이나_0.png"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 영어</div>
                        <div class="teacherTitle">최영어</div>
                    </div>
                </div>

            </div>
        </div> <%-- 영어 end --%>

        <%--       ---------------------------사회탐구--------------------------------- --%>
        <div class="container" id="socList" style="display: none">
            <div class="columns" style="margin: 0 auto; padding-top: 20px; width: 1200px">
                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=김사탐"><img src="${path}/resources/img/teacher_img/사회_강성빈.png"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 사탐</div>
                        <div class="teacherTitle">김사탐</div>
                    </div>
                </div>


                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=이사탐"><img src="${path}/resources/img/teacher_img/사회_문병일.png"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 사탐</div>
                        <div class="teacherTitle">이사탐</div>
                    </div>
                </div>


                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=박사탐"><img src="${path}/resources/img/teacher_img/사회_장진민.png"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 사탐</div>
                        <div class="teacherTitle">박사탐</div>
                    </div>
                </div>

                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=최사탐"><img src="${path}/resources/img/teacher_img/사회_주혜령_0.png"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 사탐</div>
                        <div class="teacherTitle">최사탐</div>
                    </div>
                </div>

            </div>

        </div> <%-- 사회탐구 end --%>

        <%--       ---------------------------한국사 --------------------------------- --%>
        <div class="container" id="hisList" style="display: none">
            <div class="columns" style="margin: 0 auto; padding-top: 20px; width: 1200px">
                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=김국사"><img src="${path}/resources/img/teacher_img/한국사_김윤숙.jpg"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 국사</div>
                        <div class="teacherTitle">김국사</div>
                    </div>
                </div>


                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=이국사"><img src="${path}/resources/img/teacher_img/370_장호영_Img13.png"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 국사</div>
                        <div class="teacherTitle">이국사</div>
                    </div>
                </div>


                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=박국사"><img src="${path}/resources/img/teacher_img/405_최재희_Img13.png"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 국사</div>
                        <div class="teacherTitle">박국사</div>
                    </div>
                </div>

                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=최국사"><img src="${path}/resources/img/teacher_img/401_김도형_img13.png"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 국사</div>
                        <div class="teacherTitle">최국사</div>
                    </div>
                </div>

            </div>
        </div> <%-- 한국사 end --%>

        <%--       ---------------------------과탐--------------------------------- --%>
        <div class="container" id="sciList" style="display: none">
            <div class="columns" style="margin: 0 auto; padding-top: 20px; width: 1200px">
                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=김과탐"><img src="${path}/resources/img/teacher_img/과학_김샛별.jpg"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 과탐</div>
                        <div class="teacherTitle">김과탐</div>
                    </div>
                </div>


                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=이과탐"><img src="${path}/resources/img/teacher_img/과학_박남식.jpg"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 과탐</div>
                        <div class="teacherTitle">이과탐</div>
                    </div>
                </div>


                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=박과탐"><img src="${path}/resources/img/teacher_img/과학_박인수.jpg"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 과탐</div>
                        <div class="teacherTitle">박과탐</div>
                    </div>
                </div>

                <div class="teacherCard">
                    <div class="teacherImage"><a href="${path}/instructor/instructorDetail.do?teacherName=최과탐"><img src="${path}/resources/img/teacher_img/과학_양진석.png"/></a></div>
                    <div class="teacherInfo">
                        <div class="teacherCate">이해가 잘되는 과탐</div>
                        <div class="teacherTitle">최과탐</div>
                    </div>
                </div>

            </div>
        </div> <%-- 과탐 end --%>




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