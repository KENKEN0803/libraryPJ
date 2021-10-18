<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body align=center>
<script type="text/javascript">
    function func() {
        opener.location.reload();
        window.close();
    }
</script>
<% List<Map<String, Object>> mem = (List<Map<String, Object>>) request.getAttribute("mem");%>
<form method="post" action="mem_updating">
    ID <input type="text" readonly name="mem_id" value="<%=mem.get(0).get("mem_id")%>"></input>
    <p>
        이름 <input type="text" name="mem_name" value="<%=mem.get(0).get("mem_name")%>"></input>
    <p>
        주민번호 <input type="text" disabled name="mem_reg" value="<%=mem.get(0).get("mem_reg")%>"></input>
    <p>
        휴대폰 번호 <input type="text" name="mem_tel" value="<%=mem.get(0).get("mem_tel")%>"></input>
    <p>
        연체 종료 날짜 <input type="text" name="mem_val_date" value="<%=mem.get(0).get("mem_val_date")%>"></input>
    <p>
        대출 횟수 <input type="text" name="mem_cnt" value="<%=mem.get(0).get("mem_cnt")%>"></input>
    <p>
        <input type="submit" value="수정"></input>
        <input type="button" onclick="func()" value="닫기"></input>
</form>
</body>
</html>