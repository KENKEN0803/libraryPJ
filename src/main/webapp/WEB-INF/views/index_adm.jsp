<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<style>
    #jform {
        display: inline-block;
        text-align: center;
    }
</style>
<body>
<div>

    <%@include file="headClean.jsp" %>

</div>
<div style="margin: auto; text-align: center;">
    <jsp:useBean id="recv" class="Pack.adminBean" scope="page"/>
    <jsp:setProperty name="recv" property="*"/>
    <div id="jform">
        <form method=POST action="login_adm">
            <table width="500px" height="250px" border="1" cellpadding="5" align="center">
                <tr>
                    <td colspan="2" align="center" style="text-align: center; font-size: larger">관리자 로그인</td>
                </tr>
                <tr>
                    <td style="text-align: center; font-weight: bold">아이디</td>
                    <td><input required type="text" name="Ad_id"
                               placeholder="아이디" maxlength="15"></td>
                </tr>
                <tr>
                    <td style="text-align: center; font-weight: bold">비밀번호</td>
                    <td><input type="password" name="Ad_pass" placeholder="비밀번호"
                               required maxlength="20"></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center"><input class="btn btn-dark btn-lg" type="submit"
                                                                      value="로그인"></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div align="center">

    <button onclick="location.href='/login'" class="btn btn-outline-dark btn-lg">회원 로그인</button>
</div>
<div>
    <%@include file="footer.jsp" %>
</div>
</body>
</html>