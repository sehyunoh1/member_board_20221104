
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
      <form action="/member/save" method="post"  name="saveform">
        <input type="text" id="memberEmail" name="memberEmail" class="form-control" placeholder="이름을 입력하세요.">
        <input type="text" id="memberPassword" name="memberPassword" class="form-control" placeholder="비밀번호를 입력하세요">
        <input type="text" id="memberName" name="memberName" class="form-control" placeholder="이름을입력하세요">
        <input type="text" id="memberMobile" name="memberMobile" class="form-control" placeholder="전화번호를 입력하세요">
        <input type="submit" id="save" name="save" class="btn btn-success" value="회원가입하기" onclick="save()">
      </form>
    </div>
</body>
<script>const save = () => {

}
</script>
</html>
