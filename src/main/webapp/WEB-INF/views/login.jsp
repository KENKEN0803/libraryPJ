<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Pack.memberBean" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div>
    <%@include file="headClean.jsp" %>

    <div class="row" align='center'>
        <jsp:useBean id="recv" class="Pack.memberBean" scope="page"/>
        <jsp:setProperty name="recv" property="*"/>


        <form method=POST action="login_mem">
            <div>
                <table width="500px" height="250px" border="1" cellpadding="5" align="center"
                       style="box-shadow:gray 0px 5px 3px 0px;">
                    <tr>
                        <th colspan="2" style="text-align: center; font-size: larger"><br/>회원 로그인<br/><br/></th>
                    </tr>
                    <tr>
                        <td style="text-align: center; font-weight: bold">아이디</td>
                        <td>
                            <input required type="text" name="mem_id" placeholder="아이디" maxlength="15" value="<%=
					(recv.getMem_id() == null) ? "" : recv.getMem_id()
					 %>">
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center; font-weight: bold">비밀번호</td>
                        <td>
                            <input type="password" name="mem_pass" placeholder="비밀번호" required maxlength="20">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center"><input type="submit" value="로그인"
                                                                          class="btn btn-dark btn-lg">
                        </td>
                    </tr>
                </table>
            </div>
        </form>
        <div align="center">
            <button onclick="location.href='/index_adm'" class="btn btn-outline-dark btn-lg">관리자 로그인</button>
            <button onclick="location.href='/findid'" class="btn btn-outline-dark btn-lg">아이디 찾기</button>
            <button onclick="location.href='/findpass'" class="btn btn-outline-dark btn-lg">비밀번호 찾기</button>
            <button onclick="location.href='/Join'" class="btn btn-outline-dark btn-lg">회원가입</button>
        </div>

    </div>
    <%@include file="footer.jsp" %>
</div>
</body>
</html>