<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/searchResult" method="get">
    <select name="type">
        <option value="combine">통합 검색</option>
        <option value="name"> 제 목</option>
        <option value="author"> 저 자</option>
        <option value="publisher"> 출 판 사</option>
        <option value="ISBN"> I S B N</option>
        <option value="id">책 I D</option>
    </select>
    <input type="text" name="inputValue">
    <button type="submit">전송</button>
</form>
</body>
</html>
