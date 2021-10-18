<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>도서 정보 - 관리자</title>
</head>
<body>
<%@include file="headAdmin.jsp" %>

<%
    int rowCnt = 1;
    List<Map<String, Object>> mem = (List<Map<String, Object>>) request.getAttribute("total");
%>
<h1 align="center" style="margin-top: 10px">전체 도서 현황</h1>
<hr/>
<table class="table" style="margin: auto">
    <caption>전체 도서 <%=mem.get(0).get("count")%>권 중 ${res.size()}권 대여중</caption>
    <thead>
    <tr>
        <th scope="col">순번</th>
        <th scope="col">책 ID</th>
        <th scope="col">책 제목</th>
        <th scope="col">대여일</th>
        <th scope="col">반납일</th>
        <th scope="col">대여자</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${res}" var="list">
        <tr>
            <th scope="row"><%=rowCnt++%>
            </th>
            <td>${list.book_b_id}</td>
            <td>${list.b_name}</td>
            <td>${list.rent_date}</td>
            <td>${list.return_date}</td>
            <td>${list.member_mem_id}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%@include file="footer.jsp" %>
</body>
</html>
