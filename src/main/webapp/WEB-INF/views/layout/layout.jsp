<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-04
  Time: 오후 3:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">

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

        <div class="col-md-3 text-end">
           <c:choose>
            <c:when test="${sessionScope.member.memberEmail != null}">
                <span>${sessionScope.member.memberName}님</span>
                <button type="button" class="btn btn-outline-primary me-2" onclick="logout()" >Logout</button>
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
</script>
</html>
