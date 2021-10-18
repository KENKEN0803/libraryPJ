
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Pack.memberBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>

	<%
	String mem_id = (String) request.getParameter("mem_id");
	session.setAttribute("member", mem_id);
	session.setAttribute("adm_key", 0);
	%>

	<div><%=session.getAttribute("member")%>님 로그인 성공하셨습니다.
	</div>
	<br />
	<%
		memberBean m=new memberBean();
		m.setMem_id((String)session.getAttribute("member"));
		//System.out.println(model.getAttribute("mem_pass"));
	%>
	<h1>회원 정보수정</h1>
	<fieldset>
		<form method=POST action="mem_update">
			<label>아이디</label><input type="text" name="mem_id" id="mem_id" value="<%=session.getAttribute("member")%>" readonly/><br> 
				<label>패스워드</label><input type="text" name="mem_pass" value="${m.get(0).mem_pass}"><Br>
				<label>이름</label><input type="text" name="mem_name" id="mem_name" required value="${m.get(0).getMem_name()}" onchange="nameCheck(this)" required><Br> 
				<label>주민등록번호</label>	<input type="text" name="mem_reg" maxlength="13" value="${m.get(0).getMem_reg()}" readonly/><Br>
				<label>핸드폰번호</label><input type="text" name="mem_tel" value="${m.get(0).getMem_tel()}" required oninput="numCheck(this)"><Br> 
				<input type="submit" value="수정">
			<button>
		</form>
		  <a href="/logout">로그아웃</a>
	<script type="text/javascript">
	function nameCheck(obj)  {
		var regExp=/^[가-힣]+$/;
		//^ : 문자열 시작, $ : 문자열 끝, + 한번이거나 한번이상
		if(!regExp.test(obj.value)){
			alert("한글만 입력해주세요.");
			document.getElementById("mem_name").value="";
		}
	}
	function numCheck(e)  {
		  e.value = e.value.replace(/[^0-9]/ig, '')
	}
	</script>
</body>
</html>