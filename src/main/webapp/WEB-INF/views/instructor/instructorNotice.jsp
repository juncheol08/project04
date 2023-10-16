<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path14" value="${pageContext.request.contextPath }"/>

<html>
<head>
    <title>${teacherName} 선생님</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="${path14}/resources/css/teacherPage/baseLayout.css"/>
    <link rel="stylesheet" href="${path14}/resources/css/teacherPage/sidebar.css"/>
    <link rel="stylesheet" href="${path14}/resources/css/teacherPage/validateUser.css"/>
    <link rel="stylesheet" href="${path14}/resources/css/teacherPage/myPageindex.css"/>


</head>
<body>
<div id="wrap">
    <jsp:include page="../include/header.jsp"></jsp:include>

    <div id="container">
        <div class="mypage-base">
            <%@ include file="./sidebar.jsp" %>
            <article class="my-page">
                <main class="container__inner">
                    <div>

                        <table id="myTable">
                            <thead>
                            <tr>
                                <th width="80">No</th>
                                <th>Title</th>
                                <th width="120">RegDate</th>
                                <th width="100">Visited</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${teacherNotices}" var="board" varStatus="status">
                                <tr>
                                    <td>${status.count }</td>
                                    <td><a href="${path14}/instructor/instructorNoticeDetail.do?no=${board.no }&teacherName=${teacherName}">${board.title }</a></td>
                                    <td>
                                        <fmt:parseDate value="${board.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                        <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                                    </td>
                                    <td>${board.cnt }</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <c:if test='${sid eq instructor.teacherid}'>
                            <div class="button-group">
                                <a class="button is-link is-outlined" href="${path}/instructor/instructorNoticeAdd.do">글쓰기</a>
                            </div>
                        </c:if>
                        <script>
                            $(document).ready( function () {
                                $('#myTable').DataTable({
                                    pageLength : 10,
                                    order: [[0, 'desc']], // 0번째 컬럼을 기준으로 내림차순 정렬
                                    info: false,
                                    dom: 't<f>p',
                                    language: {
                                        emptyTable: '등록된 글이 없습니다.'
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




                    </div>

                </main>
            </article>


        </div>

    </div>
    <footer id="footer" class="footer-nav row expanded collapse">
        <!-- 푸터 부분 인클루드 -->
        <jsp:include page="../include/footer.jsp"></jsp:include>
    </footer>
</div>

<script
        src="https://kit.fontawesome.com/b17793764c.js"
        crossorigin="anonymous"
></script>


</body>
</html>