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
                <td><fmt:formatDate value="${boardList.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                <td>${boardList.boardHits}</td>
            </tr>
        </c:forEach>

        </table>
    </div>
    <div class="container">
        <button class="btn btn-primary" onclick="saveFn()">글작성</button>
    </div>

    <div class="container">
        <ul class="pagination justify-content-center">
            <c:choose>
              <c:when test="${paging.page<=1}">
                <li class="page-item disabled">
                    <a class="page-link">이전</a>
                </li>
              </c:when>
              <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/?page=${paging.page-1}">[이전]</a>
                </li>
              </c:otherwise>
            </c:choose>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                <c:choose>
                    <c:when test="${i eq paging.page}">
                        <li class="page-item active">
                            <a class="page-link">${i}</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item active">
                            <a href="/board/?page=${i}" class="page-link">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${paging.page>=paging.maxPage}">
                    <li class="page-item disabled">
                        <a class="page-link">[다음]</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/?page=${paging.page+1}">[다음]</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</body>
<script>
    const saveFn = () => {
        location.href="/board/save";
    }
</script>
</html>
