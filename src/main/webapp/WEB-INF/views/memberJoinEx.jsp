<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width"/>
    <title>회원 가입 안내</title>
</head>
<body>
<div class="total">
    <%@include file="head.jsp" %>
    <!-- ================================================================== -->
    <div class="row">
        <h3>가입안내</h3>
        <div
                style="border: 1px solid; padding: 10px; width: 630px; margin: auto; text-align: center;">
            부산광역시 공공도서관 회원으로 기가입한 회원은 별도 가입 없이 도서관 포털을 이용하실 수 있습니다.
        </div>
        <br/> <br/>
        <ul>
            <li><h4>·회원가입자격</h4></li>
            <div style="margin-left: 30px;">부산광역시 주민등록이 되어 있는 자(부산광역시에 소재한
                학생 및 직장인 포함)
            </div>
            <br/>
        </ul>
        <ul>
            <li><h4>·회원가입절차</h4></li>
        </ul>
        <div style="margin-left: 150px;">
            <img src="./images/memregister.png"/>
        </div>
        <ul>
            <li><h4>·본인확인 구비서류(도서관 방문 시)</h4></li>
        </ul>
        <table style="margin: auto;">
            <tr>
                <td>구분</td>
                <td>대상</td>
                <td>구비서류</td>
                <td>비고</td>
            </tr>
            <tr>
                <td rowspan="2">부산시민</td>
                <td>14세 미만</td>
                <td>보호자 신분증 및 주민등록등본</td>
                <td>보호자 동행</td>
            </tr>
            <tr>
                <td>14세 이상</td>
                <td>신분증 또는 학생증</td>
                <td>-</td>
            </tr>
            <tr>
                <td rowspan="2">타지역시민</td>
                <td>부산소재 학교 재학생</td>
                <td>재학증명서 및 신분증</td>
                <td>-</td>
            </tr>
            <tr>
                <td>부산소재 회사 직장인</td>
                <td>재직증명서 및 신분증</td>
                <td>-</td>
            </tr>
            <tr>
                <td>외국인</td>
                <td>부산시 거주</td>
                <td>외국인 등록증</td>
                <td>-</td>
            </tr>
        </table>
        <br/>
        <div style="text-align: center">
            <input type="button" value="회원가입" onclick="location.href='Join'"
                   style="border:0; background-color: rgb(118, 175, 107); color: white; width: 200px; height: 40px;">
        </div>
    </div>
    <!-- =========================FOOOTER =============================== -->
    <%@include file="footer.jsp" %>
</div>
</body>
</html>