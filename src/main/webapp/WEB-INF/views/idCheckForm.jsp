<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="Pack.memberBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center;">
		<h3>���̵� �ߺ� Ȯ��</h3>
		<form method="post" action="/id_check" onsubmit="return blankCheck(this)">
		���̵� : <input type="text" name="mem_id" maxlength="15" autofocus oninput="idchCheck(this)" required> <input type="submit" value="�ߺ�Ȯ��">
		</form>
		<script type="text/javascript">
			function idchCheck(e) {
				e.value = e.value.replace(/[^A-Za-z0-9]/ig, '')
			}
		</script>
	</div>
</body>
</html>