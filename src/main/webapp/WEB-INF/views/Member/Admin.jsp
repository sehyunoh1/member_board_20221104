<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/layout.jsp" flush="false"></jsp:include>
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

                <tr>
                    <td>${member.id}</td>
                    <td>${member.memberName}</td>
                    <td>${member.memberEmail}</td>
                    <td>${member.memberPassword}</td>
                    <td>${member.memberMobile}</td>
                    <td>
                        <form action="/member/admin/delete" name="memberdelete" method="get">
                        <submit class="btn btn-danger" onclick="deleteFn('${member.id}')">삭제</submit>
<%--                    <input type="button" class="btn btn-danger" onclick="deleteMember()" value="삭제">--%>
                        </form>
                    </td>
                </tr>

            </c:forEach>
        </table>
    </div>
</body>
<script>
    const deleteFn = (clickedid) => {
        console.log(clickedid)
        location.href="/member/admin/delete?id="+clickedid;

    }
</script>
</html>
