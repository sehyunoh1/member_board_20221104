
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글 목록</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/layout.jsp" flush="false"></jsp:include>
    <div class="container">

    </div>
    <div class="container">
        <button class="btn btn-primary" onclick="save()">글작성</button>
    </div>
</body>
<script>
    const save = () => {
      location="/board/save";
    }
</script>
</html>
