
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글 수정</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/layout.jsp" flush="false"></jsp:include>
<div class="container">
    <form action="/board/update" method="post" name="updateform">
      글번호  <input type="text" name="boardId" class="form-control" value="${board.boardId}" readonly>
       작성자 <input type="text" name="boardWriter" class="form-control" value="${board.boardWriter}" readonly>
       제목 <input type="text" name="boardTitle" class="form-control" value="${board.boardTitle}" >
       내용  <textarea name="boardContents" id="boardContents" value="${board.boardContents}" class="form-control" cols="30" row="100"></textarea>
        <input type="button" value="수정하기" class="btn btn-primary" onclick="update()">
    </form>
</div>
</body>
<script>
    const update = () => {
      document.updateform.submit()
    }
</script>
</html>
