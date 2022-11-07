<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${board.boardTitle}</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/layout.jsp" flush="false"></jsp:include>
<div class="container" id="detail">
    <table class="table table-hover">
        <tr>
            <th>글 번호</th>
            <td>${board.boardId}</td>
        </tr>
        <tr>
            <th>글 제목</th>
            <td>${board.boardTitle}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${board.boardWriter}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${board.boardContents}</td>
        </tr>
        <tr>
            <th>작성 시간</th>
            <td>${board.boardCreatedDate}</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${board.boardHits}</td>
        </tr>
        <c:if test="${board.storedName=!null}">
            <tr>
                <th>첨부파일</th>
                <td><img src="${pageContext.request.contextPath}/upload/${board.storedName}" alt="" width="100" height="100">
                </td>
            </tr>
        </c:if>
    </table>
</div>
</body>
</html>
