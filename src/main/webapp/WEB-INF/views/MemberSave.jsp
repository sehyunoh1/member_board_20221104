
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
    <div class="container mt-5">
      <form action="/member/save" method="post"  name="saveform" enctype="multipart/form-data">
        <input type="text" id="memberEmail" name="memberEmail" class="form-control" placeholder="이메일을 입력하세요." onblur="EmailCk()">
        <span id="emailCk"></span>
        <input type="text" id="memberPassword" name="memberPassword" class="form-control" placeholder="비밀번호를 입력하세요" >
          <span id="passwordCk"></span>
          <input type="text" id="memberName" name="memberName" class="form-control" placeholder="이름을입력하세요">
          <span id="nameCk"></span>
        <input type="text" id="memberMobile" name="memberMobile" class="form-control" placeholder="전화번호를 입력하세요">
          <input type="file" class="form-control" name="memberFile">
        <input type="button" id="save" name="save" class="btn btn-success" value="회원가입하기" onclick="saveCk()" >
      </form>
    </div>
</body>
<script>
    const saveCk = () => { // 필수입력사항 체크
    if(document.saveform.memberEmail.value =="") {
       emailCk.innerHTML = "필수입력사항입니다."
       emailCk.style.color="red";
    }else if(document.saveform.memberPassword.value == ""){
        passwordCk.innerHTML = "필수입력사항입니다."
        passwordCk.style.color= "red";
    }else if(document.saveform.memberName.value == ""){
        nameCk.innerHTML = "필수입력사항입니다."
        nameCk.style.color = "red";
    } else {
    document.saveform.submit()
    }
}
    const EmailCk = () =>  { // 이메일 중복 체크
      const memberEmail = document.getElementById("memberEmail").value;
      const emailCk = document.getElementById("emailCk");
      $.ajax({
          type:"post",
          url:"/member/duplicate",
          data:{memberEmail,memberEmail },
          dataType:"text",
          success:function (result){
              if(result =="ok"){
                emailCk.innerHTML="사용가능한 이메일입니다."
                emailCk.style.color="green";
              }else if (result =="no"){
                emailCk.innerHTML="이미 사용중인 이메일입니다.";
                emailCk.style.color="red";
              }
          }

      })
    }
</script>
</html>
