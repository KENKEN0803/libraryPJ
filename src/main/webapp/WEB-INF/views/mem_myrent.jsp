<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF8">
    <title>Insert title here</title>
</head>
<style>
    .table table {
        width: 100%;
        border-collapse: collapse;
        border-left: 0px;
        border-right: 0px;
        border-bottom: 0px;
    }

    .table table th {
        background: #EDFFED;
    }

    .table th {
        height: 50px;
        padding: 10px;
    }

    .table td {
        height: 50px;
        padding: 10px;
        background: white;
        margin-left: 5%;
        border-bottom: 1px solid #;
    }
</style>
<body>
<%@include file="head.jsp" %>
<div class="table" style="margin-left:10%; margin-right:10%;">
    <table>
        <thead>
        <tr>
            <th>No.</th>
            <th>BOOK ID</th>
            <th>책 이름</th>
            <th>책 저자</th>
            <th>출판사</th>
            <th>빌린 날짜</th>
            <th>반납 예정일</th>
        </tr>
        </thead>
        <%
            List<Map<String, Object>> mem = (List<Map<String, Object>>) request.getAttribute("mem");
            int index = 1;
            for (Map<String, Object> item : mem) {
        %>
        <tr>
            <td><%=index++%>
            </td>
            <td><%=item.get("b_id") %>
            </td>
            <td><%=item.get("b_name")%>
            </td>
            <td><%=item.get("b_author")%>
            </td>
            <td><%=item.get("b_publisher")%>
            </td>
            <td><%=item.get("rent_date")%>
            </td>
            <td><%=item.get("return_date")%>
            </td>
            </td>
        </tr>
        <% } %>
    </table>
</div>

<%@include file="footer.jsp" %>
</body>
</html>