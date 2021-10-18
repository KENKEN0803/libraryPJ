<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.table{
	width:80%;
	overflow:auto;
    height:600px;
    margin-left:10%;
	}
	.table table {
    width: 100%;
    border-collapse: collapse;
    border-left:0px;
    border-right:0px;
    border-bottom:0px;
  }
  .table table th {
      background: #EDFFED;
      position:sticky;
      top:0px;
    }
  .table th
  {
  	height:50px;
    padding: 10px;
  }
  .table td {
  	height:50px;
    padding: 10px;
    background: white;
    margin-left:5%;
    border-bottom:1px solid #EEEEEE;
  }
</style>
<body>
	<%@include file="headAdmin.jsp"%>
	<form method="post" action="mem_searching" style=" margin-top:1%; margin-bottom:1%;">
		<h4 style="float:left; margin-left:35%; ">회원 ID </h4>
		<input type="text" name="mem_id" placeholder="id" style="width:20%; height:40px; float:left; background-color:#eeeeee; border-radius:10px; margin-left:10px; margin-right:10px;"></input>
		<input type="submit" value="검색" style=" width:80px; height:40px; border-radius:10px; border:none; background-color:#eeeeee"></input>
	</form>
	<div class='table'>
	<table>
		<thead>
		  <tr>
		    <th>ID</th>
		    <th>이름</th>
		    <th>주민번호</th>
		    <th>휴대폰 번호</th>
		    <th>연체 종료 날짜</th>
		    <th>대출 횟수</th>
		    <th>수정</th>
		  </tr>
		<thead>
		<%
		List<Map<String, Object>> mem = (List<Map<String, Object>>)request.getAttribute("mem");
		for (Map<String, Object> item : mem) {
        	System.out.println(item.get("mem_id")+" aaa");
        	System.out.println("aaa");
        %>
		  <tr>
		    <td><%=item.get("mem_id")%></td>
		    <td><%=item.get("mem_name")%></td>
		    <td><%=item.get("mem_reg")%></td>
		    <td><%=item.get("mem_tel")%></td>
		    <td><%=item.get("mem_val_date")%></td>
		    <td><%=item.get("mem_cnt")%></td>
		    <td>
				<input type="button" onclick="window.open('mem_fix?mem_id=<%=item.get("mem_id")%>', 'pop01', 'top=100, left=500, width=500, height=600');" style="background-color:#036635; color:white; border:none; width:60px; height:30px; border-radius:10px;" value="수정"></input>
		  	</td>
		  </tr>
		<% } %>
	</table>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>