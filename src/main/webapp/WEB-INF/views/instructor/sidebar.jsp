<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path4" value="${pageContext.request.contextPath }"/>

<nav style="margin-right: 0">
    <div class="sidebar">
        <div class="header" style="text-align: center;"><a href="${path4}/instructor/instructorDetail.do?teacherName=${teacherName}">${teacherName} 선생님</a></div>
        <ul>
            <li>
                <a href="${path4}/instructor/instructorLecture.do?teacherName=${teacherName }" >
                    강의 목록
                </a>
            </li>
            <li>
                <a href="${path4}/instructor/instructorNotice.do?teacherName=${teacherName }" >
                    공지
                </a>
            </li>
            <li>
                <a href="${path4}/instructor/instructorQNA.do?teacherName=${teacherName }">
                    Q&A
                </a>
            </li>
            <li>
                <a href="${path4}/instructor/instructorFile.do?teacherName=${teacherName }">
                    자료실
                </a>
            </li>
            <li>
                <a href="${path4}/instructor/instructorReview.do?teacherName=${teacherName }">
                    후기
                </a>
            </li>
        </ul>

    </div>
</nav>