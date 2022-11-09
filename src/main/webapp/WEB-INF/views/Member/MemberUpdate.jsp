
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수정</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/layout.jsp" flush="false"></jsp:include>
<div class="container mt-5">
    <form action="/member/update" method="post" name="updateform">
        <input type="hidden" value="${sessionScope.member.id}" class="form-control" name="id" readonly>
        이름<input type="text" value="${sessionScope.member.memberName}" class="form-control" id="memberName" name="memberName">
        이메일<input type="text" value="${sessionScope.member.memberEmail}" class="form-control" id="memberEmail" name="memberEmail" >
        전화번호<input type="text" value="${sessionScope.member.memberMobile}" class="form-control" id="memberMobile" name="memberMobile" onblur="MobileCk()">
        <span id="mobileCk"></span><br>
        비밀번호를 입력해주세요.<input type="password" vaule="비밀번호" class="form-control" id="memberPassword" name="memberPassword">
        <input type="button" value="수정하기" class="btn btn-primary" onclick="update()">
    </form>
</div>
</body>
<script>
    const update = () => {
      const pass=document.getElementById("memberPassword").value;
      const passDB='${sessionScope.member.memberPassword}';
      if(pass == passDB){
          document.updateform.submit();
          alert("수정이 완료되었습니다.")
      }else{
          alert("비밀번호를 확인해주세요.")
      }
    }
    const MobileCk = () => {
        const Mobile= document.getElementById("memberMobile").value;
        const exp = /^\d{3}-\d{4}-\d{4}$/
        console.log('${sessionScope.member}');
        if(Mobile.match(exp)){
            mobileCk.innerHTML="사용가능한 전화번호입니다."
            mobileCk.style.color="green";
        }else if(Mobile == ""){
            mobileCk.innerHTML="필수입력사항입니다."
            mobileCk.style.color="red";
        }else {
            mobileCk.innerHTML="전화번호 형식을 확인해 주세요."
            mobileCk.style.color="red";
        }
    }
</script>
</html>
