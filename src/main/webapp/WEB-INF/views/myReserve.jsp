<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width"/>
    <title>나의 예약 현황</title>
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
            <th> No.</th>
            <th> 도서명</th>
            <th> 저자</th>
            <th> 예약일</th>
            <th> 순위</th>
            <th> 취소</th>
        </tr>
        </thead>
        <c:if test="${res.size()==0}">예약정보가 없습니다</c:if>
        <c:if test="${res.size()!=0}">
        <% int rownum = 1;%>
        <c:forEach items="${res}" var="list">
            <tr>
                <td>
                    <%=rownum%>
                    <%rownum++;%>
                </td>
                <td>
                        ${list.b_name}
                </td>
                <td>
                        ${list.b_author}
                </td>
                <td>
                        ${list.reserve_date}
                </td>
                <td>
                        ${list.b_rank}
                </td>
                <td>
                    <form onsubmit="return confirm('예약을 취소하시겠습니까?');" method=Post
                          action="reserveDelete">
                        <input type="hidden" name="b_id" value="${list.b_id}">
                        <input type="submit" value="취소">
                    </form>
                </td>
            </tr>
        </c:forEach>
        <hr/>
    </table>
    </c:if>
    <hr/>
</div>
<!-- =========================FOOOTER =============================== -->
<%@include file="footer.jsp" %>


</body>
<script>

</script>
</html>
