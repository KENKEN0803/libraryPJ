<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width"/>
    <title>도서 관리</title>

</head>
<body>
<div class="total">

    <%@include file="headAdmin.jsp" %>
    <!-- ================================================================== -->
    <div class="row">
        <form action="/M_searchResult" method="get">
            <div style="display:inline-block;">
                <select name="type">
                    <option value="combine">통합 검색</option>
                    <option value="name">제 목</option>
                    <option value="author">저 자</option>
                    <option value="publisher">출 판 사</option>
                    <option value="ISBN">I S B N</option>
                </select>
            </div>
            <div style="display:inline-block;">
                <input type="text" name="inputValue">
            </div>
            <div style="display:inline-block;">
                <button type="submit">전송</button>
            </div>
        </form>
        <div style="text-align:center;">
            <input type="button" value="도서추가" onclick="location.href='/bookAdd'"
                   style="border:0; background-color: rgb(118, 175, 107); color: white; width: 200px; height: 40px;">
        </div>
    </div>
    <!-- =========================FOOOTER =============================== -->
    <%@include file="footer.jsp" %>
</div>
</body>
</html>