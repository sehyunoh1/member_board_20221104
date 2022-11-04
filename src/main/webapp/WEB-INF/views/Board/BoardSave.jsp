
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글 작성</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <form action="/board/save" name="saveform">
            <input type="text" name="boardWriter" value="${sessionScope.member.memberEmail}">
            <input type="text" name="boardTitle" placeholder="제목을 입력해주세요.">
            <text-area name="boardContents" placeholer="300자 이내로 입력해주세요."></text-area>
            <input type="submit" value="작성" class="btn btn-primary">
        </form>
    </div>
</body>
</html>
