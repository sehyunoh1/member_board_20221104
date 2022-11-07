
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>초기화면</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
   <div class="container">
    <button class="btn btn-success" onclick="saveFn()">회원가입</button>
    <button class="btn btn-success" onclick="login()">로그인</button>
    <button class="btn btn-danger" onclick="admin()">관리자</button>
   </div>
</body>
<script>
    const saveFn = () => {
        location.href="/member/save";
    }
    const login = () => {
      location.href="/member/login";
    }
    const admin =() => {
        location.href="/member/admin";
    }
</script>
</html>
