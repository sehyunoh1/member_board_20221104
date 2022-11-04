
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>초기화면</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
   <div class="container">
    <button class="btn btn-success" onclick="save()">회원가입</button>
   </div>
</body>
<script>
    const save = () => {

        location="/member/save";
    }
</script>
</html>
