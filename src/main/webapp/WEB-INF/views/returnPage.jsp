<%@page import="Pack.bookBean" %>
<%@page import="java.util.List" %>
<%@page import="java.time.LocalDate" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>반납 화면</title>
    <style>
        #table1 {
            float: left;
            margin-right: 25px;
        }

        h1 {
            margin-left: 247px;
        }

        tr.table1 {
            width: 30px;
        }

        .subbtn {
            margin-top: 20px;
            width: 547px;
            height: 45px;
        }

    </style>
    <%
        // 	String mem_id = (String)request.getAttribute("mem_id"); //반납은 반납자 아이디를 받을 필요가 없다.
// 	// String ad_id = (String)request.getAttribute("ad_id");
        String adid = "1234"; //일단 하드코딩함. admin 아이디받아오야뎀
        String reserve_date = (String) request.getAttribute("reserve_date");
        LocalDate now = LocalDate.now();
        String rentDate = Integer.toString(now.getYear()) + Integer.toString(now.getMonthValue()) + Integer.toString(now.getDayOfMonth());
        String returnDate = Integer.toString(now.plusDays(14).getYear()) + Integer.toString(now.plusDays(14).getMonthValue()) + Integer.toString(now.plusDays(14).getDayOfMonth());
        //여기 14는 대여 일수임

        String bookid = "";
        String returnSuccess = "";
        returnSuccess = (String) request.getAttribute("returnSuccess");

    %>
</head>
<body>
<input type="hidden" id="btnOnOff" value="${btnOnOff}">
<h1>반납</h1>
<form action="returnPage" method="get">
    <input type="hidden" value="<%=returnSuccess%>" id="returnSuccess">
    도서ID : <input type="text" name="b_id">
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
            List<bookBean> bB = (List<bookBean>) request.getAttribute("bB");
            if (bB != null) {
                for (bookBean b : bB) {
                    bookid = b.getB_id();
        %>
        <tr>
            <td><%=b.getB_id()%>
            </td>
            <td><%=b.getB_name()%>
            </td>
            <td><%=b.getB_author()%>
            </td>
            <td><%=b.getB_publisher()%>
            </td>
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
            <td>예약자 ID</td>
            <td>예약 신청 일자</td>
        </tr>
        <%
            if (bB != null) {
                for (bookBean b : bB) {
                    if (b.getReserve_date() != null) {
        %>
        <tr>
            <td><%=b.getMember_mem_id()%>
            </td>
            <td><%=b.getReserve_date()%>
            </td>
        </tr>
        <%
                    }
                }
            }
        %>
    </table>
</div>

<form action="subReturnPage" method="post">
    <input type="hidden" value="<%=bookid%>" name="book_b_id">
    <input type="submit" value="반납 승인" class="subbtn">
</form>

<script type="text/javascript">
    const btnOnOff = document.querySelector('#btnOnOff').value;
    const returnSuccess = document.querySelector('#returnSuccess').value;
    const subbtn = document.querySelector('.subbtn');
    if (btnOnOff == 'OFF') subbtn.disabled = true;
    if (returnSuccess == 'success') alert('반납완료');
</script>
</body>
</html>