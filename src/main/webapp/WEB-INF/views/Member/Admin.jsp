<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <table class="table table-striped table-hover text-center" name="admin">
            <tr>
                <th>id</th>
                <th>Name</th>
                <th>email</th>
                <th>Password</th>
                <th>Mobile</th>
                <th>삭제</th>
            </tr>
            <c:forEach items="${member}" var="member">
                <form action="/member/admin" name="memberdelete"></form>
                <tr>
                    <td>${member.id}</td>
                    <td>${member.memberName}</td>
                    <td>${member.memberEmail}</td>
                    <td>${member.memberPassword}</td>
                    <td>${member.memberMobile}</td>
                    <td><input type="button" class="btn btn-danger" value="삭제" onclick="deleteMember()"></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
<script>
    const deleteMember = () => {
      document.memberdelete.submit()
    }
</script>
</html>
