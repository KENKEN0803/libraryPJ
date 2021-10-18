<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width"/>
    <title>DOUZONE LIBRARY</title>

</head>
<body>
<div class="total">

    <%@include file="headAdmin.jsp" %>
    <!-- ====================== 회원 검색 부분============================================ -->
    <div style="min-height: 405px;">
        <h1 align="center" style="margin-top: 10px">대여관리</h1>
        <hr/>
        <!-- 예시버튼입니다 참고하세여!! -->
        <form action="indexAdmin" method="get" style="margin-top: 90px;">
            <a style="float: left; font-size: 20px; padding-top: 8px; margin-left: 37%; color: black;">회&nbsp;&nbsp;&nbsp;&nbsp;원
                ID : &nbsp;</a>
            <input type="text" name="id"
                   style="width: 175px; background-color: #eeeeee; float: left; height: 28px; margin-right: 10px;">
            <input type="submit" value="확인"

                   style="background-color: rgb(118, 175, 107); color: white; width: 113px; height: 29px; border-radius: 20px;">
            <input type="button" value="반납" onclick="openReturn()"
                   style="background-color: rgb(118, 175, 107); color: white; width: 113px; height: 29px; margin-left: 150px; border-radius: 20px;">
        </form>
        <!-- ========================= 어드민 저장 ======================= -->
        <input type="hidden" value="admin" id="admin_id">
        <!-- ========================= 대여목록 조회 테이블======================= -->
        <%
            List<Map<String, Object>> mem = (List<Map<String, Object>>) request.getAttribute("mem");
            int index = 1;

            if (mem != null) {
        %>
        <a style="float: left; font-size: 20px; margin-left: 37%; color: black;">조회중 ID : &nbsp;</a>
        <a style="float: left; font-size: 20px; color: green; width: 185px; padding-left: 5px; font-weight: bolder;">${id}</a>
        <input type="hidden" value="${id}" id="memId">
        <input type="button" id="rentbtn" value="대출" onclick="openRent()"
               style="background-color: rgb(118, 175, 107); color: white; width: 113px; height: 29px; margin-bottom: 20px; border-radius: 20px;">
        <br/>
        <a style="font-size: 20px;  margin-left: 37%; color: black;">상태 : </a>
        <%
            if (mem.size() >= 5) {
        %>
        <a style="font-size: 20px; color: red;">대여불가 (최대 대여수 초과!!)</a>
        <%
        } else {
        %>
        <a style="font-size: 20px; color: blue;">대여가능</a>
        <%
            }
        %>
        <br/><br/>
        <input type="hidden" value="<%=mem.size()%>" id="rentCount">

        <table>
            <tr>
                <td style="width: 1515px;">
                    <div class="table" style="margin-left:5%; margin-right:5%; float: left; margin-top: 50px;">
                        <table>
                            <thead>
                            <tr>
                                </th>
                                <th colspan="8"> 대여 상태 <%=mem.size() %>권</th>
                            </tr>
                            <tr>
                                <th>BOOK ID</th>
                                <th>책 이름</th>
                                <th>책 저자</th>
                                <th>출판사</th>
                                <th>빌린 날짜</th>
                                <th>반납 예정일</th>
                                <th>연장</th>
                            </tr>
                            </thead>
                            <%
                                for (Map<String, Object> item : mem) {
                                    String extendCheck = String.valueOf(item.get("rent_cnt"));
                                    int extendCheckNum = Integer.parseInt(extendCheck);
                            %>
                            <tr>
                                <td><%=item.get("b_id")%>
                                </td>
                                <td><%=item.get("b_name")%>
                                </td>
                                <td><%=item.get("b_author")%>
                                </td>
                                <td><%=item.get("b_publisher")%>
                                </td>
                                <td><%=item.get("rent_date")%>
                                </td>
                                <td><%=item.get("return_date")%>
                                </td>
                                <td>
                                    <%
                                        if (extendCheckNum == 1 && item.get("book_b_id") == null) {
                                    %>
                                    <form onsubmit="return confirm('연장 하시겠습니까?');" method="Post"
                                          action="extendReturnDateSub">
                                        <input type="hidden" name="book_b_id" value="<%=item.get("b_id")%>">
                                        <input type="hidden" name="member_mem_id" value="${id}">

                                        <input type="submit" value="연장" style="border-radius: 20px;">
                                    </form>
                                    <%
                                    } else {
                                    %>
                                    <p style="color: red;">연장불가</p>
                                    <%
                                        }
                                    %>

                                </td>
                            </tr>
                            <% }
                            }%>
                        </table>
                    </div>

                    <!-- ========================= 예약 정보 조회 테이블 =======================-->

                    <c:if test="${res.size() ne null}">
                    <table style="margin-top: 50px;">
                        <thead>
                        <tr>
                            <th colspan="6"> 예약 상태 ${res.size()}권</th>
                        </tr>
                        <tr>
                            <th> BOOK ID</th>
                            <th> 도서명</th>
                            <th> 저자</th>
                            <th> 예약일</th>
                            <th> 취소</th>
                        </tr>
                        </thead>
                        <% int rownum = 1;%>
                        <c:forEach items="${res}" var="list">
                            <tr>
                                <td>
                                        ${list.b_id}
                                </td>
                                <td>
                                        ${list.b_name}
                                </td>
                                <td>
                                        ${list.b_author}
                                </td>
                                <td>
                                        ${list.reserve_date}
                                </td>
                                <td>
                                    <form onsubmit="return confirm('예약을 취소하시겠습니까?');" method=Post
                                          action="reserveDeleteAdmin">
                                        <input type="hidden" name="b_id" value="${list.b_id}">
                                        <input type="hidden" name="member" value="${id}">

                                        <input type="submit" value="취소" style="border-radius: 20px;">
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>

                </td>
            </tr>
        </table>
        </c:if>
    </div>

    <!-- =========================FOOOTER =============================== -->
    <%@include file="footer.jsp" %>
</div>

<script type="text/javascript">
    const rentCount = document.querySelector("#rentCount").value;
    const rentbtn = document.querySelector("#rentbtn");
    if (rentCount >= 5) {
        rentbtn.disabled = true;
    }

    function openReturn() {
        const adminId = document.querySelector("#admin_id").value;
        window.open("/returnPage?mem_id=" + adminId,"", "width=844,height=473");
    }

    function openRent() {
        const memId = document.querySelector("#memId").value;
        window.open("/rentPage?mem_id=" + memId,"", "width=844,height=473");
    }
</script>

</body>
</html>