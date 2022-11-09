
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/layout.jsp" flush="false"></jsp:include>
  <div class="container">
    <form action="/member/login" method="post" name="loginform">
      <input type="text" name="memberEmail" id="memberEmail" class="form-control">
      <input type="password" name="memberPassword" id="memberPassword" class="form-control">
      <input type="button" class="btn btn-primary" onclick="login1()" value="로그인">
    </form>
  </div>
</body>
<script>
  const login1 = () => {
    if(document.getElementById("memberEmail").value == "" || document.getElementById("memberPassword").value == ""){
      alert("아이디 및 비밀번호를 입력해 주세요.")
    }else {
      document.loginform.submit();
    }
  }
</script>
</html>
