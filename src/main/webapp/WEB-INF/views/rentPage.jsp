<%@page import="java.time.LocalDate"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="Pack.bookBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출 화면</title>
<style>
#table1 {
	float: left;
	margin-right: 25px;
}

h1 {
	margin-left: 247px;
}

tr.table1  {
	width: 30px;
}

.subbtn {
	margin-top: 20px;
    width: 547px;
    height: 45px;
}
</style>
<%
	String mem_id = (String)request.getAttribute("mem_id");
	// String ad_id = (String)request.getAttribute("ad_id");
	String adid = "1234"; //일단 하드코딩함. admin 아이디받아오야뎀
	String reserve_date = (String)request.getAttribute("reserve_date");
	LocalDate now = LocalDate.now();
	String rentDate = Integer.toString(now.getYear()) +	Integer.toString(now.getMonthValue()) + Integer.toString(now.getDayOfMonth());
	String returnDate = Integer.toString(now.plusDays(14).getYear()) +	Integer.toString(now.plusDays(14).getMonthValue()) + Integer.toString(now.plusDays(14).getDayOfMonth());
	//여기 14는 대여 일수임
	
	String bookid = "";
	String rentSuccess = "";
	rentSuccess = (String)request.getAttribute("rentSuccess");

%>
</head>
<body>
<input type="hidden" id="btnOnOff" value="${btnOnOff}">
<label><%=mem_id%></label>
<h1>대출</h1>
<form action="rentPage" method="get">
	<input type="hidden" value="<%=mem_id%>" name="mem_id">
	<input type="hidden" value="<%=rentSuccess%>" id="rentSuccess">
	도서ID : <input type="text" name="b_id" value="">
	<input type="submit" value="확인">
</form>
<br/>
<hr/>
<div id="table1">
	<a>도서 정보</a>
	<table border="1" class="table1">
		<tr>
			<td>도서 ID</td>
			<td>제목</td>
			<td>저자</td>
			<td>출판사</td>
			<td>대출여부</td>
			<td>예약여부</td>
		</tr>
<%
	List<bookBean> bB = (List<bookBean>)request.getAttribute("bB");
	if(bB != null) {
			for(bookBean b : bB) {
				bookid = b.getB_id();
				%>
				<tr>
					<td><%=b.getB_id()%></td>
					<td><%=b.getB_name()%></td>
					<td><%=b.getB_author()%></td>
					<td><%=b.getB_publisher()%></td>
					<td>${return_date}</td>
					<td>${reserve_date}</td>
				</tr>
				<%
				break;
			}
	}
%>
	</table>
</div>

<div id="table2">
	<a>예약 정보</a>
	<table border="1" class="table2">
		<tr>
			<td>예약자 ID </td>
			<td>예약 신청 일자 </td>
		</tr>
<%
	if(bB != null) {
			for(bookBean b : bB) {
			    if(b.getReserve_date() != null) {
					%>
					<tr>
						<td><%=b.getMember_mem_id()%></td>
						<td><%=b.getReserve_date()%></td>
					</tr>
					<%
			    }
			}
	}
%>
	</table>
</div>
<form action="subRentPage" method="post">
	<input type="hidden" value="<%=rentDate%>" name="rent_date">
	<input type="hidden" value="<%=returnDate%>" name="return_date">
	<input type="hidden" value="1" name="rent_cnt">
	<input type="hidden" value="<%=bookid%>" name="book_b_id">
	<input type="hidden" value="<%=mem_id%>" name="member_mem_id">
	<input type="hidden" value="<%=adid%>" name="admin_ad_id">
	<input type="submit" value="대출 승인" class="subbtn">
</form>

<script type="text/javascript">
	const btnOnOff = document.querySelector('#btnOnOff').value;
	const rentSuccess = document.querySelector('#rentSuccess').value;
	const subbtn = document.querySelector('.subbtn');
	if(btnOnOff == 'OFF') subbtn.disabled = true;
	if(rentSuccess == 'success') alert('대여완료');
</script>

</body>
</html>