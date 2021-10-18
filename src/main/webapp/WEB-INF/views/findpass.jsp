<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<style>
#jform {
	display: inline-block;
	text-align: center;
}
</style>
<body>
<div>
		<%@include file="head.jsp"%>
	</div>
		<div style="margin: auto; text-align: center;">
<jsp:useBean id="recv" class="Pack.memberBean" scope="page"/>
	<jsp:setProperty name="recv" property="*"/>
	<div id="jform">
		<fieldset >
		<legend>비밀번호 찾기</legend>
			<form method = "POST" action = "find_pass">
				<label>아이디  : </label>
				<input type = "text" name = "mem_id" required maxlength="15"><br>
				<label>이름    : </label>
				<input type="text" id="mem_name" name="mem_name" onchange="nameCheck(this)"required>
				<input type = "submit" value = "찾기"><br>
			</form>
		</fieldset>
		<a href='/login'>로그인 하기</a>
		
	</div>
	<div>
			<%@include file="footer.jsp"%>
		</div>	
</body>

	<script type="text/javascript">
	function nameCheck(obj)  {
		var regExp=/^[가-힣]+$/;
		//^ : 문자열 시작, $ : 문자열 끝, + 한번이거나 한번이상
		if(!regExp.test(obj.value)){
			alert("한글만 입력해주세요.");
			document.getElementById("mem_name").value="";
		}
	}
	</script>
</html>