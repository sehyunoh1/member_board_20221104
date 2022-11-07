<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글 목록</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/layout.jsp" flush="false"></jsp:include>
    <div class="container">
        <table class="table table-striped table-hover text-center" >
            <tr>
                <th>글 번호</th>
                <th>작성자</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성시간</th>
                <th>조회수</th>
            </tr>
        <c:forEach items="${boardList}" var="boardList">
            <tr>
                <td>${boardList.boardId}</td>
                <td>${boardList.boardWriter}</td>
                <td><a href="/board?boardId=${boardList.boardId}">${boardList.boardTitle}</a></td>
                <td>${boardList.boardContents}</td>
                <td><fmt:formatDate value="${boarList.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                <td>${boardList.boardHits}</td>
            </tr>
        </c:forEach>

        </table>
    </div>
    <div class="container">
        <button class="btn btn-primary" onclick="saveFn()">글작성</button>
    </div>
</body>
<script>
    const saveFn = () => {
        location.href="/board/save";
    }
</script>
</html>
