<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Pack.memberBean" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div style="text-align:center;">
<h3> ���̵� �ߺ�Ȯ�� ��� </h3>
<%
	String mem_id=request.getParameter("mem_id").trim();
	int cnt=(int)request.getAttribute("count");
	System.out.println(cnt);
	out.println("�Է� ID : <strong>"+mem_id+"</strong>");
	if(cnt==0){
		out.println("<p>��� ������ ���̵� �Դϴ�</p>");
		out.println("<a href='javascript:apply(\""+mem_id+"\")'>[����]</a>");
	}else{
		out.println("<p style='color:red'>�ش� ���̵�� ����� �� �����ϴ�.</p>");
	}
%>
<hr>
<a href="javascript:history.back()">[�ٽð˻�]</a>
&nbsp;&nbsp;
<a href="javascript:window.close()">[â �ݱ�]</a>
</div>
	<script type="text/javascript">
	function apply(mem_id){
		opener.document.regForm.mem_id.value=mem_id;
		window.close();
	}
	</script>
</body>
</html>