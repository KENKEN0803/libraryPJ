<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>가상 admin Page</title>
</head>
<body>
<script type="text/javascript">
    function openReturn() {
        window.open("/returnPage?mem_id=we", "", "width=582,height=360");
    }

    function openRent() {
        window.open("/rentPage?mem_id=we", "", "width=582,height=360");
    }
</script>

<h1>여기는 가상 admin page 대여관리 메뉴 입니다</h1>
회원아이디 : we
<input type="hidden" value="we" name="mem_id">
<input type="button" value="반납" onclick="openReturn()">
<input type="button" value="대출" onclick="openRent()">
</body>
</html>