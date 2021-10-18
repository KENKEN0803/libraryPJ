<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <script src="js/jquery.min.js"></script>
    <script src="js/qrcode.js"></script>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width"/>
    <title>관리자 검색 결과</title>
</head>

<body>
<div class="total">
    <%@include file="headAdmin.jsp" %>
    <!-- ================================================================== -->
    <div class="row">
        <form action="/M_searchResult" method="get">
            <div style="display:inline-block;">
                <select name="type">
                    <option value="combine">통합 검색</option>
                    <option value="name">제 목</option>
                    <option value="author">저 자</option>
                    <option value="publisher">출 판 사</option>
                    <option value="ISBN">I S B N</option>
                </select>
            </div>
            <div style="display:inline-block;">
                <input type="text" name="inputValue">
            </div>
            <div style="display:inline-block;">
                <button type="submit">전송</button>
            </div>
        </form>
        <hr/>
        <c:if test="${res.size()==0}">검색결과가 없습니다</c:if>
        <c:if test="${res.size()!=0}">
            <c:forEach items="${res}" var="list">
                <table border="1" style="margin: auto" width="50%">
                    <tr>
                        <td>
                            <img src="./images/bookcover/${list.b_ISBN}.PNG"
                                 onerror="this.src='./images/bookcover/no-img.png'"
                                 width="250"/>
                        </td>
                        <td>
                            <div style="font-size:17px; font-weight:bold;">
                                도서명 : ${list.b_name}</div>
                            <br/>
                            저자 : ${list.b_author}<br/>
                            출판사 : ${list.b_publisher}<br/>
                            장르 : ${list.b_genre}<br/>
                            ISBN : ${list.b_ISBN}<br/>
                            S / N : ${list.b_id}<br/>
                            P / N : ${list.b_call_number}<br/>
                            <c:if
                                    test="${list.return_date == null}">
                                <p>대여 가능</p>
                            </c:if>
                            <c:if test="${list.return_date != null}">
                                <p>대여중입니다. <br/>(반납 예정일 : ${list.return_date})</p>
                            </c:if> <c:if test="${list.reserve_date != null}">
                            <p> 예약중입니다. <br/>(예약 인수 : ${list.cnt}명) </p>
                        </c:if>
                        </td>
                        <td>
                            <form action="/M_searchResult" method=Post>
                                <button type="button"
                                        onclick="location.href='/bookUpdate?type=id&inputValue=${list.b_id}'">도서수정
                                </button>
                            </form>
                            <form onsubmit="return confirm('도서를 삭제하시겠습니까?');" method=Post
                                  action="bookDelete">
                                <input type="hidden" name="b_id" value="${list.b_id}">
                                <input type="submit" value="도서 삭제">
                            </form>
                            <br/>
                            <div id="${list.b_id}"></div>
                            <script>
                                var qrcode = new QRCode(document.getElementById("${list.b_id}"), {
                                    text: JSON.stringify({
                                        b_name: `${list.b_name}`,
                                        b_author: `${list.b_author}`,
                                        b_publisher: `${list.b_publisher}`,
                                        b_genre: `${list.b_genre}`,
                                        b_ISBN: `${list.b_ISBN}`,
                                        b_id: `${list.b_id}`,
                                        b_call_number: `${list.b_call_number}`,
                                    }),
                                    width: 200,
                                    height: 200,
                                    colorDark: "#000000",
                                    colorLight: "#ffffff",
                                    correctLevel: QRCode.CorrectLevel.L
                                });
                            </script>
                        </td>
                    </tr>
                </table>
            </c:forEach>
            <hr/>
            <button onclick="prevPage()" class="btn btn-outline-dark">이전 페이지</button>
            <button onclick="nextPage()" class="btn btn-outline-dark">다음 페이지</button>
        </c:if>
        <hr/>
    </div>
    <!-- =========================FOOOTER =============================== -->
    <%@include file="footer.jsp" %>

</div>
</body>
<script>
    const nextPage = () => {
        let start = <%=request.getParameter("start")%>;
        if (start == null) {
            start = 5;
        } else {
            start += 5;
        }
        location.href = '/M_searchResult?type=<%=request.getParameter("type")%>&inputValue=<%=request.getParameter("inputValue")%>&start=' + start
    }
    const prevPage = () => {
        let start = <%=request.getParameter("start")%>;
        if (start == null || start < 5) {
            start = 0;
        } else {
            start -= 5;
        }
        location.href = '/M_searchResult?type=<%=request.getParameter("type")%>&inputValue=<%=request.getParameter("inputValue")%>&start=' + start
    }
</script>
</html>
