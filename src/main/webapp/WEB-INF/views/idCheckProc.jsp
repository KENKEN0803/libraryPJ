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
<h3> 아이디 중복확인 결과 </h3>
<%
	String mem_id=request.getParameter("mem_id").trim();
	int cnt=(int)request.getAttribute("count");
	System.out.println(cnt);
	out.println("입력 ID : <strong>"+mem_id+"</strong>");
	if(cnt==0){
		out.println("<p>사용 가능한 아이디 입니다</p>");
		out.println("<a href='javascript:apply(\""+mem_id+"\")'>[적용]</a>");
	}else{
		out.println("<p style='color:red'>해당 아이디는 사용할 수 없습니다.</p>");
	}
%>
<hr>
<a href="javascript:history.back()">[다시검색]</a>
&nbsp;&nbsp;
<a href="javascript:window.close()">[창 닫기]</a>
</div>
	<script type="text/javascript">
	function apply(mem_id){
		opener.document.regForm.mem_id.value=mem_id;
		window.close();
	}
	</script>
</body>
</html>