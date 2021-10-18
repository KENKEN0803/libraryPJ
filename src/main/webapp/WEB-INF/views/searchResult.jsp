<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>검색 결과</title>
    <script src="js/jquery.min.js"></script>
    <script src="js/qrcode.js"></script>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<body>
<%@include file="head.jsp" %>
<hr/>
<c:if test="${res.size()==0}">검색결과가 없습니다</c:if>
<c:if test="${res.size()!=0}">
    <c:forEach items="${res}" var="list">
        <form method="post" action="#" id="formId${list.b_id}">
            <input type="hidden" name="loginId" id="loginId" value="<%=session.getAttribute("member")%>">
            <input type="hidden" name="b_id" value="${list.b_id}">
            <input type="hidden" name="reserve_date" id="reserve_date${list.b_id}" value="">
        </form>
        <table style="margin: auto" width="50%">
            <tr>
                <td>
                	<img src="./images/bookcover/${list.b_ISBN}.PNG"
                    onerror="this.src='./images/bookcover/no-img.png'" width="250"/>
                </td>
                <td style="text-align: left">
                    <div style="font-weight: bold; font-size: large">도서명 : ${list.b_name}</div>
                    <br/>
                    <div style="font-weight: bold;">
                        BOOK ID : ${list.b_id}<br/><br/>
                        저자 : ${list.b_author}<br/>
                        출판사 : ${list.b_publisher}<br/>
                        장르 : ${list.b_genre}<br/>
                        ISBN : ${list.b_ISBN}<br/>
                        위치 : ${list.b_call_number}<br/>
                    </div>
                    <br/>
                    <c:if test="${list.return_date != null}">
                        <p style="color: #c60f13 ">대여중입니다. <br/>(반납 예정일 : ${list.return_date})</p>
                        <c:if test="${list.cnt<5}">
                            <button onclick="reserve('${list.b_id}')" class="btn btn-outline-primary btn-lg"
                                    id="btn${list.b_id}">예약하기
                            </button>
                            <img src="/images/loading.gif" id="img${list.b_id}"
                                 style="display: none; width: 30px; height: 30px">
                        </c:if>
                        <span id="span${list.b_id}">
                        (현재 예약 인수 : ${list.cnt}명)
                        </span>
                    </c:if>
                    <c:if test="${list.reserve_date == null && list.return_date == null}">
                        <img src="/images/book.png" style="width: 30px; height: 30px">
                        <span style="color: #113CFC; font-weight: bold">&nbsp; 대여가능</span>
                        <%--                        <button onclick="rent('${list.b_id}')" class="btn btn-outline-danger">대여 가능</button>--%>
                    </c:if>
                    <br/>
                    <br/>
                    <div id="${list.b_id}" style="display: none"></div>
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
    <div style="text-align: center">
        <button onclick="prevPage()" class="btn btn-outline-dark btn-lg">이전 페이지</button>
        <button onclick="nextPage()" class="btn btn-outline-dark btn-lg">다음 페이지</button>
    </div>
</c:if>
<hr/>
<script>
    const reserve = (bookId) => {
        const spanString = '#span' + bookId;
        const imgString = '#img' + bookId;
        const btnString = '#btn' + bookId;
        const formString = '#formId' + bookId;
        const formId = document.querySelector(formString);
        const mem_id = document.querySelector('#loginId').value;
        const btn = document.querySelector(btnString);
        const img = document.querySelector(imgString);
        const span = document.querySelector(spanString);
        btn.style.display = 'none';
        img.style.display = 'block';
        if (mem_id === 'null') {
            alert('먼저 로그인 해주세요');
            location.href = '/login';
            return false;
        }
        if (confirm('예약하시겠습니까?')) {
            fetch('/reserveCHK?id=' + bookId + '&userId=' + mem_id).then((response) =>
                response.json()).then((data) => {
                if (data.beforeReserveCHK[0].countReservedId > 0) {
                    alert('이미 동일 도서에 대한 예약 내역이 있습니다');
                    img.style.display = 'none';
                    span.innerHTML = '<b>❌ 이미 동일 도서에 대한 예약 내역이 있습니다 <br/> (현재 예약 인수 : ' + data.reserveCHK[0].cnt + '명)</b>';
                    return false;
                } else if (data.reserveCHK[0].cnt >= 5) {
                    alert('먼저 예약한 사람이 있습니다');
                    img.style.display = 'none';
                    span.innerHTML = '<b>❌ 먼저 예약한 사람이 있습니다 <br/> (현재 예약 인수 : ' + data.reserveCHK[0].cnt + '명)</b>';
                    return false;
                } else {
                    const dt = new Date();
                    formId.reserve_date.value = dt.getFullYear() + '-' + (dt.getMonth() + 1) + '-' + dt.getDate() + ' ' + dt.getHours() + ':' + dt.getMinutes();
                    formId.action = 'reserveSuccess';
                    fetch('/reserveSuccess', {
                        method: 'POST',
                        headers: {
                            "Content-Type": "application/json",
                        },
                        body: JSON.stringify({
                            'loginId': formId.loginId.value,
                            'b_id': formId.b_id.value,
                            'reserve_date': formId.reserve_date.value,
                        })
                    }).then((res) => {
                        res.json().then((res) => {
                            console.log('페치2', res);
                            img.style.display = 'none';
                            span.innerHTML = '<b>✅ 예약 완료! ✅</b>'
                            alert('예약이 완료되었습니다');
                        }).catch(err => {
                            btn.style.display = 'block';
                            img.style.display = 'none';
                            console.log('err', err);
                            alert(err);
                        })
                    })
                }
            }).catch(err => alert(err));
        } else {
            btn.style.display = 'block';
            img.style.display = 'none';
        }
    }

    const nextPage = () => {
        let start = <%=request.getParameter("start")%>;
        if (start == null) {
            start = 5;
        } else {
            start += 5;
        }
        location.href = '/searchResult?type=<%=request.getParameter("type")%>&inputValue=<%=request.getParameter("inputValue")%>&start=' + start
    }
    const prevPage = () => {
        let start = <%=request.getParameter("start")%>;
        if (start == null || start < 5) {
            start = 0;
        } else {
            start -= 5;
        }
        location.href = '/searchResult?type=<%=request.getParameter("type")%>&inputValue=<%=request.getParameter("inputValue")%>&start=' + start
    }
</script>

<%@include file="footer.jsp" %>
</body>
</html>
