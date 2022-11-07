
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글 작성</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <form action="/board/save" name="saveform" method="post" enctype="multipart/form-data">
            <span>${sessionScope.member.memberId}</span>
            <input type="text" name="boardWriter" class="form-control" value="${sessionScope.member.memberEmail}" readonly>
            <input type="text" name="boardTitle" id="boardTitle" placeholder="제목을 입력해주세요."class="form-control">
            <textarea name="boardContents" id="boardContents" placeholer="300자 이내로 입력해주세요." class="form-control" cols="30" row="10"></textarea>
            <input type="file" class="form-control" name="boardfile">
            <input type="button" value="작성" class="btn btn-primary" onclick="save()">
        </form>
    </div>
</body>
<script>
    const save = () => {
      if(document.getElementById("boardTitle").value ==""){
        alert("제목을 입력하세요")
      }else if(document.getElementById("boardContents").value==""){
          alert("글 내용을 입력해주세요.")
      }else {
          document.saveform.submit();
      }
    }
</script>
</html>
