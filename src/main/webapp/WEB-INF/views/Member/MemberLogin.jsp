
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
  <div class="container">
    <form action="/member/login" method="post" name="loginform">
      <input type="text" name="memberEmail" id="memberEamil" class="form-control">
      <input type="text" name="memberPassword" id="memberPassword" class="form-control">
      <input type="button" class="btn btn-primary" onclick="login()" value="로그인">
    </form>
  </div>
</body>
<script>
  const login = () => {
    document.loginform.submit();
  }
</script>
</html>