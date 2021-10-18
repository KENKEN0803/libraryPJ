<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Pack.memberBean" %>
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
    <% mem_id = request.getParameter("mem_id"); %>
    <h1>
        <%=request.getParameter("mem_id")%>님 가입을 축하드립니다
    </h1>
    <a href="/?mem_id=<%=mem_id%>">로그인 하기</a>
</div>
<div>
    <%@include file="footer.jsp" %>
</div>
</body>
</html>