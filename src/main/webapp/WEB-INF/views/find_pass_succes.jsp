<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div>
    <%@include file="head.jsp" %>
</div>
<div style="margin: auto; text-align: center;">
    <h1>비밀번호는 ${mem_pass} 입니다.</h1>
    <a href="/">로그인 하기</a>
</div>
<div>
    <%@include file="footer.jsp" %>
</div>
</body>
</html>