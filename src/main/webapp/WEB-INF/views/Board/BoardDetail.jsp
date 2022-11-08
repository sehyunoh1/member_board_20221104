<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${board.boardTitle}</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <style>
        #comment_write{
            width: 600px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/layout.jsp" flush="false"></jsp:include>
<div class="container" id="detail">
    <table class="table table-hover">
        <tr>
            <th>글 번호</th>
            <td>${board.boardId}</td>
        </tr>
        <tr>
            <th>글 제목</th>
            <td>${board.boardTitle}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${board.boardWriter}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${board.boardContents}</td>
        </tr>
        <tr>
            <th>작성 시간</th>
            <td>${board.boardCreatedDate}</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${board.boardHits}</td>
        </tr>
        <c:if test="${board.storedName=!null}">
            <tr>
                <th>첨부파일</th>
                <td><img src="${pageContext.request.contextPath}/upload/${board.storedName}" alt="" width="100" height="100">
                </td>
            </tr>
        </c:if>
        

    </table>
        <button class="btn btn-secondary" onclick="listfn()">목록</button>
    <c:if test="${sessionScope.member.id == board.memberId}">
        <button class="btn btn-primary" onclick="updatefn()">수정</button>
        <button class="btn btn-danger" onclick="deletefn()">삭제</button>
    </c:if>
</div>
<c:if test="${sessionScope.member.memberName != null}">
<div class="container mt-5" id="comment_write">
    <div class="form-floating">
        <input type="text" name="commentWriter" value="${sessionScope.member.memberName}" class="form-control" id="commentWriter" readonly>
        <label for="commentWriter">작성자</label>
    </div>
    <div class="form-floating">
        <input type="text" name="commentContents" class="form-control" id="commentContents" >
        <label for="commentContents">내용</label>
    </div>
            <button id="commentWrite" class="btn btn-secondary" onclick="commentWrite()">댓글작성</button>

</div>
</c:if>
</body>
<div class="container mt-5" id="comment-list">
    <table class="table">
        <tr>
            <th>댓글 번호</th>
            <th>작성자</th>
            <th>내용</th>
            <th>작성시간</th>
        </tr>
        <c:forEach items="${commentList}" var="comment">
            <tr>
                <td>${comment.commentId}</td>
                <td>${comment.commentWriter}</td>
                <td>${comment.commentContents}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${comment.commentCreatedDate}"></fmt:formatDate></td>
            </tr>
        </c:forEach>
    </table>
</div>
<script>
    const listfn = () => {
        const page='${paging.page}';
        location.href="/board/?page="+page;
    }
    const updatefn = () => {
        const boardId='${board.boardId}';
        location.href="/board/update?boardId="+boardId;
    }
    const deletefn = () => {
        const boardId='${board.boardId}';
        location.href="/board/delete?boardId="+boardId;
    }
    const commentWrite = () => {
      const Writer=document.getElementById("commentWriter").value;
      const Contents=document.getElementById("commentContents").value;
      const boardId='${board.boardId}';
      console.log(Writer,Contents,boardId);
    //  if(Writer == null){
    //     alert("로그인 후 이용해주세요.")
    //     location.href="/member/login"
    // }else if(Contents == null){
    //     alert("최소 1자 이상 입력해야합니다.")
    // }
    $.ajax({
        type:"post",
        url:"/comment/save",
        data:{
            commentWriter : Writer,
            commentContents : Contents,
            boardId: boardId,
        },
        dataType:"json",
        success: function (commentList){

                let output = "<table class='table'>"
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for (let i in commentList) {
                    output += "<tr>";
                    output += "<td>" + commentList[i].commentId + "</td>"
                    output += "<td>" + commentList[i].commentWriter + "</td>"
                    output += "<td>" + commentList[i].commentContents + "</td>"
                    output += "<td>" + commentList[i].commentCreatedDate + "</td>"
                    output += "</tr>"
                }
                output += "</table>"
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentWriter').value = "";
                document.getElementById('commentContents').value = "";
        },
        error: function (){
            console.log("실패");
        }
    })
    }
    const writefail = () => {
      alert("최소 1자 이상 입력해야합니다.")
    }
</script>
</html>
