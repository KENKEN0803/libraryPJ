<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width" />
<title>도서 정보 수정</title>

</head>
<body>
	<div class="total">

		<%@include file="headAdmin.jsp"%>
		<!-- ================================================================== -->
		<div class="row">
			<jsp:useBean id="recv" class="Pack.bookBean" scope="page" />
			<jsp:setProperty name="recv" property="*" />
			
			<h3>도서 정보 수정</h3>
			<form onsubmit="return confirm('도서 정보를 수정하시겠습니까?');" method=POST
				enctype="multipart/form-data" action="bookUpdateInfo">
				<table style="border:1; cellpadding:5; margin:auto;">
					<tr>
						<td>도서명</td>
						<td><input required type="text" name="b_name"
							placeholder="도서명" value="${res[0].b_name}" required></td>
					</tr>
					<tr>
						<td>저자</td>
						<td><input type="text" name="b_author" placeholder="저자"
							value="${res[0].b_author}" required></td>
					</tr>
					<tr>
						<td>출판사</td>
						<td><input type="text" name="b_publisher" placeholder="출판사"
							value="${res[0].b_publisher}" required></td>
					</tr>
					<tr>
						<td>분류</td>
						<td><input type="text" name="b_genre" placeholder="분류"
							value="${res[0].b_genre}" required></td>
					</tr>
					<tr>
						<td>ISBN</td>
						<td><input type="text" name="b_ISBN" placeholder="ISBN"
							value="${res[0].b_ISBN}" required></td>
					</tr>
					<tr>
						<td>청구기호</td>
						<td><input type="text" name="b_call_number"
							placeholder="청구기호" value="${res[0].b_call_number}" required>
							<input type="hidden" name="b_id" value="${res[0].b_id}">
						</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><input type="file" name="file" id="fileInput"
							onchange="sizeCheck(this)" accept="image/png">
							<button type="button" onClick="this.form.reset()">삭제</button></td>
						<!-- 보안상의 이유로 input file 타입은 read only 이기 때문에 value 지정 불가 -->
					</tr>
					<tr>
						<td colspan="2">첨부파일은 1MB 이하의 PNG 파일만 가능합니다.</td>
					</tr>
					<tr>
						<td colspan="2">
						<div style="text-align:center;">
						<input type="submit" value="도서 정보 수정">
						<button type="button" onclick="history.back()">취소</button>
						</div>
						</td>
					</tr>
				</table>
				<script>
					function sizeCheck() {
						var size = document.getElementById("fileInput").files[0].size;

						if (size > 1048576) {
							alert("1MB 이하의 파일만 업로드 가능합니다.");
							document.getElementById("fileInput").value = "";
						}
					}
				</script>
			</form>
		</div>
		<!-- =========================FOOOTER =============================== -->
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>