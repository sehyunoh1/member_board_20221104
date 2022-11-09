<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

</head>
<body>
<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
        </a>

        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
            <li><a href="/" class="nav-link px-2 link-secondary">Home</a></li>
            <li><a href="/board/" class="nav-link px-2 link-dark">글 목록</a></li>

        </ul>
        <form action="/board/search" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
            <div class="input-group">
                <select name="type" class="form-select">
                    <option value="boardTitle" selected>제목</option>
                    <option value="boardWriter">작성자</option>
                </select>
                <input type="search" name ="q" class="form-control form-control text-bg-dark" placeholder="Search"
                       aria-label="Search">
                <button class="btn btn-outline-light"><i class="bi bi-search"></i></button>
            </div>
        </form>
        <div class="col-md-3 text-end">
           <c:choose>
            <c:when test="${sessionScope.member.memberEmail != null}">
                <span>${sessionScope.member.memberName}님</span>
                <button type="button" class="btn btn-outline-primary me-2" onclick="logout()" >Logout</button>
                <button type="button" class="btn btn-outline-primary me-2" onclick="memberDetail()">마이페이지</button>
            </c:when>
            <c:otherwise>
            <button type="button" class="btn btn-outline-primary me-2" onclick="login()" >Login</button>
            <button type="button" class="btn btn-primary" onclick="save()">Sign-up</button>
            </c:otherwise>
           </c:choose>
        </div>
    </header>
</div>
</body>
<script>
    const logout = () => {
      location.href="/logout";
    }
    const login = () => {
      location.href="/member/login";
    }
    const save = () => {
      location.href="/member/save";
    }
    const memberDetail = () => {
      location.href="/member/member?id="+${sessionScope.member.id};
    }
</script>
</html>
