<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width"/>
    <title>도서 추가</title>

</head>
<body>
<div class="total">

    <%@include file="headAdmin.jsp" %>
    <!-- ================================================================== -->
    <div class="row">
        <jsp:useBean id="recv" class="Pack.bookBean" scope="page"/>
        <jsp:setProperty name="recv" property="*"/>

        <h3>도서 추가</h3>
        <form onsubmit="return confirm('도서 정보를 등록 하시겠습니까?');" method=POST
              action="bookInsert" enctype="multipart/form-data">
            <table style="border:1; cellpadding:5; margin:auto;">
                <tr>
                    <td>도서명</td>
                    <td><input required type="text" name="b_name"
                               placeholder="도서명" value="이방인"></td>
                </tr>
                <tr>
                    <td>저자</td>
                    <td><input type="text" name="b_author" placeholder="저자"
                               value="알베르 카뮈" required></td>
                </tr>
                <tr>
                    <td>출판사</td>
                    <td><input type="text" name="b_publisher" placeholder="출판사"
                               value="더클래식" required></td>
                </tr>
                <tr>
                    <td>분류</td>
                    <td><input type="text" name="b_genre" placeholder="분류"
                               value="문학" required></td>
                </tr>
                <tr>
                    <td>ISBN</td>
                    <td><input type="text" name="b_ISBN" placeholder="ISBN"
                               value="9791155517628" required></td>
                </tr>
                <tr>
                    <td>청구기호</td>
                    <td><input type="text" name="b_call_number"
                               placeholder="청구기호" value="800.알970이" required></td>
                </tr>
                <tr>
                    <td>첨부파일</td>
                    <td><input type="file" name="file" id="fileInput"
                               onchange="sizeCheck(this)" accept="image/png">
                        <button type="button" onClick="this.form.reset()">삭제</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">첨부파일은 1MB 이하의 PNG 파일만 가능합니다.</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div style="text-align:center;">
                            <input type="submit" value="도서등록">
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
    <%@include file="footer.jsp" %>
</div>
</body>
</html>