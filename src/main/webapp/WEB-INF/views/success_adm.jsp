<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Pack.adminBean" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 성공</title>
</head>
<body>
<div>
    <%@include file="headAdmin.jsp" %>
</div>
<div style="margin: auto; text-align: center;">
    <%-- 		<%
            String ad_id = (String) request.getParameter("Ad_id");
            session.setAttribute("admin", ad_id);
            session.setAttribute("adm_key", 1);
            %> --%>
    <div>
        관리자 <%=session.getAttribute("admin")%>님 로그인 성공하셨습니다.
    </div>
    <br/> <a href="/">로그인 화면으로 돌아가기</a>
</div>
<div>
    <%@include file="footer.jsp" %>
</div>
</body>
</html>