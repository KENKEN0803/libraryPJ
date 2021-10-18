<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="Pack.memberBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
		<%@include file="head.jsp"%>
	</div>
	<div style="margin: auto; text-align: center;">
	<h1>아이디는 ${mem_id} 입니다.</h1>
	<a href="/login?mem_id=${mem_id}">로그인 하기</a>
	<a href="/findpass">비밀번호 찾기</a>
	</div>
	<div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>